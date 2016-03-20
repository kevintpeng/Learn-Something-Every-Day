# Hadoop 
A framework for storing and processing big data. Written in java. The logo is a baby elephant. 

![Cute Baby Elephant](https://hadoop.apache.org/docs/r1.0.4/images/hadoop-logo-2.gif "Hadoop Logo") 

## Big Data Analysis Approaches
#### Simple 
A single computer stores all data, in some sort of relational database for example, and users connect to the server to access the information. This is limits the volume of data, or increases costs.
#### Distributed System
Google was the first to implement a MapReduce algorithm. It divides the data into small parts and assigns it to many computers in a network, all unified by a centralised system. This is what Hadoop originates from. By using MapReduce, Hadoop uses parallel computing to process data, running "clusters" of computers that perform complex tasks on large volumes of data.
## Introduction to Hadoop
There are four core modules in Hadoop:
* **Hadoop Common:** Provides filesystem and OS level abstractions. Needed to start Hadoop.
* **Hadoop YARN:** framework for job scheduling and cluster resource management.
* **Hadoop Distributed File System:** a file system that provides access to application data.
* **Hadoop MapReduce:** system for parallel processing of large sets of data.

These provide the main components of Hadoop: **MapReduce** (Distributed Computation), **HDFS** (Distributed Storage), **YARN Framework**, and **Common Utilities.**

## More on the MapReduce Algorithm
A MapReduce program is composed of a Map() method, that performs filtering on data (some sort of sorting for example) and a Reduce() method that runs a summary operation on the filtered data. A simple example of a MapReduce algorithm 
