---
layout: post
title:  "frangipani"
date: 2021-12-06 19:10:10 +0800
categories: [frangipani]
tags: [frangipani]
--- 

# Introduction
# Logging and Recovery.
1. when work station starts to update something on the file, write-ahead log is implemented in two places. first is the cache in the work station, and the other one is in the Petal.  
2. When work station1 crashes, but before releasing the lock (means the data after updated is still in work station1's cache), another work station2 could see the log of WS1 and can replay the log.  
3. Version number could be used to replay the necessary log.  

# synchronization and cache coherance.
1. multiple-read/single write lock.  
2. Invalidate the data if read lock is asked to released.  
3. write **dirty data** into disk when write lock is asked to released.  

***deadlock***
1. consists of two phases. 1st phase: acquire lock. 2nd phase: update the cache. (check the object which is related to 1st phase whether it is modified or not since acquiring the lock). if not. Commit. if it is modifiec, go back to phase 1.  

# lock service.
***scenario***:  
1. client could retain the lock until other client request it.  
2. client fails to renew the lease due to network failure (not crashes), file server should block all the subsequence requests and be unmounted to clear the error conditions.  

***Implementation***  (schemes)
1. one centralized lock service. (maybe cause performance problem)  
2. write the lock state to Petal (also causes performance problems)  
3. fully distributed. (Consists of Clerk Module).  (**asyncchronous message** is better than **RPC**?)

# Adding or removing the servers.
Easy, just shut it down when removing the servers, and tell the new server where is the Petal servers and lock server if adding the new servers.  

# Some other Notes:
![frangipany_Concurrent_write](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/frangipani_Concurrent_write.png){: width="600" height="200" .normal}

**avoid conflict of write and operation happens at the same time**  


![frangipani_Version](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/frangipani_Version.png){: width="600" height="200" .normal}

**Version number**  