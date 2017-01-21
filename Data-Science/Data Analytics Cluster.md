# Introduction to Technologies
Very fast in-memory data processing framework, ~100x faster than Hadoop
- Hadoop writes everything to disk, while spark is in-memory
- multi-step processing is slow with lots of disk writes
- Hadoop has lots of boilerplate code, and requires libraries to reduce its verbosity
- Hadoop has HBase, running on top of HDFS, with everything replicated on each node
  - is best suited for analytics on data lakes 
- Cassandra offers performance over HBase (which is only designed for data lake use cases)
