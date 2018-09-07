### Inverted Indexes
**Inverted Index** is a data structure, implemented by Lucene, and is leveraged as the lowest abstraction in Elasticsearch for building up the search engine as a whole
- maps terms to documents containing the term
- can use this data structure to form boolean predicate queries using AND/OR to intersect/union results
- prefixes and suffixes are much faster to search; terms are stored in a tree allowing us to narrow a set of terms down in O(log n) time (range search algorithm probably) while arbitrary substring requires O(n) operation across all terms
- when building the indexes, we must consider search speed, compactness and build time

An elasticsearch index is made of up one or more shards, each of which is a wrapper over an individual lucene index made up of index segments
- lots of layers of abstraction, each exposing a different interface to handle searches over the data
