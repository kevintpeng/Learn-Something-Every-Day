# NGINX Proxying
- used to distribute the load among several servers, seamlessly show content from different websites, pass a request for processing to application servers over protocols other than HTTP
- when NGINX proxies a request, it sends the request to a specified proxied server, fetches response and sends it back to the client
- NGINX runs on the *proxy server* and can redirect to other *proxied servers*, including public domains and web pages

Proxying involves handing off a request to a single server with http, known as a generic "proxy pass" handled by the `proxy_pass` directive.
- the `ngx_http_proxy_module` allows passing requests to another server
- `proxy_pass` sets the protocol and address of a proxied server, directive in `location` context
- `proxy_set_header <Attribute> <value>;` sets values for [header fields](../../Networking/HTTP.md) as seen by the proxied server (you can set to empty string to hide them)
- `proxy_redirect` will modify the "Location" response header based on specified prefixed string matching
  - `proxy_redirect http://localhost:8000/two/ http://frontend/one/` will rewrite the string “Location: http://localhost:8000/two/some/uri/” to  “Location: http://frontend/one/some/uri/”.

### Buffers
- NGINX buffers responses from proxied servers 
- a response is stored in the internal buffers, not sent to client until the whole response is recieved
- buffering optimizes performance with slow clients, can waste proxied server time if the response is passed from NGINX to the client synchronously
- controlled by `proxy_buffers` directive. It is the number of buffers allocated for a request
- having no buffering is desirable for fast clients that need to recieve response as soon as possible

### Outgoing IP Address
Useful if the proxy server has several network interfaces and proxied servers accept connections from particular IP networks or address ranges
- `proxy_bind` directive specifies IP address of the necessary network interface
- can use IP address of the network interface that accepted the request: `proxy_bind $server_addr`
- `transparent` parameter allows outgoing connections to originate from a non-local IP address, like the real client IP: `proxy_bind $remote_addr transparent;` (run nginx worker processes with superuser)
