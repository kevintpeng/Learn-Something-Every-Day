# Phusion Passenger
Phusion Passenger is an app server that integrates directly into web servers Apache and NGINX. Instead of starting a process or cluster for the app and configuring static/reverse proxy, the only step is to specify location of Ruby app's 'public' directory (convention over configuration).
- Dynamically adjusts the number of processes based on traffic
- Good for streaming workloads and workloads that involve HTTP API calls (Unicorn is bad for these)
  - because of hybrid I/O model
- automated rolling restarts without scripting
