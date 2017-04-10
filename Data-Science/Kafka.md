# Kafka 
Kafka is publish-subscribe messaging system, as a replacement for a traditional message broker. Message brokers decouple processing from data producers, and provide message validation, transformation and routing.
- can be used for website activity tracking, with real-time publish-subscribe feeds 
  - site activity (page views, searches, actions) is published to central topics, with one topic per activity type
  - feeds are available for subscription for a range of use cases, like real-time processing, monitoring, logging
- Metrics, tracking operational data
- Log aggregation as a stream of messages

![logo](http://kafka.apache.org/images/kafka_logo.png)

Publish and subscribe to streams of records, similar to a message queue, handles a firehose of data
- lets you store streams of records 
- lets you process streams

Used for real-time streaming data pipelines that move data between systems, or real-time streaming applications that react to or transform data

4 APIs
- Producer: allows publishing to a Kafka topic
- Consumer: allows application to subscribe to a topic 
- Stream: 
- Connector: 

Kafka can be used to perform to "Extract" portion of an ETL pipeline, as the router

### Types of architecture
Kafka -> stream processing + algorithmic analysis -> Kafka

Kafka -> Splunk

Kafka -> Flume -> HDFS
