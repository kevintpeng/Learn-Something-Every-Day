# [Distributed Computing](https://learn.uwaterloo.ca/d2l/le/content/459381/Home)
- Distributed systems are often organized as middleware
  - offers single-system view
- **distribution transparency** is a desirable property for middleware, that hides the fact that processes/resources are physically distributed
- openness arises from interoperability, composability, extensibility, and separation of policy from mechanism (through config files)

### [Architectures](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2553833/View)
- typically for layered architectures we count by the max number of layers passed through
- logical layers can map to multiple **physical tiers**. For three layers two tiers, a couple of odd examples:
  - UI split client and server, like terminals
  - UI and application client, enterprise software
- this is **vertical distribution**, mapping layers to tiers
- **horizontal distribution** is sharding
- object-base architectures like LLDB's API
- delegate responsibility of data storage to one layer, allows other layers to scale easily: **data-centered architecture** (ex: web applications)
- **event-based architecture** (ex: pub-sub), key difference is that this emphasizes async messaging
- **peer-to-peer** systems, organized processes in an overlay network, because it's routing above layer 3 based on data
  - "Chord" solves the problem of finding data
  - compact routing tables, bounded by log n, for n possible peers; protects from change, and bounds the number of peer hops to get to the server
  - hybrid architecture (bit torrent): client-server serves torrent files, which reference trackers to join a peer-to-peer network

### [Processes](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2559781/View)

Java Socket
- `tcp_nodelay` nagle's algorithm coalesces mulitiple 

### [Communication](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2559782/View)
- RPC library in Java differ from sockets in that the server does not need to manage threads and accept connections explicitly; abstracting into off-the-shelf server implementation
  - client invokes stub, stub sends message through the client os, to be received and unpacked on the server
  - used for two-way communication (especially when client expects immediate response)
- RPC's have referential coupling, and stronger temporal coupling
- Message queues have weaker referential and temporal coupling (hence scalability)
  - used for one-way communication
- `telnet` demo: it is a protocol for bidirectional plain text communication
  - demonstrated high referential and temporal coupling with memcached

### [Apache Thrift](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2565367/View)
- analogous to protobuf
- without service discovery, thrift clients violate distribution transparency, as they require the hostname and port
- do not share thrift transports, protocols, and client stubs as they are not thread-safe
- for interface versioning, add optionals with default values

### [Hadoop MapReduce](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2571408/View)
- achieves fault tolerance through restarting tasks, and ensuring that tasks are side-effect free


### [Apache Spark](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2575474/View)

### Graph processing
- Google Pregel, master/worker model
  - **vertex-centric** and stores state per vertex: domain-specific value, list of messages sent to vertex, list of outgoing edges, binary active/inactive state
- uses the **Bulk Synchronous Parallel Model (BSP)** where computation is synchronous rounds or iterations called **supersteps**
  - workers execute a function on each vertex using messages as input/signal
  - execution ends when all workers vote to halt, when they no longer receive any messages
- damping adjusts rank at each super step by including its rank from a previous superstep as some weight alpha
  - without, algorithm can oscillate
- **single source shortest path** 

### Consistency and Replication
- replicating mutable state requires a consistency model to make sense of concurrent read/writes and reason about guarantees
- **sequential consistency** there is one total order of operations over all processes so that the values read are possible 
- **causal consistency** is weaker, processes each have their own observed order of ops from other processes
  - op1 **causally precedes** op2 if op1 comes before op2 on the same process, or op2 reads a value written by op1
- **linearizability** uses the notion of start and end times to get a sequential total order of ops, where if op1 finishes before op2, it must happen before (stronger guarantee than sequential)
- **eventual consistency** is extremely weak, all servers will eventually produce the same reads in the absence of new writes 
- **session guarantees**: successive reads on the same value will always return the same or newer values

Causal > sequential > Linearizability

Eventual is incomparable, since it pertains to liveness

### [Zookeeper](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2583932/View)
- bounded write throughput, unbounded read throughput
- znodes can be created, deleted, `setData, getData(path, watch)`, `Stat exists(path, watch)`, `getChildren(path, watch)`, sync, setACL and getACL
- data model is hierarchal namespacing like a file system, where data is read/written in its entirety

### [Fault Tolerance](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2586424/View)

#### Distributed Commit
- **2 phase commit** has two roles, coordinator and participants, where the result is either a global abort or global commit
  - unanimous voting
  - naive implementation can get stuck in ready state for participants (when coordinator dies)
- we can use timeouts to detect failure (FLP impossibility assumes asynchrony), so consensus here is possible
- if coordinator fails, participants can make progress as long as it received the decision, or can learn from another participant

#### Distributed Checkpoint
- **distributed checkpoints** enable recovery (using a persistent storage of checkpoints)
  - what if the coordinator crashes?

### Raft

### Kafka
- pub-sub, real-time stream processing, distributed and replicated storage of messages and streams
- **topic** is stream of records, stored as partitioned log
- produces push records to kafka brokers 
  - can do idempotent delivery to avoid duplicate commits
- consumer pulls records, each has an offset per topic
  - **exactly once** semantics achievable by using a consumer to forward records from one topic to another
  - **auto-commit**
- **windowing** can be applied to a stream for **windowing streams**
  - hopping by record
  - tumbling by groups
- **changelog streams** are semantically interchangable with tables

### Clocks

### CAP Principle
- PACELC: when network **P**artitioned, choose **A**vailability or **C**onsistency, **E**lse choose **L**atency or **C**onsistency
- Conventional DBs can scale up with memory and storage, and out with read replicas
- transactions can scale out with data partitions, paxos-based replication
- **hinted-handoff** is required(?) for AP systems to acheive high availability
- **anti-entropy**
- **read repair** in **Cassandra** when you get, you send get to all replicas (even with small read quorum) using two types of reqs
- **direct** fetches the actual data
- **digest** gets a hash (quick small) for checking
- third background repair request by coordinator to fix discrepancy, after the get finishes

How to configure Cassandra for Latency vs. Consistency?

### Exam Review
- types of thrift servers: TSimpleServer, TNonblockingServer...?
- Kafka
- Memcached
- NTP
  - assume there is always 2ms delay between up and back. How do we change the NTP formula to take this into account?
- solve hadoop or spark
- Q10 very important:
  - one-way given, round-trip used
  - Majority includes self
  - ALL: parallel so max
- RPC performance: client or server could be limiters, take the min and consider both
  - client: throughput/thread x # of threads
  - server
