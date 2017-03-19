# [Implementing Linearizability at Large Scale and Low Latency 2015](http://sigops.org/sosp/sosp15/current/2015-Monterey/printable/126-lee.pdf)
#distributedsystems

Consistency is one of the most important issues in distributed storage systems
- represents predictability of systems in the face of failure
- stronger forms of consistency make it easier to reason about correctness of the system
- **Linearizability** is the strongest form of consistency for operations on a single object
