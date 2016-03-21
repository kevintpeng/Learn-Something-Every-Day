# Hadoop 
A framework for storing and processing big data. Useful for creating and managing distributed systems, over a network of computers. Written in java. The logo is a baby elephant. 

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

#### More on the MapReduce Algorithm
A MapReduce program is composed of a Map() method, that reformats data  into a key-value pairs (tuples), and a Reduce() method that combines tuples into smaller sets of tuples. MapReduce framework has a single master **JobTracker** and slave **TaskTracker** per cluster-node.

#### Hadoop Distributed File System
Provides a system for file management over a distributed system of hundreds of computers.

#### How Hadoop Works
**Stage 1**: Specify a job, with the location of input and output files, the map reduce functions, and the configurations.

**Stage 2:** The Hadoop job client submits the job (.exe) and configurations to JobTracker which distributes the job to the slaves, while monitoring their status.

**Stage 3:** The TaskTracker on different nodes executes the MapReduce function and stores the output data.

#### Advantages of Hadoop
* Hadoop framework provides quick writing and testing of distributed systems. 
* Servers can be added/removed from clusters dynamically without interupting the system.
