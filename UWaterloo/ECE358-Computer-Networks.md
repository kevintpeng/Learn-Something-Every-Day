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
