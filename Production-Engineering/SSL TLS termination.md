# SSL/TLS Termination
Is a proxy server that is used to handle incoming TLS connecitons, decrypting the TLS and passing on unencrypted requests to other servers. This reduces the load on the upstream servers by not having to handle decryption and encryption.
- Apache HTTP server, HAProxy, Nginx, Squid can all act as SSL termination proxies
- ssl can be terminated at the load balancer level if the connection to the upstream (data centers or cloud servers) is very trustworthy
- this [source](http://security.stackexchange.com/questions/30403/should-ssl-be-terminated-at-a-load-balancer) mentions that ssl should be terminated at the load balancer because it offers a centralized place to correct SSL attacks, reducing termination complexity
