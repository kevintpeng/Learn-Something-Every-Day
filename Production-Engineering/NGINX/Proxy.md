# NGINX Proxying
- used to distribute the load among several servers, seamlessly show content from different websites, pass a request for processing to application servers over protocols other than HTTP
- when NGINX proxies a request, it sends the request to a specified proxied server, fetches response and sends it back to the client

### Basic HTTP Proxy Pass
Involves handing off a request to a single server with http, known as a generic "proxy pass" handled by the `proxy_pass` directive.
- the `ngx_http_proxy_module` allows passing requests to another server
- `proxy_pass` sets the protocol and address of a proxied server, directive in `location` context
