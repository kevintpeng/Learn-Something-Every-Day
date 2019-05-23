# [ECE 358 Computer Networks](https://learn.uwaterloo.ca/d2l/le/content/463410/viewContent/2545984/View)
### [Intro](https://learn.uwaterloo.ca/d2l/le/content/463410/viewContent/2545984/View)
- **access networks** are provided by telecom operators (residential access, school network, cell tower)
- **network core** connects service providers, for routing and forwarding
  - routing algorithm uses a local forwarding table to select next link
- **packet-switching** is a method of breaking down a message into packets (a router is a switch in this case)
- **Store-and-forward** is one method of transmitting packets, where the entire packet must arrive (and checked for integrity) before it can be transmitted to the next link
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

#### Error detection and correction (EDC)
- error detection is not 100% reliable, in rare cases
- **parity** checking detects single bit errors
- cyclic redundancy check is a checksum algorithm (see [introduction](http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html)

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
