# Buildkite
Buildkite enables the ability to run a high volume of jobs in parallel (very fast) for tasks like CI (with large test suites). You choose your infrastructure (can use AWS, Google Cloud, DigitalOcean, Heroku...) and supports containerised builds with Docker. Each agent is just a physical machine somewhere, and buildkite connects them to a network of machines. 

### Buildkite Agent
The buildkite agent is a build runner that runs automated builds on your own infrastructure. Its responsible for running build jobs and reporting the status back to output logs.

Each agent has a configuration file with meta data (key value pairs), jobs connect to agents based on meta-data. 
