# Sidekiq
Asynchronously handles background tasks with multiple threads with three architectural components:
- Sidekiq client is a ruby process, that receives jobs to be handled, via `Sidekiq::Client.push`
  - return a hash representing the job, which is serialized to JSON and pushed into a queue in Redis
- Redis is the persistent store for holding runtime and historical data 
  - stores all job and operational data
- Sidekiq Servers pull jobs from the queue and process them

Jobs, should be idempotent and transactional (think databases)
