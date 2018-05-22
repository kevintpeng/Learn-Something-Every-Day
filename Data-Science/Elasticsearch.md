# Elasticsearch
- Allows real-time searching on data on large scale and analyze data. 
- Provides a RESTful API for programs to interface on it. 
- Elasticsearch is scalable horizontally, with the addition of multiple nodes and let's the cluster automatically take advantage of extra hardware. 
- automatic error detection with rebalancing
- stores data in json
- schema free, index a JSON document and it will detect the data structure and types, create index, and make data searchable

### Installation
Requires at least java 7. In console, 
```
java -version
echo $JAVA_HOME
```

If not downloaded, [get the java SE Development Kit 8u91.](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

Download elasticsearch.
```
# download to current directory
curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.2/elasticsearch-2.3.2.tar.gz 
tar -xvf elasticsearch-2.3.2.tar.gz # this extracts the download to the current directory

# open folder, run batch file
cd elasticsearch-2.3.2/bin
./elasticsearch
```

This will pull up an elasticsearch node as the *master* in a single cluster on port `9200`.

```
# Shutdown local node
curl -XPOST 'http://localhost:9200/_cluster/nodes/_local/_shutdown'
```
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
