# FastCGI
Variation of [Common Gateway Interface](../../Networking/CGI.md), aimed to reduce overhead associated with interfacing the web server and CGI programs. Allows the server to handle more requests.
- instead of creating a new process for each request, FastCGI uses persistent processes to handle many requests each
  - processes are owned by the FastCGI server rather than the web server
  - avoids process creation/termination overhead
- for a request, web server sends env information and the page request to a FastCGI process via sockets or TCP
- in NGINX, the `fastcgi_cache` and `proxy_cache` directives have the same end behaviour, with different backend protocols

### FastCGI is a cluster of workers that processes requests from NGINX
![diagram](https://cdn.deliciousbrains.com/content/uploads/2016/02/02100522/ashleys-server-architecture.svg)
