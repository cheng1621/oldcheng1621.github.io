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
Q: what transport service does an app need?  
data integrity, timing(interative games), throughput(multimedia), security.  

TCP service.  
flow control, congestion control, `do not` provided: timing, minimum throughput, security.  
UDP service.  
no flow control and congestion control.  

`HTTP`: 
1. TCP connection.  
2. RTT(time for a small packet to travel from client to server and back.)  
3. Time: 2RTT + transmission time.  
4. Persistent HTTP: leaves connection open after sending response.  
5. server maintains no information about past client requests.  

`HTTP/1.0` and `HTTP/1.1`: 
Both: Get, post, head.   `HTTP/1.1`: put, delete.  

`Cookie`:  
4 components:  
1. cookie header line of HTTP response message.  
2. cookie header line of next HTTP response message.  
3. cookie kept on host.  
4. back-end database at website.  

`DNS`: map ip to name;  

# Transport Layer
summary:   
two transport layer protocol, `TCP` and `UDP`.  
Difference between network layer and transport layer.  
> logical communication between app processes.  (transport layer)  
communication between hosts. (network layer.)  
  
TCP: congestion control, flow control, and connection setup.  

### Multiplexing/Demultiplexing.
multiplexing: handle data from multiple sockets, add transport header.  
demultiplexing: use header info to deliver received messages to correct socket.  

### UDP.
no handshaking between UDP sender. 8 bytes.  
error-detected: `checksum`..  
### Pipelined protocol.
1. Go back N: receiver only sends culmulative ack. sender has timer for oldest unacked packet.  
2. selective repeat: receiver sends individual ack for each packet.  

### TCP.





