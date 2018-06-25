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
- in master selection, a quorum consisting of a majority of nodes must be availble and agree that the master selected is indeed the master
- 2-node and 3-node both require 2 available nodes for master election
- the additional node need not be a full functional node, it could be used for the purpose of tie breaking elections
