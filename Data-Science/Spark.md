# Spark
### [Overview of RDDs](../Research-Papers/2012%20Resilient%20Distributed%20Datasets.md)

### Spark SQL & DataFrames -- [source](http://spark.apache.org/docs/latest/sql-programming-guide.html)
Spark SQL is a module on top of Spark's RDD API
- provides Spark with more information about how data is structured and how it should be processed
- Spark SQL can be interacted with SQL or with DataFrames API; whichever is more natural

Datasets are a distributed collection of data. It is an abstraction on top of the RDD API, reaping the benefits of powerful lambda transformations, strong typing and SQL's optimized execution
- A DataFrame is a Dataset organized by named columns (conceptually similar to tables in RDBMS)
