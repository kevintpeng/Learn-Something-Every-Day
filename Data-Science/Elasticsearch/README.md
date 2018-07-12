# Elasticsearch
- Allows near real-time searching on data on large scale and analyze data.
- Elasticsearch is scalable horizontally, with the addition of multiple nodes and let's the cluster automatically take advantage of extra hardware.
- stores data in json
- schema free, index a JSON document and it will detect the data structure and types, create index, and make data searchable
- built on top of Java library, Apache Lucene
  - competing software Apache Solr is also built on Lucene
  - elasticsearch is often used for analytical querying, filtering and grouping whereas solr excels at text search
- uses shards, the partitioning unit for Lucene indexes
  - elasticsearch benefits from automatic shard-rebalancing which Solr does not have (as of 2016)
- elasticsearch is not a primary data store, it is at its core a different data structure that allows efficient lookups for certain queries

### Architecture
An elasticsearch cluster is made up of nodes
- cluster is horizontally scalable
- a master node orchestrates cluster-wide operations like creation/deletion of indexes and tracking nodes in the cluster
  - any node with `node.master = true` is master-eligible, and in big clusters there are dedicated master-eligible nodes
- data node holds the inverted index structure
- client node is set if node.master and node.data is set to false, and acts as a load balancer to serve requests
- ingest nodes can apply transformations before indexing documents
- coordinator node is not a role, but it is a responsibility taken on by any node that faces clients and either serves or re-routes requests (referenced often as being just a single node, functionally the client node)
  - coordinating-only node is the same as client node

Writes first hit the coordinating node, route to the respective shard, where the shard uses a memory buffer and transaction log to do cached writes
- sharding allows elasticsearch to horizontally scale its cluster beyond the hardware limitations of a single node
- shard **relocation**
- shard **replication** is for risk mitigation

### X-Pack
Part of the ELK stack ecosystem, for security, alerting, monitoring, reporting

### Split Brains
Split brain is when you have multiple sub-clusters of a distributed system functioning with multiple nodes thinking that they're master.
- in master selection, a quorum consisting of a majority of nodes must be available and agree that the master selected is indeed the master
- 2-node and 3-node both require 2 available nodes for master election
- the additional node need not be a full functional node, it could be used for the purpose of tie breaking elections

### Curator
Plugin that acts on elasticsearch indices, helping to automate administrative alterations to indices
- helps to solve how to remove data, for example when dealing with time series data with a rolling window
- automates snapshot management
- **aliases** allow indices to be referenced in a more predictable manor
- still compatible with ES 6

### Elasticsearch 6
- Search cross clusters allows "federated search" (simultaneous search over multiple resources), allowing results to be searched from multiple indices
- Sequence IDs have consensus on the sequence of operations between primary and replica shards
  - this allows more intelligent replay of operations in the event of failure, compared to the brute force comparison before
- index sorting (preprocessing time vs. query time)
  - allows you to query for leaderboard-style requests easier
  - will group similar documents together
- better search scalability, less contention between massive queries
- distributed watch execution moves X-Pack watcher watches from master-only to the nodes that hold the shards of the watcher index (more scalability)
- multiple mapping types per index are not supported in 6
  - each index should now represent a single mapping type/document type
  - indices are conceptually more like tables than databases
- improved security through HTTPS node communication
- ships by default with x-pack
