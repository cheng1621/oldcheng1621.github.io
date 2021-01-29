---
layout: post
title:  "Computer NetWork Note"
date: 2020-01-02 23:17:10 +0800
categories: [Computer Network]
tags: [Computer Network]
---
# Chapter 1. 
packet-switching: hosts break application-layer messages into packets.  
circuit switching: `FDM` and `TDM`.  
packet delay: 4 types of delay: nodal processing, queueing delay, transmission delay, propagation delay.  

`5 layers`: 
application --> (presentation) --> session --> transport --> network --> link --> physical.  
`application` : FTP, SMTP, HTTP.  
`presentation` : encryption.  
`session` : synchronization.  
`transport` : TCP, UDP.  
`network` : IP and routing protocol.  
`link` : Ethernet.  
`physical` : ....   


# Application.  
`HTTP`: 
1. TCP connection.  
2. RTT(time for a small packet to travel from client to server and back.)  
3. Time: 2RTT + transmission time.  
4. Persistent HTTP: leaves connection open after sending response.  

`HTTP/1.0` and `HTTP/1.1`: 
Both: Get, post, head.   `HTTP/1.1`: put, delete.  

`DNS`: map ip to name;  
