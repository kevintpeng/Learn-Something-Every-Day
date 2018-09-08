# CAP Theorem](https://en.wikipedia.org/wiki/CAP_theorem
)
States that among the following three properties of systems, it is impossible for a distributed data store to simultaneously provide more than two guarantees;

1. **Consistency**, every read responds with either the most recent write or an error
2. **Availability**, every read responds with a non-error, without guaranteeing that it is the most recent write
3. **Partition tolerance**, the system can continue to operate despite an arbitrary number of messages being dropped or delayed BETWEEN nodes

[No distributed systems are safe](https://github.com/aphyr/partitions-post) from network failures, thus CAP theorem implies that a store [must choose](https://codahale.com/you-cant-sacrifice-partition-tolerance/) between consistency and availability
- probability of any failure is very high for large systems; it's the (inverse of no failure)^(number of nodes)
- say `{A,B,C}` is partitioned: `{A,B}` and `{C}`. `C` gets a read request, it must either accept (but A + B could have gotten a more recent write, availability) or refuse (knowing that A and B could have a newer write so you can't guarantee it, consistency)
- *so the takeaway here is that CAP guarantees apply to the ENTIRE system, in other words both partitions (in the event of network partitioning) need to be able to make these guarantees for them to hold in general*

In the absence of network failure, a system can guarantee BOTH consistency and availability

### CAP theorem in action
ACID chooses consistency over availability

NoSQL chooses availability over consistency

### [Proof](https://users.ece.cmu.edu/~adrian/731-sp04/readings/GL-cap.pdf)
- in the asynchronous model (no clocks), it is impossible
- in synchronous, it may be possible
