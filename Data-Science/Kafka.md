# Kafka
Kafka is a streaming platform. It's a queue with a lot of features. Queues in infrastructure have a lot of benefits. They enable services to be decoupled, and holds in transit messages if services fail. Kafka is a queue that allows multiple consumers of the same data (without the need for multiple queues). This also means it can be the centralized feed for all data being produced.

Kafka is publish-subscribe messaging system. Messages come from some set of producers, stored into partitions called topics. Abstractly, Kafka is a append-only log which can be read from by consumers at some offset.

Each topic can have multiple subscribers, each with their own client ID with an associated cursor for how much of the topic it has consumed so far. This means that multiple subscribers will each get a copy of the published messages.

Kafka is for realtime streaming systems:
- data pipelines, for moving data between systems
- applications that transform or react to stream data

In addition to a producer API and Consumer API:
- stream API consumes an input stream from topic(s) and produces an output stream to other topics
- connector API, *essentially a library of producer or consumer implementations to connect Kafka to other common systems*

### Guarantees
- Guarantees messages sent by producers will be appended with order preserved.
- all data is preserved on every replica of a topic

### Infrastructure
Kafka is a cluster that can span regions. **Consumer groups** are logical consumers that generalize the tradeoffs between queuing and pub-sub models. They allow multiple subscribers and also allow processing to scale horizontally.
