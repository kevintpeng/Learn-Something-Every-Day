# Overview
### Development Process
1. Choose where the app should live (physical or cloud)
2. Chef to provision and configure node
  - chef-client run carries out roles and recipes, in ordered run-list
3. knife ssh into the app for access.
4. Buildkite to test code
5. Shipit to deploy code

### Looking at Rails
Typical rails setups use a fixed pool of worker processes, each worker handles only on request at a time
- slow processes will backlog, and auto-scaling groups cannot react fast enough
- very wasteful, since workers often wait on other service to complete
- one-process-per-request model isn't scalable compared to async model
- NGINX caching helps decrease the number of requests that actually have to reach rails
