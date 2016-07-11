# HTTP
### Request
HTTP messages consist of requests from client to server and responses from server.
- CRLF (Carrige Return/move to start, Line Feed/newline)
- the request message includes method applied to the resource, identifier of the resource, and protocol version
- request-line begins with method token, followed by Request-URI, protocol version, ends with CRLF
  - Methods include `OPTIONS GET HEAD POST PUT DELETE TRACE CONNECT`
    - 405 (Method Not Allowed) known and disallowed, 501 (Not Implemented) unknown or not implemented by server
  - The Request-URI is a uniform resource identifier (which resource)
    - `Request-URI    = "*" | absoluteURI | abs_path | authority`
    - the `absoluteURI` form is required when the request is made to a proxy, `GET http://www.w3.org/pub/WWW/TheProject.html HTTP/1.1`
    - `authority` form is only used by the `CONNECT` method
    - common request-URI is used to identify a resource on an origin server or gateway
      - absolute path of the URI is transmitted as the Request-URI
      - Network location of the URI (authority) must be transmitted in a Host header field
      - transparent proxies must not rewrite the `abs_path` part of the received Request-URI when forwarding 
```
       GET /pub/WWW/TheProject.html HTTP/1.1
       Host: www.w3.org
```

### Header
Part of requests and responses, contains fields defining the operating parameters of an HTTP transaction
- `Accept: text/plain`
- `Accept-Charset: utf-8`
- `Host: en.wikipedia.org` domain name 
- `User-Agent:` string
- `Cache-Control:`  comma delimited list of response directives:
  - `private || public`, whether or not it should be cached
  - `no-cache`, cache should revalidate this resource every time
- `expires`
- `etag`, response header, critical for caching and used for conditional requests (invoking 304s)
- `vary`
- `pragma: no-cache`
- `Location` header is returned to ask a web browser to load a different web page (URL redirection) or sent with HTTP status codes `3xx`

### ETags (Entity tag)


### Statuses
- 200 OK
- `301` is a permanent redirect, when content is moved forever, browser should always request the new URL instead
- `302` is a temporary redirect, tell the browser that the content is temporarily located at a different location, but they should continue to attempt the original URL on later requests
- `304 not modified`, the conditional GET request would have recieved `200 OK`, but the condition was false.
  - minimize the amount of information transfer to the client
- `416` request range not satisfiable

[really good source](https://www.w3.org/Protocols/rfc2616/rfc2616.html)
