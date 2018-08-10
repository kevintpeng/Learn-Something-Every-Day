# CAP Theorem
States that among the following three properties of systems, it is impossible for a distributed data store to simultaneously provide more than two guarantees;

1. Consistency, every read responds with either the most recent write or an error
2. Availability, every read responds with a non-error, without guaranteeing that it is the most recent write
3. Partition tolerance, the system can continue to operate despite an arbitrary number of messages being dropped or delayed BETWEEN nodes

No distributed systems are safe from network failures, thus CAP theorem implies that a store must choose between consistency and availability

In the absence of network failure, a system can run guaranteeing consistency and availability

### CAP theorem in action
ACID chooses consistency over availability

NoSQL chooses availability over consistency

### [Proof](https://users.ece.cmu.edu/~adrian/731-sp04/readings/GL-cap.pdf) TODO
