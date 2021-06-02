
---
layout: post
title:  "6.824"
date: 2021-05-30 09:19:10 +0800
categories: [Distributed System]
tags: [Distributed System,Raft]
---

情景：任何服务器都有可能在没有通知的情况下死机，并且一台服务器处理会造成超载，出现故障后可容错性和可恢复性差。
任务：实现一个K/V集群，支持`动态扩缩容`,`负载均衡`,`线性一致性`, `可容错` 和 `可恢复`。
流程：client 请求 Shard controller 获取当前的配置，把请求发到对应的物理节点，物理节点把请求放到对应的raft状态机中，直到状态机commit后返回结果给client。

# 基本架构。
`负载均衡`:  
对数据库进行碎片化，通过对key 哈希取模确定虚拟碎片节点，再由虚拟服务器确定物理服务器。  
![Picture1](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/fault_tolerant_system_1.png)  

`动态扩缩容`:  
用单独的一个raft集群 (Shard controller) 管理动态扩缩容。
![Picture2](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/fault_tolerant_system_2.png)  
Shard controller作用: 
1. 处理client发送的请求, 根据请求找到处理请求的物理节点。  
2. controller 帮助 物理节点找到它所负责的那一部分虚拟节点。  

`线性一致性`:
通过Raft共识算法实现线性一致性。
`a:1` --> `get(a)` --> `put(a : 2)` --> `get(a)`. 前一个get读到1， 后一个get读到2. 

`可容错`:  
每个节点都对应着由一组服务器，一个节点死机后由另一个服务器代替工作，服务器之间的一致性由raft管理。  

`可恢复`:  
`snapshot`快照 和 raft 日志回放。  

# 实现
### Shard controller.  
支持的请求类型：
1. `Query(n)`. 获取特定的配置。  
2. `join(group)` 增加物理节点。  
3. `leave(group)` 删除物理节点  
4. `move` : 改变虚拟节点对物理节点的映射。  
```
type ShardCtrler struct {
	mu      sync.Mutex
	me      int
	rf      *raft.Raft
	applyCh chan raft.ApplyMsg

	// Your data here.

	configs []Config // indexed by config num
	scClient map[int64]int64   // map clientId to SeqId
	// need channel
	LastCommitIndex int32
	dead int32
}
```
Shard controller 保存 配置信息（configs)，client 可以通过请求配置 得到 物理节点。物理节点通过请求配置得到要处理的虚拟节点。  
```
type Config struct {
	Num    int              // config number
	Shards [NShards]int     // shard -> gid
	Groups map[int][]string // gid -> servers[]
}
```
Shards: 物理节点对虚拟节点的映射。  
Groups: 物理节点对服务器的映射。  

难点：发生状态改变的时候尽可能地减少映射。

### 物理节点。
支持的请求类型：
1. `get`: 获取对应的值
2. `append/put`: 修改值。
```
type ShardKV struct {
	mu           sync.Mutex
	me           int
	rf           *raft.Raft
	applyCh      chan raft.ApplyMsg
	make_end     func(string) *labrpc.ClientEnd
	gid          int
	ctrlers      []*labrpc.ClientEnd
	maxraftstate int // snapshot if log grows this big

	kvShard []Shard
	LastCommitIndex int32
	persister *raft.Persister  // raft Persister.
	dead    int32 // set by Kill()
	config   shardctrler.Config
	sm       *shardctrler.Clerk
	service []int
}
```
每个物理节点维持一个`Shard`结构体,储存着对应的虚拟节点的数据。 保留着当前的配置（config). 和供可恢复的persister.  
```
type Shard struct{
	ShardId int
	KvDB map[string]string
	KvClient map[int64]int64
	Version int
}
```
思考：配置发生改变的时候，也就是说把虚拟节点的数据移到新的物理节点，假设检测到配置的改变和接收到client的get请求同时发生，是等待get 请求完成还是转移后再处理get?  
难点：如何在配置发生改变的同时仍能保证一致性和程序的正常运行。

### raft状态机
支持的功能：
1. 可用性。 5个服务器可忍受2个服务器死机
2. 一致性： 各个raft之间要实现数据的同步。
3. 分区。  5个服务器分成2/3。 分区一段时间后，合并后仍能恢复一致性。

##### 实现
每一个服务器对应着一个raft状态机。每个raft状态机有三个状态，`leader`, `candidate`, `follower`.  
选举：follower没有接收到来自leader的心跳后变成candidate发起投票。两种方式能获取选票，
1. candidate's log term 比 follower‘s log term 要高。  
2. term 相同的情况下，candidate's log 比 follower's log 要长。  
获取超过一半选票的时候就变成leader，然后发送心跳或者日志的复制。

难点：分区后合并仍能保证一致性，并注重各个协程中的同步过程。  

优化：
1. 假设一台服务器死机的时间过长，当它重新启动的时候，它会接收snapshot 和 log 回放，假设如下情况：
![Picture4](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/fault_tolerant_system_4.png)  

正常情况下，leader首先发送一个空的日志给follower，起点在1000，因为follower 不存在标号为1000 的日志，它就会返回一个错误值。  
然后leader对日志标号减一，这个时候会发送一个长度为1的日志，标号为999，但是follower 不存在，返回错误值。
...
直到日志首次发生错误的地方开始复制。


根据raft所说，要找到他们首次出现不同的地方开始复制，在上面leader 需要发送RPC 给 follower，


