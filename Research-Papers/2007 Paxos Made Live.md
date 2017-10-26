# [Paxos Made Live - An Engineering Perspective](https://static.googleusercontent.com/media/research.google.com/en//archive/paxos_made_live.pdf)
An implementation of paxos is hundreds of times longer than its psudocode, due to the need of optimizations and features needed to be production ready
- **disk corruption** on a replica could lead to a violation of promises made to other nodes
  - needs checksums to verify corruption and markers to distinguish failure and corruption
