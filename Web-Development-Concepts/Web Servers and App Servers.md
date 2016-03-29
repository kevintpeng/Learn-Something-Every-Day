# Web Servers
Serve static files, but with the right modules, can also serve dynamic web apps. [Apache](Web-Technologies/Apache.md) is more popular with more features, [NGINX](Web-Technologies/NGINX.md) is faster with less features. Neither can serve Ruby web apps out-of-the-box and need additional modules.

Apache and NGINX can also act as reverse rproxies meaning they can take incoming HTTP requests and forward it to another server, which also speaks HTTP. 

## Mongrel and other production app servers and WEBrick
Mongrel is a Ruby "application server": 
1. It loads the Ruby app in its own process space 
2. Sets up a TCP socket allowing it to communicate with the internet (Mongrel listens for HTTP requests on this socket and passes the request data to the Ruby web app)
3. Ruby web app returns an object which describes what the HTTP response should look like, Mongrel converts it to an actual HTTP response and sends it back over the socket.

Mongrel is dated, and newer comparable application servers are:
- [Unicorn](Web-Technologies/Unicorn.md)
- Puma
- Thin
- Phusion Passenger

WEBrick is the built in Ruby app server, but WEBrick **is not fit for production** (written entirely in ruby so poor performance).
