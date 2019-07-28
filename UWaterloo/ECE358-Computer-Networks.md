# [ECE 358 Computer Networks](https://learn.uwaterloo.ca/d2l/le/content/463410/viewContent/2545984/View)

### [Intro](https://learn.uwaterloo.ca/d2l/le/content/463410/viewContent/2545984/View)

- **access networks** are provided by telecom operators (residential access, school network, cell tower)
- **network core** connects service providers, for routing and forwarding
  - routing algorithm uses a local forwarding table to select next link
- **packet-switching** is a method of breaking down a message into packets (a router is a switch in this case)
- **Store-and-forward** is one method of transmitting packets, where the entire packet must arrive (and checked for integrity) before it can be transmitted to the next link
- **stop-and-wait** send packet, wait for acknowledgement before continuing
- **message-switching** is store-and-forward at a message level
- if arrival rate exceeds transmission rate for a link, packets will queue and may be dropped
- **circuit-switching** is an alternative, each user gets dedicated path (each link has multiple edges, or "circuits")
  - provides strong guarantees of performance, but allows less users on the network
- ISPs give access to end users
  - connected by global ISPs
  - **internet exchange points** might connect global ISPs or **peering links**
- content provider networks are private to allow companies to go around Tier 1 (global) ISP
- `traceroute` unix utility for measuring delay from source to router
- **layering**
  - pros: explicit identification of each piece in the system, specify the relationship between different parts, modularize the system
  - cons: duplicate jobs done at different layers
- 5-layer view of the internet protocol stack
  - **application**
  - **transport** process-to-process
  - **network** host-to-host (planning the route via routing protocol)
  - **link** hop-to-hop
  - **physical** bit to analog signal
- packets are named more specifically at each layer: message, segment, datagram, frame
  - encapsulation: each abstraction wraps around the lower abstraction by adding a header
  - pros: modularization, protection
  - cons: overhead

### Lab
- **Kendall Notation** is used describe a queue: A/S/C/K/D, or arrival/server processing/count of servers/buffer size/discipline (FIFO)
  - markovian arrival process follows a poisson distribution (limit as period approaches zero for binomial)
  
### [Link Layer](https://learn.uwaterloo.ca/d2l/le/content/463410/viewContent/2561713/View), layer 2
- layer-2 packet is frame
  - header includes MAC address as source/dest
- data-link layer is responsible for transferring datagrams to physically adjacent nodes
- implemented across hardware, software and firmware
- **propagation delay** is time to propagate anything (usually distance / near speed of light)
- **transmission delay** is time to send all data (usually size / bandwidth)

#### Error detection and correction (EDC)
- error detection is not 100% reliable, in rare cases
- **parity** checking detects single bit errors
- cyclic redundancy check is a checksum algorithm, that can prevent up to r bit errors in any position, by appending a checksum of length r to the message and using some generator G where |G| = r + 1

#### Multiple access protocols
- **collision** when a node receives multiple signals simultaneously
- **multiple access protocol** is a distributed algorithm that determines how nodes share a channel (using the channel to communicate about channel sharing)
  - want high utilization and average fairness, with decentralized coordination

Three classes of Media Access Control (MAC) protocols
- **channel partitioning** to avoid collisions
  - time-division multi access (TDMA) has fixed slots and each client takes exactly one. Has wasted bandwidth unless all slots are filled
  - frequency division multiple access (FDMA), same pros/cons as TDMA
- **random access** allows collisions and recovers
- **taking turns** ensures high utilization with poor fairness

Random Access Protocols
- **Slotted ALOHA**: TDMA with size equal to frame, assuming all frames of same size, all nodes attempt to send and simultaneous shared slots are collisions and are rejected and attempted again, at some specified probability
  - requires clock synchronization, collisions + empties = wasted space, low efficiency for high number of nodes
- **Pure ALOHA**: no slots, higher chance of collision but no synchronization required
- **Carrier Sense Multiple Access**: listen before transmission, but due to propagation delay, collisions still occur
- **CSMA/ Collision detection (CSMA/CD)**: detected quickly, aborting transmission early
  - **exponential backoff** is increasing the wait time between transmissions by incrementing the max range on random number generation exponentially
- **CSMA/Collision avoidance (CSMA/CA)**: reduces the probability of collision by checking whether the medium is in use

Taking turns
- **polling** with master inviting nodes to send data: no collision or empty slots, but requires polling, latency, master failure
- **token passing**: control token passed in a ring. Token single point of failure

