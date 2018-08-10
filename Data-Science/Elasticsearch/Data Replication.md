# Data Replication
Elasticsearch clusters have multiple indices. Each index has multiple shards, and each shard (primary shard) has replicas.
- shards allow horizontal scaling
- shards enable distributed operations, increasing performance/throughput

Replication provides high availability, and scaling search throughput by allowing operations to run on replicas.

YELLOW status for an index means that all primary shards are allocated (on the Elasticsearch data nodes) but the replicas have not been allocated yet (as opposed to GREEN where everything is allocated). In other words, replica rules aren't satisfied and there is risk of data loss.

Elasticsearch can configure many parameters (shards/AZ, rack awareness) that amount to a scheduling heuristic, which ultimately may result in some replicas having no well-suited host.

### Split Brains
An elasticsearch cluster has possibly multiple data nodes. It is important to consider the possibility of [network failure through partitioning](../Computer-Science-Concepts/CAP%20Theorem.md).

Split brain is when you have multiple partitions of a distributed system functioning with multiple nodes thinking that they're master. This needs to be avoided.
- in master selection, a quorum consisting of a majority of nodes must be available and agree that the master selected is indeed the master
- 2-node and 3-node both require 2 available nodes for master election
- the additional node need not be a full functional node, it could be used for the purpose of tie breaking elections
