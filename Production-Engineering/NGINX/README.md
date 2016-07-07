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

### Basics
- has one master process, several worker processes
- master reads and evaluated configuration (from conf file), maintains worker processes
- workers process requests
- start nginx from the binary, `nginx -s signal` where signals are
  - `stop` fast shutdown, `quit` graceful shutdown, `reload` conf, `reopen` log files
- nginx **conf file structure** consists of modules which are controlled by directives, specified in the configuration file
  - the top of the tree structure defines "contexts", containing configuration separated by their area of concern
  - each context contains simple directives or directive blocks 
    - any directive existing outside of a context block is said to be in the main context, inherited by all contexts
    - simple directives consist of name and parameters, space delimited, end with `;`
  - `event` context sets global options that affect how Nginx handles connections 
  - `http` context holds all configuration regarding http connections (as a web server/reverse proxy)
  - `server` context is declared within the `http` context
  - `location` contexts are nested in `server`, catch subsets of traffic and directs it to the proper files to be served
- nginx can server static content, through request processing
  - `/data/www` contains html files and other assets
  - requires setting up a `server` block inside the `http` block
  - the conf file may include several `server` blocks, distinguished by ports (`listen`, default 80) and `server_name` (domain name) 

**Example:**
```
http{
  server {
    location / {
        root /data/www;
    }

    location /images/ {
        root /data;
    }
  }
}
```

### General (Common Mistakes)
- never use `Chmod 777`. On web-servers, this give anyone rwx permissions on all files 
- don't use `root` directive inside a location block
- avoid multiple index directives (put `index` under `http` block)
- avoid the `if` directive inside a location context
  - the only safe things inside if in location context are `return` and `rewrite` 
```
    if ($something) {
        return 418;
    }
```
- don't do `if($host ... )`, inefficient, checks host header for every request
  - user `server_name` directive to differentiate responses based on the Host header

[source](https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/)

### defaults
- `/etc/nginx/mime.types` holds media types (derrived from Multipurpose internet mail extensions)
- `default_type` directive defines what to send when you have no file extensions
- [core module](http://nginx.org/en/docs/ngx_core_module.html)
  - `user` directive defines user and group credentials used by worker processes
  - `debug_connection` directive enables debugging log for a given client
  - `error_log` defines path and severity

[source](https://www.digitalocean.com/community/tutorials/understanding-nginx-http-proxying-load-balancing-buffering-and-caching)
