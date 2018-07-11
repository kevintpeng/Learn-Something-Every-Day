# ELK Stack
## See [Elasticsearch notes](./Elasticsearch.md)

## Logstash
Data processing pipeline that can ingest from multiple sources and store to Elasticsearch
- used for logs, metrics, and sometimes other use cases
- parses and transforms data on the fly
- can be used to filter out incoming logs

Has three stages:

1. **input**, different methods, like Beats, redis, kafka, and [more](https://www.elastic.co/guide/en/logstash/current/input-plugins.html)
2. **filters**, grok, mutate (for transformations on logs/data)
3. **output**, elasticsearch, file, statsd

## Kibana
Part of the elasticsearch ecosystem, by enabling visual exploration and analysis
- **index patterns** describe which elasticsearch indices you want to explore
- the `discover` tab lets you query data in elasticsearch from indices matching your index pattern
- you can build dashboards for viewing common data plots
- there's a `dev tools` tab that provides a UI to interact with the REST API of Elasticsearch
- Watcher UI allows you to interact with your watches from Kibana
