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
