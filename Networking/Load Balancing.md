# Load Balancing
In distributed systems, load balancing aims to optimize resource use

## Terminology
- **High Availability Proxy (HAProxy)** is a TCP/HTTP Load Balancer and proxying solution. Open source software.
- **Access Control Lists (ACL)** are used to test conditions and perform actions based on conditions.
- **Backend** is a set of servers that recieves forwarded requests. Contains list of servers and load balancing algorithm.
- **Frontend** defines how requests should be forwarded to backends.

### HAProxy
High Availability load balancer and proxy server for TCP/HTTP
- High availability describes reliability (using multithreading, multiple instances, failiure detection)

### Types of Load Balancing
- **No load balancing**, user -> internet -> web server (yourdomain.com) -> Database
- **Layer 4 Load Balancing**, user -> internet -> load balancer (yourdomain.com) -> multiple web servers -> database
  - works towards High Availability setup
  - HAProxy uses health checks to determine if a backup server is available to process request
![layer4](https://assets.digitalocean.com/articles/HAProxy/layer_4_load_balancing.png)
![HA setup](https://assets.digitalocean.com/articles/high_availability/ha-diagram-animated.gif)

### Other Solutions
- Linux Virtual Server (LVS), simple layer 4 Load Balancer
- Nginx, fast and reliable web server, can be used for proxy or load balancing
  - often used in conjunction with HAProxy for caching and compression capabilities

- [source](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
- [setup](https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-as-a-layer-4-load-balancer-for-wordpress-application-servers-on-ubuntu-14-04)

# [NGINX Load Balancing](../Production-Engineering/NGINX/Load Balancing.md)

TODO, what are:
- BGP
- ECMP
