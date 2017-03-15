# [Resilient Distributed Datasets 2012](http://www-bcf.usc.edu/~minlanyu/teach/csci599-fall12/papers/nsdi_spark.pdf)
#datascience #datastores

A distributed memory abstraction for performing in memory computations, on a large cluster. It only allows batch transformations on the whole dataset (coarse-grained), but 
- uses in memory operations, improving performace by orders of magnitude
- handles iterative algorithms better and provides interactive data mining
- RDDs provide a restricted form of shared memory (like RAM, for efficient transfer of data between processes)
- RDDs let scientists leverage distributed memory, useful for retaining data during intermediate operation
  - very important that the datasets provide reuse of data for iterative machine learning and graph algorithms ([PageRank](./1998 Pagerank.md), K-mean clustering, logistical regression)
  - no needing to setup an external storage system (which would need lots of disk writes, data serialization and data replication)
- RDDs provide a general abstraction for this, not specific to any particular algorithm, allowing for efficient data persistance 
- main challenge in designing RDDs is defining a storage interface for efficient fault tolerence
  - fault tolerence is always a space trade off (and making data-intensive workflows more expensive)
  - implemented with data replication or logging linage across servers
  - the RDD must be able to recompute lost partitions, derived from other RDDs
- Spark has an implementation of RDDs, providing a programmatic interface for querying large datasets

### RDD Abstraction
An RDD is a read-only partitioned collection of records
- partitions are used to cluster similar data together, for read optimization
- only created using deterministic operations (transformations) on data in stable storage or on data in other RDDs
  - map, filter, join
- RDDs don't have to be materialized (for ex. in memory) at all times, as long as they can be deterministicly recomputed from other datasets, to recompute its partitions
- users have fine-grained control over how an RDD is persisted and partitioned (records stored in different parts of memory or different computers entirely)
  - for ex. data being joined from two different RDD's can have elements grouped together by whatever key they're being joined by, using hash-partitioning

### Spark Programming Interface
Spark allows programmers to create RDD objects from stable storage, then apply methods on the objects (transformations, returning another RDD, or actions, returning a value)
- Like DryadLINQ (API that it's inspired by), Spark computes RDDs lazily, waiting until it's used in an action so that it can pipeline transformations (apply transformations in parallel with stages)
- persist can be called on RDD objects to have them persist in RAM (and disk as needed)
  - priority can be specified for determining spillover into disk
- note that this RAM and disk is shared acrossed nodes in an underlying implementation of a data store (HDFS, Cassandra, etc...)

```sh
lines = spark.textFile("hdfs://...")        # defines RDD, not in RAM
errors = line.filter(_.startsWith("ERROR")) # derives RDD from lines RDD, not in RAM
errors.persist() # reduced dataset, so now stores RDD in RAM, greatly increasing future computation 
```

### Fine Grained vs Coarse Grained
- fine grained control over read and write operations describe operations that can apply to single records or subsets
- coarse grained reads/writes describe general functions across a dataset

### RDD vs DSM
Distributed Shared Memory is a very general abstraction, so harder to optimize and make fault-tolerent
- RDDs form a directed acyclic graph of transformations (the linage graph), which can be used to recompute the RDD
- changing any element of the original dataset breaks the deterministic nature of this process
  - ex. on a dataset, one transformation could be `get subset by index`, and altering the underlying data will require the whole dataset to be recomputed. An RDD cannot be created with a fine grained operation like this
- RDDs can only be created using coarse grained transformations, DSMs let you read/write any address
- RDDs do not need checkpointing as they can recover through lineage
  - only the failed partition needs to be recomputed (no need to roll back the whole program)
- RDDs are not useful for systems with asynchronous, fine-grained updates to the underlying dataset

### Spark
Spark provides an abstraction over RDDs, written in scala for static typing and interactive use
- driver program connects to a cluster of workers, each which can store partitions in RAM
- Partitioner class holds partitioning configurations
- spark has transformations and actions, some that take other closures to apply to the RDD object

### Representation of Resillient Distributed Datasets
Important to capture the concept of the linage graph of a RDD through its formalized definition. This is achieved through a simple graph representation, without needing extra logic in the schedule for each one 
- RDDs are composed of a set of dependent parent RDDs, a set of atomic partitions, a function of its parents for computing the dataset, a set of metadata for partitioning scheme and data placement
- RDD dependencies can be classified as narrow if a parent partition is accessed by onl one child partition or wide if by multiple children partitions
  - narrow parent RDDs allow for pipelined execution
  - joins are wide *unless hash-partitioned*
  - recovery from a failure mode is very efficient for narrow dependencies since only lost parent partitions need to be computed

### Implementation
Spark is built in Scala, on Mesos cluster manager; a distributed kernel, built at a different layer of abstraction, for handelling a large distributed system
- each spark program runs its own mesos program, with a master and workers (mesos handles resources between applications)

#### Job Scheduler
Assigns tasks based on data locality, which works very well for narrow RDDs
- for wide RDDs, parents are materialized to simplify fault tolerence protocol 
- if any task fails, it is re-run on another node given that it's parent is available
- tasks are resubmitted to recompute any missing partitions

#### Interpreter Integration
Scala's interactive interpreter works by compiling each line of input as a class and invoking a function on it. Each object, for ex. `Line1`, includes a singleton object containing the lines variables and functions.
- Spark adds Class Shipping; serving the bytecode via HTTP
- Spark modifies code generation; passes the environment for the closure (singleton object) so that workers can access variables and functions corresponding to the bytecode

#### Memory Management
RDDs can be stored as unserialized Java objects, serialized data in memory and serialized on disk
- by default to manage memory, uses LRU eviction policy
  - do not evict if memory belongs to the same RDD that is asking to be stored
  - transformations will run over the entire dataset, resulting in expensive overlow to disk on all writes
  - must constrain eviction, to prevent cyclical eviction (with no cache hits)
- again, users can define persistent priority 

#### Checkpointing
Lineage graphs can always be used to recompute lost data, but is time consuming for large jobs
- RDDs can be checkpointed into stable storage
- with wide transformations, a full recomputation may be required
- read only nature of RDDs make them simple to checkpoint relative to other DMSs
