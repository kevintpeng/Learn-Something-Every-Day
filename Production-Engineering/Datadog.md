# Datadog
Recieves lots of metrics and events from applications and services, providing dashboards, alerts and metrics.
- visualizes monitoring data and creates alerts based on it
- Has two types of data: **events*** and **metrics**
  - events are infrequent significant events (deploys, restarts)
  - metrics are frequent, interested in aggregating over time
  - events are sent to Datadog using HTTP-based API
  
[source](http://docs.datadoghq.com/)

### DogStatsD
- see [StatsD](./StatsD.md) for background
- datadog metric server, bundled with datadog agent for tracking custom metrics
- DogStatsD accepts custom application metrics points over UDP, per
```ruby
# Import the library
require 'datadog/statsd'

# Create a statsd client instance.
statsd = Datadog::Statsd.new
```
