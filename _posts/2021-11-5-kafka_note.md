---
layout: post
title:  "kafka Note"
date: 2021-11-05 8:10:10 +0800
categories: [kafka]
tags: [MQ]
pin : true
---

# Introduction.
Implemented in **PacificA**.

# Design
## Persistence.
**pagecache-centric design** and **zero copy**.  

### constant time suffice.
instead of using B-Tree, persistence queue is being built. O(1).  
Note: we can keep the message as long as we want.  

## Efficiency.
1. group the message together before sending it to the internet.  
2. zero copy.

## producer & consumer.
poll for producer and pull for consumer.

## Message Delivery Semantics
1. at-most-once.  
2. at-least-once.  
3. exactly-once.  

## replication. 
a node is alive should satisfy two conditions.
1. maintain session with zookeeper.
2. replicate the write and not not fall "too far" behind.  

### others.
raft: to tolerate 1 failure, 3 replicas are needed.  
to solve this problem, ISR(in-sync replica) is needed.   

#### ISR. 
a write to partion is not considered as committed until all ISR replicas have received the write. and only the member of the set could be elected as leader.  
example: with f+1 replicas, kafka could tolerate f failures. 

##### Question. what if they all die.
it a problem about tradeoff between durability and availability.  
1. wait.  
2. choose the first replica.  

Question. if we choose durability over availability.   
1. disable unclean leader election.  
2. specify a minimun ISR window.  (it guarantees that the write can go to more than 1 replica and reduce the possibility that message is lost. )   

### replica Management.
avoid the situation that a high-volum partion is on a small amount of nodes.  
balance the leadership over each node.  

## log compaction.
1. take a snapshot for every key. 
2. delete old message.

## quota.
1. network bandwidth.  
2. CPU utilization.  