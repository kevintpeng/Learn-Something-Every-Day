# nginx HTTP load balancer
Load balancing across multiple application instances optimizes resource utilization

### Methods
- round-robin: requests are distributed in a round-robin fashion, assigning sequentially (default)
- least-connected: next request is assigned to the server with the least number of active users
- ip-hash: a hash function is used to determin what server should be selected (based on IP)
  - good for "sticky" configurations, of sending clients to the same app server
  
### Default Config
```conf
http {
    upstream myapp1 {
        server srv1.example.com;
        server srv2.example.com;
        server srv3.example.com;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://myapp1;
        }
    }
}
```
- round-robin by default, or define `least_conn` directive at the top of the `upstream` block
- `ip_hash` directive in the upstream group configuration applies the ip hash algorithm
- `weight=` is a directive (optional parameter of the `server` directive), increases likelihood of matching in load balancing (default weight=1)

### Health checks
Reverse proxy implementation in nginx includes *in-band* server health checks
- if response from a particular server fails with an error, load balancer will avoid selecting this server for subsequent requests
  - `max_fail` directive (for `server`) sets number of consecutive unsuccessful attempts during `fail_timeout` (default 1)
  
  
