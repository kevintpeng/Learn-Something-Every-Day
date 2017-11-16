# Cassandra
Distributed row store database, which replicates data across homogeneous nodes using a gossip protocol.
- it uses a write-back cache called a memtable
- SSTables are written on disk
- data is always first written to the **commit log** for durability, and is deleted when data is flushed to SSTables
- conducts repairs to keep nodes consistent with the newest data

### Architecture
No master, all nodes are homogeneous
- whenever a request hits a node, that node acts as the coordinator for that particular operation
  - coordinator is a proxy between client and node holding the data
  - coordinator configuration dictates where the data will live
- gossip peer-to-peer protocol is used to share information within a cluster
- partitioner is a hash function that determines which node receives the first replica of a piece of data
- replication of data is confgiured by a factor and placement strategy
- snitch knows the network topology and is used to place replicas and chooses the best replica for reading 
