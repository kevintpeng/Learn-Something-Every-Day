### [This Job is Too Hard](https://www.youtube.com/watch?v=gCQfFXSHSxw)
- we should aim for a single source of truth for things like ports
  - bring together docker, kubernetes, packer
- Configuration `yaml` becomes Turing complete, maybe we can build a programming language for configurations
- language idiomatic cloud; cloud configuration will be built into languages as a feature

### [Feature Store Architecture](https://medium.com/intuitionmachine/google-and-ubers-best-practices-for-deep-learning-58488a8899b6)
Need a system that manages reliable, reproducible pipelines for training and prediction data
- many technologies, including Samza, distributed stream processing implemented with Kafka and YARN

[uber's system](https://eng.uber.com/michelangelo/) supports deep learning and other machine learning methods
- makes distinction of "online vs offline" data
- feature stores are hubs for data that has been extracted and transformed into a usable format, reusable across projects
- offline is useful for batch model training and prediction jobs
- the online feature store is for performant access patterns on precomputed features (aggregate features like averages over time periods)
  - online allows for low latency reads at prediction time
  - batch precompute is good for historical features moving from offline feature store to the online cassandra feature store
  - near real-time compute comes in directly through kafka, processed by Samza to generate the aggregate feature and eventually written back to the offline feature store
  - *so I think the purpose of the online feature store is so that models can fetch the current "state" for a user, in order to make predictions, while the offline store is for batching up training data to generate models in the first place*
- training is performed in YARN or Mesos
  - *I think by doing all the training with offline data, this doesn't enable certain classes of algorithms to be implemented, Recurrent neural networks come to mind*
- trained models a stored in a cassandra cluster (versioned with performance and evaluation, and meta data)
