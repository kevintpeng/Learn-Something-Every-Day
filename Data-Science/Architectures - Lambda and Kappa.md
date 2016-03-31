# Data Processing Architectures - Lambda and Kappa
Lambda and Kappa architectures are popular design solutions for real-time data processing. A good real-time data processing architecture must be fault-tolerant, scalable, supports batch and incremental updates, and is extensible.

## Lambda
Lambda architecture is good for its many use-cases. Lambda is composed of 3 layers; batch, speed and serving:

![lambda figure](http://www.ericsson.com/research-blog/wp-content/uploads/2015/11/LambdaKappa1_1.png)

[Batch layer](Big Data Processing.md) has two major tasks:
- managaing historic data
- recomputing results such as machine learning models

Speed layer is used to provide results in low-latency. Does [real-time data processing](Big Data Processing.md) by performing incremental updates to the batch layer results (with significantly lower computation cost).

Serving layer enables various queries of stored results (the data warehouse).

## Kappa 
addresses some pitfalls of Lambda, but it is not a replacement for Lambda. Kappa avoids the need to maintain two separate code bases for the batch and speed layers of processing. The key idea is to handle both real-time processing and continuous reprocessing using a single stream. Process stream runs the processing job, to enable real-time data processing.

![kappa figure](http://www.ericsson.com/research-blog/wp-content/uploads/2015/11/LambdaKappa1_2.png)

## Implementations
Both architechures require combining technologies like the following Apache technologies: Kafka, HBase, Hadoop (HDFS, MapReduce), Apache Spark, Apache Drill, Spark Streaming, Apache Storm, and Apache Samza. 

- Data ca be ingested into the Lambda and Kappa architectures using a publish-subscribe messaging system like [Kafka](Kafka.md). 
- Data and model storage can be implemented using a persistent storage like HDFS (in Hadoop). High latency batch system like [Hadoop MapReduce](Hadoop.md) can be used in the batch layer of Lambda to train models from scratch. 
- Low-latency systems (Apache Storm, Apache Samza and Spark Streaming) can be used to implement incremental model updates in the speed layer. 
- Apache Spark can be used as a common platform to develop the batch and speed layers for Lambda, sharing code between layers.
- Serving layer can be implemented using NoSQL database (like HBase) or SQL query engine (Apache Drill)


[source](http://www.ericsson.com/research-blog/data-knowledge/data-processing-architectures-lambda-and-kappa/)