#### LAN
- IP address use for network layer forwarding
- MAC address used locally to get frame from interface-to-interface that are physically connected
  - often MAC address is burning into NIC
  - administered by IEEE (sections of address space are purchased)
- MAC address is portable between networks, IP address depends on sub-network (since they are not necessarily unique)
- **ARP table** is used to map IP address to MAC address
- a node **broadcasts an ARP query** to all nodes on LAN
- **Ethernet** encapsulates datagram in an **Ethernet frame**
  - **preamble**: wakeup, followed by alert, for synchronizing receiver and sender clock rates and mitigate drifts in transmission rate
  - source + dest MAC addresses
  - type (IP often, but can also be proprietary like AppleTalk)
  - CRC check at receiver, as suffix to Ethernet datagram
- Ethernet is connectionless (no handshaking) and requires higher level protocol to recover from errors
- **Ethernet switch** stores and forwards Ethernet frames
  - each switch has a table, mapping dest MAC address to interface
  - switch is link-layer, and has a learned forwarding switch table using **flooding** and MAC addresses
  - maps MAC address to interface to reach host (port on machine), with time-to-idle)
  - **router** is network-layer, and computes forwarding table using routing algorithms and IP addresses
- **load balancer** is application-layer routing
  
#### WiFi (WLAN)
- **Basic service set** is the set of all stations that can communicate with each other at physical layer
- **Independent BSS** is an ad hoc network
- **Extended service set** (ESS) is like eduroam at UW, a distribute system
- **Point Coordination Function (PCF)** uses an access point which decides who transmits when
- **Distributed Coordination Function (DCF)** is a mode of operation of MAC
  - handshaking when frame length >= dotRTSThreshold, since we want to reduce the probability of collision
  - without-handshake if frame length < dotRTSThreshold
- one problem with WiFi is the Hidden Terminal Problem, resolved by CSMA/CA collision avoidance
- second problem is **Exposed Terminal Problem**, where some node does not send in case it collides with a known transmission
- **WLAN MAC** has `Request To Send` and `Clear To Send` frame types, as control frames for coordinating medium usage.
- **Access point** converts WiFi frame to Ethernet frame and sends to router
- Collisions avoided in CSMA/CA using:
  - physical-level carrier sensing in receiver hardware
  - virtual carrier sensing (MAC protocol level concept) using **Network Allocation Vector (NAV)** which is a counter used as a heuristic guide to when to transmit
  - NAV is the max length of time from an RTS of any other node, and counts down by microseconds
  - can transmit when carrier is absent (as per physical level sensing) and NAV = 0 (nobody nearby is transmitting)
  
  
### [Network Layer](https://learn.uwaterloo.ca/d2l/le/content/463410/viewContent/2572927/View)
- transports segment from host to host, by encapsulating segments into datagrams and delivering segment to the receiving tranport layer
- **routing** is planning the trip from source to dest
- **fowarding** is the process of moving packets from router input to another router's output

1. Input port of router:
  2. physical layer: line termination, bit level reception
  3. data link layer: Ethernet
  4. decentralized switching: given dest, use forwarding table to lookup output port (at line speed)
5. Switching fabrics: transfer packet from input buffer to output buffer (at **switching rate**, multiple of line rate)
6. Output ports: queuing in datagram buffer
7. link layer protocol send
8. physical layer: line termination 

- **memory switching fabric** limited by memory bandwidth (2 bus crossings per datagram)
- **switching via bus**: shared bus, bus contention (up to 32Gbps bus)
- **switching via interconnection network** is advanced, uses **crossbar or banyan networks**
- buffering at output can cause packet loss, recommended to buffer at least round-trip-time in terms of link speed (250ms RTT on 10 Gbps link => 2.5 Gb buffer)
  - another recommendation is to divide the above by sqrt of N, for N flows
  
#### IP Datagram format
 - version, header length, datagram length, id, flags, fragmentation offset, TTL, upper layer protocol, header checksum, source, dest, options
 - **header checksum procedure**: sender sums all 16-bit blocks, add the carry to the one's digit, take the 1's complement. 
   - This works because we're picking a value to inject into the header so that the sum of all 16-bit blocks comes out to zero when repeating the calculation on the receiver
 - Network links are assigned a **Max transfer size** (MTU)
   - IP header size is 20 bytes, which consumes part of the MTU
   - fragmentation breaks a datagram into several, only to be reassembled at the destination
   - frag flag set for all but the last fragment, and offset in units of 8 bytes
   
#### IP Addresses
