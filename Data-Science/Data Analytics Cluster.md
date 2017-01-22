# Introduction to Technologies
Very fast in-memory data processing framework, ~100x faster than Hadoop
- Hadoop writes everything to disk, while spark is in-memory
- multi-step processing is slow with lots of disk writes
- Hadoop has lots of boilerplate code, and requires libraries to reduce its verbosity
- Hadoop has HBase, running on top of HDFS, with everything replicated on each node
  - is best suited for analytics on data lakes 
- Cassandra offers performance over HBase (which is only designed for data lake use cases)
- Spark with its SQL query API provides a comfortable interface for distributed analysis

### Background: OLTP OLAP
transactional OLTP and analytical OLAP describe the intent of some data system
- OLTP uses INSERT, UPDATE, DELETE and has high volume of trnasactions
- OLAP has few transactions, but many queries
  - more complex queries with aggregations
  - OLAP databases hold aggregates, historical data, with multi-dimensional schemas
- OLAP often uses star-schema (or other multi-dimensional schemas)
  - simply, a schema (represented as a graph) composed of *Dimension Tables* and *Fact Tables* as the nodes, connected by edges describing the dimensionality of a Fact Table
  - each dimension is represented with a 1-D table
  - Fact Table holds `n` keys relating each dimension to a table
  - the Fact Table describes a `cube`, some hypercube of n-dimensional coordinates, where each coordinate is decribed some some tuple of values in a 1-D Dimension table

### Spark Task Distribution
Important to partition data for optimized performance
- order of operations is critical
- data should be partitioned with a lower bound of 2 times the number of cores 
- any task should be at least 100ms to warrent distribution

### Setup
```
curl -o ~/Downloads/spark-2.1.0-bin-hadoop2.7.tgz http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
