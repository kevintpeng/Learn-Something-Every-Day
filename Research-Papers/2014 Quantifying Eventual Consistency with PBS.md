# [2014 Quantifying Eventual Consistency with PBS](http://www.bailis.org/papers/pbs-vldbj2014.pdf)
In general, a quorum is the minimal number of people that need be present in order to make the preceeding of a meeting valid. In quorum replication, there are N replicas.
- a write quorum waits for W acknowledgements from replicas
- read quorum, consult R of the replicas and return the most recent value from the read quorum
- a quorum system describes the powerset of replicas 

Dynamo and Cassandra are examples of data stores that depend on quorum systems for consistency
- strong consistency is achieved when a quorum is equal to the majority of replicas
- partial quorums allow sets of replicas that may not overlap, but have eventual consistency
- employ quorum system for each key (for lots of cases, a quorum system for strong consistency would all sets of majority size)
- for N replication factor, different quorum systems can be used depending on how critical the underlying data is
  - Cassandra default is N=3 R=1 W=1
  - for mission critical/financial data, Rias default is N=3 R=2 W=2 (majorities achieve strong consistency)
- partial quorums are used (controversially) by many, to achieve low latency and high availability
- this paper bounds the behaviour of the system, for the chance of stale reads
  - intuitively chance of overlap is inversely proportional to staleness of data
  - use probabilistic bound for staleness (**Probabilistically Bounded Staleness** PBS)
  - useful for analyzing effectiveness of eventual consistency
- in a probabilistic sense, we look at a quorum system (a set), and look at which sets in the set would result in stale data
- in other words, N-W is the set with stale values, so "choose R from N-W" combinations resulting in a stale read

