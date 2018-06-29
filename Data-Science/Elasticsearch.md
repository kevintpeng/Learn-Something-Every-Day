# Elasticsearch
- Allows near real-time searching on data on large scale and analyze data.
- Provides a RESTful API for programs to interface on it.
- Elasticsearch is scalable horizontally, with the addition of multiple nodes and let's the cluster automatically take advantage of extra hardware.
- stores data in json
- schema free, index a JSON document and it will detect the data structure and types, create index, and make data searchable
- built on top of Java library, Apache Lucene
  - competing software Apache Solr is also built on Lucene
  - elasticsearch is often used for analytical querying, filtering and grouping whereas solr excels at text search
- uses shards, the partitioning unit for Lucene indexes
  - elasticsearch benefits from automatic shard-rebalancing which Solr does not have (as of 2016)
- elasticsearch is not a primary data store, it is at its core a different data structure that allows efficient lookups for certain queries

### Inverted Indexes
**Inverted Index** is a data structure, implemented by Lucene, and is leveraged as the lowest abstraction in Elasticsearch for building up the search engine as a whole
- maps terms to documents containing the term
- can use this data structure to form boolean predicate queries using AND/OR to intersect/union results
- prefixes and suffixes are much faster to search; terms are stored in a tree allowing us to narrow a set of terms down in O(log n) time (range search algorithm probably) while arbitrary substring requires O(n) operation across all terms
- when building the indexes, we must consider search speed, compactness and build time

An elasticsearch index is made of up one or more shards, each of which is a wrapper over an individual lucene index made up of index segments
- lots of layers of abstraction, each exposing a different interface to handle searches over the data

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

### X-Pack
Part of the ELK stack ecosystem, for security, alerting, monitoring, reporting

### Elasticsearch Query DSL
- Leaf query clauses look for a particular value in a field
- Compound query clauses wrap other leaf or compound queries
- behaviour of a query clause depends on if it used in *query context* or *filter context*

- **Query context** describes "How well does this document match this query clause"
  - bool decides whether or not it should match
  - then assigns a `_score` representing how well the document matches, relatively
- in **Filter context**, a query clause describes "does this document match this query clause?"

[source](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html)

### Query Score Algorithm
Relevance is the score of each document, represented by a positive float called `_score`
- calculated depending on the type of query clause
- a `fuzzy` query might determine the `_score` by calculating how similar the spelling of the found word is
- algorithm known as **term frequency/inverse document frequency**, TF/IDF
  - Term Frequency is how often the term appears in a field
  - Inverse document frequency, how often does each term appear in the index, more often, the less relevant
    - common terms have lower weight
  - Field-length norm, how long is the field, the longer the less likely a word in the field will be relevant

[source](https://www.elastic.co/guide/en/elasticsearch/guide/current/controlling-relevance.html)

### Split Brains
Split brain is when you have multiple sub-clusters of a distributed system functioning with multiple nodes thinking that they're master.
- in master selection, a quorum consisting of a majority of nodes must be available and agree that the master selected is indeed the master
- 2-node and 3-node both require 2 available nodes for master election
- the additional node need not be a full functional node, it could be used for the purpose of tie breaking elections

### [Hot Warm Architecture](https://www.elastic.co/blog/hot-warm-architecture-in-elasticsearch-5-x)
Hot-warm architecture is a concept of having two types of data nodes conceptually *(where the hot nodes would probably have better specs)*
- `discovery.zen.minimum_master_nodes = 2` stops split-brain
  - from an architecture perspective, master nodes do not handle search or indexing operations so less frequent garbage collection and less required resources
- Hot nodes perform all indexing within the cluster
  - hold the most recent indices, assumed to be more frequently queried  
  - indexing is high I/O and CPU, so requires SSD
- Warm nodes will be designed to handle large amounts of read-only indices
  - read-only implies less computing, typically we need much larger disks (maybe HDD or some ELB)
- this should all be transparent to users of the elasticsearch cluster

How do we configure indices to route data to the correct node?
- `node.attr` is the interface exposed by ES for doing this
- they suggest the arbitrary attribute `box_type` or something similar
- then, under the index templates' settings, we can specify `index.routing.allocation.require.box_type`

How do old indices get shuffled from hot to warm? How expensive is this operation?
- by updating the routing allocation setting for the index template
- elasticsearch handles the implementation of shuffling

### Curator
Plugin that acts on elasticsearch indices, helping to automate administrative alterations to indices
- helps to solve how to remove data, for example when dealing with time series data with a rolling window
- automates snapshot management
- **aliases** allow indices to be referenced in a more predictable manor
- still compatible with ES 6

### Elasticsearch 6
- Sequence IDs have consensus on the sequence of operations between primary and replica shards
- index sorting (preprocessing time vs. query time)
- multiple mapping types per index are not supported in 6
  - each index should now represent a single mapping type/document type
  - indices are conceptually more like tables than databases
- improved security through HTTPS node communication
- <5.6 to 6.x requires a full cluster restart
