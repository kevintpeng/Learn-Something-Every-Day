# NGINX
General purpose web server. Uses asynchronous event-driven approach to handling requests. Can handle high volumes of connections, with low memory footprint.

Nginx is often set up as a reverse proxy solution, scaling infrastructures or passing requests to other servers not designed to handle large client loads.

### Proxying
Nginx is designed to handle many concurrent connections.
- ideal point of contacts for clients
- can pass requests to many backend servers to handle the bulk of work
  - distributes load across infrastructure
- allows for adding and taking down servers as needed (cost, maintainance)

Proxying is accomplished by passing requests to other servers for actual processing, which relays back through Nginx to the client.
- the servers that recieve proxied requests are called upstream servers
- can proxy requests to servers using http(s), FastCGI, memcached protocols through separate sets of directives for each type of proxy

### Basic HTTP Proxy Pass
Involves handing off a request to a single server with http, known as a generic "proxy pass" handled by the `proxy_pass` directive.

[source](https://www.digitalocean.com/community/tutorials/understanding-nginx-http-proxying-load-balancing-buffering-and-caching)
