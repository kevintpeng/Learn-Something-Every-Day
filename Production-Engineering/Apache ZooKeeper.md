# Zookeeper
Solves problem of service coordination. Centralized service for maintaining configuration info, naming
- synchronizes information accross multiple services
- data is replicated over a set of machines
- clients connect to a single replica over TCP
- Reads are local, writes go through a single server (writing is expensive)

### Guarantees
- Seqential consistency; acts like a queue
- Atomicity; update either succeeds or fails
- Single Server Image; same view regardless of which server it connects to
