# Buildkite
Buildkite enables the ability to run a high volume of jobs in parallel (very fast) for tasks like CI (with large test suites). You choose your infrastructure (can use AWS, Google Cloud, DigitalOcean, Heroku...) and supports containerised builds with Docker. Each agent is just a physical machine somewhere (e.g. using EC2), and buildkite connects them to a network of machines for parallel computing. 

### Buildkite Agent
The buildkite agent is a build runner that runs automated builds on your own infrastructure. Its responsible for running build jobs and reporting the status back to output logs.

Each agent has a configuration file with meta data (key value pairs), jobs connect to agents based on meta-data. Meta-data can help each agent talk to buildkite.

### Buildkite Pipeline
Build pipelines take your build, split them into smaller steps and parallelizes them over multiple build agents (huge speed improvements for builds).

### Builds
Can be scripts or specific processes to be run on agents throught hte buildkite pipeline.

### Buildkite Webhooks
Allow you to monitor and respond to events within your buildkite organization. Provides real time view of activity.

### Buildkite API
API gives programmatic access to extend, integrate and automate anything. 
