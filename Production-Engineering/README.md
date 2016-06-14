# Overview
### Development Process
1. Choose where the app should live (physical or cloud)
2. Chef to provision and configure node
  - select app role, which boots sub roles and recipes
3. knife ssh into the app for access.

### Production Setup
1. HTTP request is recieved by NGINX (Sorting Hat) 
  - queries MySQL for shard and datacenter
  - forward request to appropriate data center (or cloud)
1. next
