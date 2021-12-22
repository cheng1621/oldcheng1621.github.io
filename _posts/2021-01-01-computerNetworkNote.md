
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
provide logical communication between app processes.  
break app messages into segments and passes it to network layer.  
two things cannot be guaranteed: delay and bandwidth.  

### Multiplexing/Demultiplexing.
multiplexing: handle data from multiple sockets.  
demultiplexing: send the segment to correct socket from the header info.  
  
TCP: congestion control, flow control, and connection setup.  

### Multiplexing/Demultiplexing.
multiplexing: handle data from multiple sockets, add transport header.  
demultiplexing: use header info to deliver received messages to correct socket.  

### UDP.
no handshaking between UDP sender. 8 bytes.  
error-detected: `checksum`..  
Q: Why does UDP provide a checksum as many link layer protocols (e.g., the popular Ethernet protocol) also provide error checking?  
A: No guarantee that all the links between source and destination provide error checking.  
   
### Pipelined protocol.
two protocol. (one is to send the whole N packet and the other is to send the exact one.)
1. Go back N: receiver only sends culmulative ack. sender has timer for oldest unacked packet.  
2. selective repeat: receiver sends individual ack for each packet.  

### TCP.


# Network layer.
two plane: data plane and control plane.  

### scheduling mechanism
First in first out.
### network layer.
routing protocol, IP protocol, ICMP protocol.  
key abstract: data format, fragmentation, IPv4 addressing, network addressing translation, Ipv6.  

##### Ip protocol. 
20 bytes for ip 4.  40 bytes for ip6.  

Q: DHCP process: broadcast-> get a respond -> request IP address -> server sends back ack msg.  


# control panel.
per-router control plane and logically centralized control plane.  
### routing protocols.  
determine 'good' paths from sending host to receiving host.  

### Dijkstra's algorithm. 
link costs known to all nodes.  
AS: autonomous systems.  

inter-AS: BGP. 
intra-AS: OSPF.
eBGP: neighboring 
iBGP: all AS-internal routers.  

BGP. (TCP)
AS-Path, next-hop.

Q: Why a logically centralized control plane?
easier network management
table based forwarding.  
distributed is more difficult.  

SDN.  
data plane switch -> controller -> control application.  
fast, simple, commodity, 

OpenFLow protocol. 
operates between controller, switch. 
based on TCP. 

ICMP. internet control message protocol.  

SNMP protocol. 


# Link Layer.
features: error detection, correction. sharing a broadcast channel. Ethernet. 
summary: communication channel that connect adjacent nodes. 
multiple links, Ethernet on the first link, and 802.11 on the last link.  

### service.
encapsulate datagrams into frame, adding header, 
MAC address.  
reliable delivery.  
flow control.. 
error detection and error correction.  

### Error detection. 
combine `EDC` to datagram.  
sender puts checksum value into UDP field.  

cyclic redundancy check.  

### multiple access protocol. 
two types: point-to-point, broadcast.  
single shared broadcast channel.  
collision if node receives two or more signals at the same time.  

### MAC protocol.  
1. channel partitioning.  
    TDMA(time division multiple access.) and FDMA.  
2. random access. 
    slotted ALOHA. efficienty: 0.37.    
    nodes start to transmit only slot beginning.  
    pros: simple.  Cons: collisions, idle slots. need closk synchronization.  
    CSMA(carrier sense multiple access): listen before transmit.  
    still with collision.  
    CSMA/CD. better for wired LANs.  better than ALOHA.  
3. taking turns. 
    polling: a master.  
    token passing. token passed from one node to next node. 
    cable access network.  


### LANs.
MAC addresses and ARP.  
48 bits. 
ARP: address resolution protocol.  
IP node(host router) <IP, MAC, TTL>

##### Ethernet. 
preamble: 7 bytes.
source address: 6 bytes .
connectionless, no handshaking between sender NICs and receiver NICs. 
unreliable: no Acks. 

table: <MAC, interface, TTL>

VLANs: virtual local area network.  
port-based VLAN.  
traffic isolation, dynamic membership, forwarding between VLANs.  

link virtualization
MPLS. multiprotocol label switching.  
MPLS can be based on source and destination address.  


