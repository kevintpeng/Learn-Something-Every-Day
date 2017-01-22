### Akka
Akka is a toolkit, for distribution, state, protocols

Actors are simple high level abstractions for async message-driven programming
- very light weight event-driven processes
- actors systems span multiple JVMs
- state changes experienced by actors can be persisted when the actor is restarted

Akka cluster has good testing, for mocking requests and testing faults

### Wire protocol
Abstractly a way of getting data from point to point, often for distributed object protocols
- A wire protocol is needed if more than one application needs to interoperate
- common way to represent information at the application level

### Spark
General purpose cluter computing system. Provides an API centered on a data structured called the resilient distributed dataset
- readonly multiset (generalization of set, without element uniqueness)
- opposes MapReduce cluster restrictions of linearity of dataflow
  - spark's RDDs function as a "working set" for distributed programs, adding restricted form of distributed memory
  - facilitates 

### Why Spark & Akka?
Spark is supposed to be stateless. Spark sends data out to get processed. Akka cluster gives us a separate asynchronous control channel
- columnar ingestion is stateful
- async messaging

### Data Ingestion
Handled by a hash to nodes
- Row source actors

One actor holds state

Backpressure?

Monix/Reactive Streams?

Kamon Tracing - builtin for Akka actors

Scalactic

### Scala optimization (Machine speed)
Dont' serialize, don't allocate, don't copy
- serialization is conversion of objects to byte streams
- spark inmemory columnstore faster than cassandra

Binary data: cannot rely on static types and standard serialization mechanisms (protobuff)
- deserialization generates lots of object allocations
