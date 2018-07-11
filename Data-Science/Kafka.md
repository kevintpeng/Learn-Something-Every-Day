# Kafka
Kafka is publish-subscribe messaging system. Messages come from some set of producers, stored into partitions called topics. Abstractly, Kafka is a append-only log which can be read from by consumers at some offset. Design-wise, it seems like it makes use of MVC principles where the "view" is the consumers and you can connect many different views of the data.
- can be used for website activity tracking, with real-time publish-subscribe feeds
  - site activity (page views, searches, actions) is published to central topics, with one topic per activity type
  - feeds are available for subscription for a range of use cases, like real-time processing, monitoring, logging
- Metrics, tracking operational data
- Log aggregation as a stream of messages

Publish and subscribe to streams of records, similar to a message queue, handles a firehose of data
- lets you store streams of records
- lets you process streams

Used for real-time streaming data pipelines that move data between systems, or real-time streaming applications that react to or transform data

Kafka can be used to perform to "Extract" portion of an ETL pipeline, as the router

Each topic can have multiple subscribers, each with their own client ID with an associated cursor for how much of the topic it has consumed so far. This means that multiple subscribers will each get a copy of the published messages.
