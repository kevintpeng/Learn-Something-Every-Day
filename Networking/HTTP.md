# HTTP
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
- `etag`
- `vary`
- `pragma: no-cache`

### Statuses
- 200 OK
- `304 not modified`, the conditional GET request would have recieved `200 OK`, but the condition was false.
  - minimize the amount of information transfer to the client
