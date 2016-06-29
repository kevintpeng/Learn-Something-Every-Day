# HTTP
### Header
Part of requests and responses, contains fields defining the operating parameters of an HTTP transaction
- `Accept: text/plain`
- `Accept-Charset: utf-8`
- `Host: en.wikipedia.org` domain name 
- `User-Agent:` string

### Statuses
- 200 OK
- `304 not modified`, the conditional GET request would have recieved `200 OK`, but the condition was false.
  - minimize the amount of information transfer to the client
