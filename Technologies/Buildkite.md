# Buildkite
Buildkite enables the ability to run a high volume of jobs in parallel (very fast) for tasks like CI (with large test suites). You choose your infrastructure (can use AWS, Google Cloud, DigitalOcean, Heroku...) and supports containerised builds with Docker. Each agent is just a physical machine somewhere (e.g. using EC2), and buildkite connects them to a network of machines for parallel computing. 

### Buildkite Agent
The buildkite agent is a build runner that runs automated builds on your own infrastructure. Its responsible for running build jobs and reporting the status back to output logs.

Each agent has a configuration file with meta data (key value pairs), jobs connect to agents based on meta-data. Meta-data can help each agent talk to buildkite. An agent can be built on a [docker image](https://github.com/buildkite/docker-buildkite-agent).

### Buildkite Pipeline
Build pipelines take your build, split them into smaller steps and parallelizes them over multiple build agents (huge speed improvements for builds). A Deployment pipeline could have 3 steps `rspec` (for unit testing) then `staging-deploy` and `staging-smoke`, after which the pipeline will become blocked until we manually continue.

### Builds
Can be scripts or specific processes to be run on agents throught hte buildkite pipeline. In the case of Buildkite as a CI, a buildkite agent will run a build, which would be a specific unit test assigned to it by the pipeline.

### Buildkite Webhooks
Allow you to monitor and respond to events within your buildkite organization. Provides real time view of activity.

### Buildkite API
API gives programmatic access to extend, integrate and automate anything. 
