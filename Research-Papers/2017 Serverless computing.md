# [Serverless computing: economic and architectural impact](https://blog.acolyer.org/2017/10/19/serverless-computing-economic-and-architectural-impact/)
Serverless is a "next-gen" platform as a service model where the service provider handles capacity planning, task scheduling, and operating the cluster. Clients send functions to be executed and pay only for the duration of execution
- further, the application developer, in the example of a webserver, need not handle socket listening and task dispatching and are only responsible for the logic of processing an event
- AWS lambda runs containers, and manages creation and deletion
  - containers are tried to be reused for subsequent function calls (since creation can have latency times in the seconds)
- economic benefit comes from jobs that need to only run periodically need not reserve resources while idle
- one implication is that implicit trust between sequential requests is lost (no gatekeeper so everything request must be authenticated)
  - increased latency for traditional design, and requires a different concept of distributed authentication
- serverless architecture removes economic incentives for bundling logic into single applications
- running multiple versions has no extra cost in serverless architecture since the number of requests remains the same
