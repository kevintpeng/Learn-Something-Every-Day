# StatsD
A simple protocol and daemon to aggregate and summarize application metrics
- applications have a client (language specific library) that communicate with the StatsD daemon, which generates metrics and relays them to a monitoring backend
- the StatsD client library sends individual calls to the StatsD server over a UDP datagram (UDP, no acknoledgement, no library blocking when submitting data)
  - doesn't buffer data between calls to the server, so less complexity
- the StatsD daemon listens to UDP traffic from all applcation libraries and aggregates data over time, and flushing it to the data backend on defined intervals
- the monitoring backend turns metrics into usable charts and alerts (Datadog)
- StatsD offers more simplicity over other methods, by decoupling the application from its instrumentation (StatsD won't crash your app)

