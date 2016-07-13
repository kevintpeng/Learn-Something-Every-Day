# Variables
- `$host`: host name from request line OR host name from the "Host" request header OR the server name matching a request 
- variables that begin with `$proxy_` controls what goes from nginx to the upstream
- `$upstream_<header>` accesses header responses from the upstream
