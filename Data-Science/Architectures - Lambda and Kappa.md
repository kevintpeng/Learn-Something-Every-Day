# Data Processing Architectures - Lambda and Kappa
Lambda and Kappa architectures are popular choices for real-time data processing. A good real-time data processing architecture must be fault-tolerant, scalable, supports batch and incremental updates, and is extensible.

## Lambda
Lambda architecture is good for its many use-cases. Lambda is composed of 3 layers; batch, speed and serving:

![lambda figure](http://www.ericsson.com/research-blog/wp-content/uploads/2015/11/LambdaKappa1_1.png)

[Batch layer](Big Data Processing.md) has two major tasks:
- managaing historic data
- recomputing results such as machine learning models

Speed layer is used to provide results in low-latency. Does [real-time data processing](Big Data Processing.md) by performing incremental updates to the batch layer results (with significantly lower computation cost).

Serving layer enables various queries of stored results (the data warehouse).

## Kappa 
addresses some pitfalls of Lambda, but it is not a replacement for Lambda. Kappa avoids the need to maintain two separate code bases for the batch and speed layers of processing. The key idea is to handle both real-time and batch processing using a single stream. 

![kappa figure](http://www.ericsson.com/research-blog/wp-content/uploads/2015/11/LambdaKappa1_2.png)


[source](http://www.ericsson.com/research-blog/data-knowledge/data-processing-architectures-lambda-and-kappa/)
