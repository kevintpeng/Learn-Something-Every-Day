# [Paxos Made Live - An Engineering Perspective](https://static.googleusercontent.com/media/research.google.com/en//archive/paxos_made_live.pdf)
Paxos is an algorithm for achieving concensus on a single value in the face of failure due to properties of distributed systems. The basic algorithm is used to manage a single value, while in practice **multi-paxos** is more practical for systems to track multiple (possibly sequential) values 
- each instance of paxos has three phases: election of coordinator, broadcasting the value on an accept message, and sending commit messages once consensus is reached
- consensus is reached if a majority of replicas acknowledge an accept message, and a majority guarantees that even if any minority of nodes crashes at a time, at least one node will hold the new committed value
- paxos can possibly have multiple nodes who think that their the coordinator, and so coordinators have ordered numbers to determine who is newer and replicas must promise not to accept requests from older coordinators
- during election, if a replica wants to be coordinator, it must send a propose message to which a majority must promise not 
- once consensus is reached, every future coordinator must select the same value to be committed to guarantee continued agreement
- in the response to an agree message, replicas respond to the coordinator with an agreed upon value if consensus has been reached, and because of properties of majorities, it is guaranteed that at least one replica in the current majority was a part of the previous majority that reached consensus

An implementation of paxos is hundreds of times longer than its psudocode, due to the need of optimizations and features needed to be production ready
- **disk corruption** on a replica could lead to a violation of promises made to other nodes
  - needs checksums to verify corruption and markers to distinguish failure and corruption
- **master leases** 
