# HTTP Accelerator/Reverse Proxy
Type of proxy server that retrieves resources on behalf of a client. Resources are returned to the client as if they originated from the proxy server rather than its upstreams.

Forward proxies act as an intermediary for the client, a Reverse proxy acts as an intermediary for groups of servers.

### Varnish
Designed for content heavy dynamic web sites, focused exclusively on HTTP. Unlike others, varnish was designed as an HTTP accelerator.
- supports load balancing, with `Saint mode` for handling failing upstream servers by blacklisting them for quarantine periods
- configuration mechanism is *Varnish Configuration Language*, a DSL used to write hooks that are called when handlign requests
- VCL is compiled to C
- supports Gzip compression
- **If the server malfunctions and returns 50x errors, `Grace mode` will ignore expiry headers and continue to return cached versions**
