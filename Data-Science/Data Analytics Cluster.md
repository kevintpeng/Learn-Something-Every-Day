# Introduction to Technologies
Very fast in-memory data processing framework, ~100x faster than Hadoop
- Hadoop writes everything to disk, while spark is in-memory
- multi-step processing is slow with lots of disk writes
- Hadoop has lots of boilerplate code, and requires libraries to reduce its verbosity
- Hadoop has HBase, running on top of HDFS, with everything replicated on each node
  - is best suited for analytics on data lakes 
- Cassandra offers performance over HBase (which is only designed for data lake use cases)
- Spark with its SQL query API provides a comfortable interface for distributed analysis

### Spark Task Distribution
Important to partition data for optimized performance
- order of operations is critical
- data should be partitioned with a lower bound of 2 times the number of cores 
- any task should be at least 100ms to warrent distribution
