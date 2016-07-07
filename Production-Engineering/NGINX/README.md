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

### Block Selection
Nginx uses blocks to build hierarchical configuration structure.
- server blocks define virtual servers used to handle requests
- location blocks live in server blocks, and define how Nginx handles requests for different resources and URIs

##### server blocks
Nginx determines which server block to use with `listen` and `server_name`
- `listen` directive can be set to an IP address/port combo, lone IP address with default port 80, lone port listening to every interface on that port, or the path to a unix socket
- `server_name` directive is only evaluated if it needs to distinguish between server blocks that match the same level of specificity in the `listen` directive
  - checks the host header for the server name

##### location blocks
location directives look like: `location <optional_modifier> <location_match> {}`
- location match above defines what Nginx should check the request URI against
- the modifiers cause the associated block to be interpreted differently
  - **(none)** the location is interpreted as a *prefix* match, matched against the beginning of the request URI
  - `=`, the location match will be considered if matching exactly
  - `~`, the location will be interpreted as a regex
  - `~*`, case-insensitive regex
  - `^~`, if selected as the best non-regular expression match, regex matching will not take place

[source](https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms)

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
- don't use `if` to check files, use `try_file` directive
  - `try_files $uri $uri/ /index.html;` check `$uri`, then `$uri/`, otherwise use `/index.html`
- regex can be taxing computationally in `rewrites`
  - BAD: `rewrite ^/(.*)$ http://example.com/$1 permanent;`
  - GOOD: `rewrite ^ http://example.com$request_uri? permanent;`
  - BETTER: `return 301 http://example.com$request_uri;`
- do not use hostname in the `listen` directive, use known IP addresses if possible instead

[source](https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/)

### defaults
- `/etc/nginx/mime.types` holds media types (derrived from Multipurpose internet mail extensions)
- `default_type` directive defines what to send when you have no file extensions
- [core module](http://nginx.org/en/docs/ngx_core_module.html)
  - `user` directive defines user and group credentials used by worker processes
  - `debug_connection` directive enables debugging log for a given client
  - `error_log` defines path and severity
  - `sendfile`
[source](https://www.digitalocean.com/community/tutorials/understanding-nginx-http-proxying-load-balancing-buffering-and-caching)
