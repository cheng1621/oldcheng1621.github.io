---
layout: post
title:  "Computer Network Note"
date: 2021-06-05 19:10:10 +0800
categories: [Design Pattern]
tags: [Design Pattern]
---

# Application layer
## HTTP.
### Overview. 
it uses TCP as underlying transport protocol. it maintains no information about the client.(stateless).  
### non-persistent and persistent connections.  
each request or response is sent over a seperate connection vs ... over the same TCP connections.  
(3 way handshake: 1. send a small TCP segment to server. 2. servers acknowledge the response. 3. client acknowledge back to the server)  

### Message Format
GET: include data in the requested URL.  
POST: fill out a form.  
HEAD: response with HTTP message but leaves out the requested object.  
DELETE: delete the object on web servers.  
#### Some common status code.
301: move permanently.  
400: bad request.(could not be understood by the server.)  
404: not found.  
505: HTTP version not supported.  

### Cookies. 
used to identify users.  

### web caching.
it is also known as proxy server.(satisfies HTTP request on behalf of an origin web server.)
two function: 1. reduce response time for request. 2. reduce the whole traffic in network.  
problem: if the object is stale. ans: conditional get(if-modified-since).  

## electronic mail
user agent -> sender's server -> receiver's server -> receiver's user agent.  
### POP3. 
TCP connection. three phases: authorization, transaction, update.
### IMAP.
create folders on remote servers.  

## DNS.  
translate hostname to IP address. UDP protocol, port: 53.

## DASH
the video is encoded into several different versions. it allows clients with different internet access rate to stream in different encoding retes.  

## CDN.
suppose there's one data center and client has to cross many communication links, resulting in delay for users.  
two service: determine a suitable CDN for clients and redirect client's request to server.  

# Transport Layer.
provide communication services to application process and provides logical-communication between hosts.  
(IP makes its effort to deliver segments between communication hosts, but makes no guarantees.);  

## Overview.
> difference between TCP and UDP.  
TCP provides `reliable data transfer`, `congestion control`. UDP: `unreliable data transfer`.  

## multiplexing and demultiplexing.  
demultiplexing: deliver the data to socket.  
mutiplexing: group the data in different sockets and encapsulate each chunk with header information.  

## UDP
no handshaking, it is said to be `connectionless`.  
8 bytes overhead.  

### UDP segments. 
4 parts,(each for 2 bytes). source port, destination port, length, checksum..  

### Checksum.
1's complement.  

## TCP.
full-duplex. 

### segment structure. 
header: 20 bytes. 

### flow control.
client maintain a receive window.

### 3-way handshake.
(problem SYN flooding)
1. sends a segment encapsulated in IP datagram. (SYN = 1, Seq = random number);  
2. server allocates TCP buffers. send connection-granted segment back to client.  
3. allocate buffer and variable, but set SYN bit to zero.(can carry data.)

client state:  
close -> syn_send -> established -> FIN_wait1 -> fin_wait2 -> time_wait -> close.  
server state:  
close -> listen -> SYN_received -> established -> close_wait -> last_ack -> close.  

problem1:  
if the server does not accept the segment on port 80 while the destination of the segment is port 80, server sends `reset` segment to host.(TCP);
host would send `ICMP` datagram. (UDP);

### congestion control.  
slow start -> congestion avoidance -> fast recovery


# network layer
## Switching. 
1. switching via memory. it is seen as device I/O.  
2. switching via a bus. all output ports receive packets, but only one which matched the label can keep the packet.  
3. switching via an interconnection network.  (overcome the bandwidth limitation.) capable of sending the packet in parallel.  

### packet switching.
FIFO, priority queue, Round Robin and Weighted Fair Queuing(WFQ)
WFQ: suppose there are several priority queues. Scheduler check priority class one by one, if one class is empty, it check the next class immediately instead of waiting.  

## IPv4.  
structure: 20 bytes.  
`version number`: 4 bits.  `header length`, `type of service`.  
`length of datagram`: 16 bits, not bigger than 1500 bytes.  
`offset` : offset. `time to live`, `checksum`, `source and destination IP` and `data`.  
`flag of last datagram is set to 0 while the others are set to 0;`  

### IPv4 addressing.  
`subnet mask`: means `/24` in IP portion.  
`exception`: a host sends a datagram with IP 255.255.255.255 would be delivered to all hosts on the same subnet.  
`DHCP`: allocates different IP to a given host each time the host connects to the network. (UDP).  

### NAT. (network address translation.)
translate the local address to public address.  

## Ipv6.  
### datagram format.  
128 bits. `header`: 40 bytes. `flow label`. `version`, `traffic class`. `next header`, `hop limit`. 
`source and destination address`.  
`fragmentation/reassembly`: IPv6 does not allow fragmentation or reassembly at the intermediate routers. it can be performed only by the source and destination. IPv6 would send an ICMP error if the packet is too big.  
`checksum` and `option`.  

### transition from IPv4 to IPv6
sending host: take entire IPv6 datagram and put it in IPv4 datagram. Then the Ipv4 datagram addressed to Ipv6 node on the receiving side of `tunnel`. 

## Generalized Forwarding and SDN.  

# Control plane.
`per-router control`: OSPF & BGP protocols.  
`logically centralized control`: controller computes and distributed forwarding tables to be used by each and every router. 

## routing algorithm.  
`centralized routing algorithm`: be aware of the cost of each link in the network. (LS algorithm)
`decentralized routing algorithm`: no node has complete information about costs of all nodes. (DS algorithm);  
### LS algorithm.  
`Dijkstra’s algorithm`: computes the least-cost path from one node to all the other node in the network. (iterative);  

### DV algorithm.  
a node x updates its distance-vector estimate when it either sees a cost change in one of its directly attached links or receives a distance-vector update from some neighbor.  

## OSPF.(Intra-AS Routing in the Internet).
two reasons: `Scale` and `administrative autonomy`.
`LS algorithm`.  

- Advances:
    - Security. only trusted routers can participate in OSPF protocol within AS.  
    - Multiple same-cost paths. 
    - ...

## BGP.
all ASs run the same inter-AS routing protocol.  
two connections: `eBGP`(a BGP connection spans two ASs), and `iBGP`: routers in the same ASs.  

### BGP attributes. 
`AS-path`: contain the list of ASs through which the advertisement has passed.  
`NEXT-HOP`: IP address of the router interface that begins the AS-PATH.  
`destition prefix`: 192.168.1.0/22. 1024 IPs.  

### hot potato algorithm 
send packet to others as soon as possible, not care which way it should go.  

### Route-selection algorithm. 
note: if more than one routes arrive to one prefix, BGP sequentially invokes the following elimination rules until one route remains.  

### IP-anycast.
based on `route-selection algorithm` to pick the best path.  

## SDN control plane.(???)
OpenFlow protocol is implemented in controller layer.  

## ICMP(internet control message protocol)
it is used by hosts and routers to communicate network-layer information with each other.
it is carried in IP datagram. 

note: `ping` sends `ICMP type 8 code 0` message to host. `traceroute` also uses ICMP.  

## network management. SNMP.
application-layer protocol.  
### framework
- managing server.
- managed device.
- MIB.

























# explain.
id | selection type | table | partitions | type | keys | rows | filtered.