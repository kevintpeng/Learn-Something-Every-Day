# Kafka
Kafka is publish-subscribe messaging system, as a replacement for a traditional message broker. Message brokers decouple processing from data producers, and provide message validation, transformation and routing.
- can be used for website activity tracking, with real-time publish-subscribe feeds 
  - site activity (page views, searches, actions) is published to central topics, with one topic per activity type
  - feeds are available for subscription for a range of use cases, like real-time processing, monitoring, logging
- Metrics, tracking operational data
- Log aggregation as a stream of messages
