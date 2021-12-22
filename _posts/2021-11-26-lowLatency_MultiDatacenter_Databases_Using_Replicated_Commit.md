---
layout: post
title:  "Low-Latency Multi-Datacenter Databases using Replicated Commit Note"
date: 2021-11-26 8:10:10 +0800
categories: [Distributed System]
tags: [LowLatency]
---

# Abstract.
Instead of replicating the transactional log, we replicate the commit operation itself, by running Two-Phase Commit multiple times
in different datacenters and using Paxos to reach consensus among datacenters as to whether the transaction should commit.  


# Motivaiton
![2PCOverPaxos](https://raw.githubusercontent.com/cheng1621/cheng1621.github.io/main/_posts/sample/2PCOverPaxos.png){: width="700" height="700" }
1. **cross-datacenter one-way trip**. inform the cohorts where the coordinator is.   
2. **cross-datacenter roundtrip**. Paxos leader needs to receive accepts from majority of replicas.    
3. **cross-datacenter one-way trip** cohorts inform the coordinator that the prepare phase is finished.   
4. **cross-datacenter roundtrip**. coordinator forward the commit log.   
5. **cross-datacenter one-way trip** coordinator sends commit message to cohorts.   
6. **cross-datacenter roundtrip**. cohorts receive accepts from majority of replicas.   

# Replicated Commit
1. all replicas of a data item are peers means there is no leader. Each server has its own lock table.  
2. Advantage: avoid the latency of leader election. usually, two consecutive election takes 10 s in Spanner.  
3. Disadvantage: Read Operations should send requests to all replicas and waits for response from all of them.

# Result.
![PaxosOver2PC](https://raw.githubusercontent.com/cheng1621/cheng1621.github.io/main/_posts/sample/PaxosOver2PC.png){: width="700" height="700" }
1. **cross-datacenter one-way trip**. clients send message to all coordinaters.  
2. 2PC only happens inside datacenter.  
3. **cross-datacenter one-way trip**. coordinator should communicate with each other and respond to client after 2PC is finished.  
4. coordinator sends commit to cohorts inside datacenter.  
