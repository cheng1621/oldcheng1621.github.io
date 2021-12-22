---
layout: post
title:  "ZooKeeper Note"
date: 2021-01-02 23:17:10 +0800
categories: [Distributed System]
tags: [Distributed System,Zookeeper]
---
# Abstract
Zookeeper: high performance instead of wait-free property. FIFO requests and linearizability for all requests.

# Introduction.
Instead of implementing the server side, Zookeeper opted to implement application side. That implementation of coordination kernel enables primitive without requesting change to core service. In Zookeeper, blockint primitive are moved away because wait-free property is really important for fault-torelance and high performance. Method: ***FIFO*** client ordering, ***linearization***.

# Zookeeper Service.
## Service Overview
`sequential flag`: monotonically increasing counter.   
`Watches`: one-time triggers associated with a session, used to tell the client that the value is changed even though the value is returned.  
`Data Model`: Not designed for general data storage. Instead, it map to the abstraction of the tree, (metadata)  
`metadata`: configuration info, shared data storage location, version of znode.  
`Session`: Initialized when client connects to Zookeeper. ***Timeout*** is provided and state changes are observed within the session.
***znode*** is organized in hierarchical name space tree.  
client can create two znode: ***Regular*** and ***Ephemeral***.  
## Client API
`create(path,data,flags)`: create a znode.  
`delete(path,version)`  : delete a znode at expected version.  
`exists(path, watch)` : return true if znode is existed.  
`getData(path, watch)` : Return data.  
`setData(path, data, version)` : write something to znode.  
`getChildren(path, watch)` : return name of the set and children of a node.  
`sync(path)` : waits for all updates pending at the start to propagate to the server.  
Zookeeper has ***synchronous*** and ***asynchronous*** version. Failure happens if the version is not matched.  
all API has a parameter named path, which means that zookeeper access znode through path. In that case, some API like ***open*** and ***close*** could be simplified and some extra data can be eliminated.  

## Zookeeper guarantees.
two guarantees: `Linearizable writes` and `FIFO client order`..  
two main points : 1. other processes cannot use configuration if one process make a change to it. 2. a process can only use whole process instead of partial process.  
one problem can be further discussed: what if a process read a ***ready*** node and start reading and at the same time a leader make a change to it. (ordering guarantee for notifications.)  

## Examples of primitives.
the paper lists some of primitives, such as ***Configuration Management***, ***Rendezvous***, ***Group Membership***, ***Locks***. all these primitives show one key thought, ***a process can create a new ephemeral znode with some metadata***.  

`simple locks`: many clients would compete for the locks with herd effect.  
`Locks without herd effect` : all the requests are lined up.   
`Double Barrier` : synchronize the beginning and the end of computation.  

# Zookeeper Applications.
## Fetching Service
Zookeeper is used to manage the ***configuration metadata***. When decoupling clients from servers, it guarantee the requests go to healthy service.  
## Katta
Divide the work of indexing using shards.  
## Yahoo! Message Broker. 
manage three parts: `configuration metadata`, `failure detection` and `group membership`.  

# Zookeeper implementation.
`read` requests: serviced from local replica of server database.  
`write` requests: serviced from agreement protocol. (leader broadcasts to followers and replicate.)  
## Request Processor
future state, version must be calculated when applying something to state machine to guarantee consensus. If successful `TXN` should be returned and otherwise, `errorTXN` is returned.  

## Atomic Broadcast.
changes to Zookeeper are throught ***Zab***. To keep high throughput, Zookeeer keep processing pipeline full and guarantee the changes are in the order the clients sent.  
Normally, Zab delivered all the messages once, but it does not know whether the message is delivered successfully or not.  

## Replicated Database
Snapshot is required in case of recovery.  

## Client-Server Interactions
note:  
1. when one write is processing, no other write and read are executing concurrently.   
2. when one read operation is returned, a tagged parameter named zxid corresponding to last transaction is returned.  
3. a stale value maybe returned if using fast reads. Solved by `sync`.  
4. timeout.  

***(at this time, I care less about the performance of the Zookeeper.)***