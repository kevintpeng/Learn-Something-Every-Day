# Secure Socket Layer
Transport Layer Security (TLS), preceded by SSL, are cryptographic protocols, that provide communication security.
- client-server applications use TLS protocols 
- aims to provide data integrity between two communicating computer applications 
- standard for establishing an encrypted link between a web server and a browser
- link ensures all data tranfer is private
- an SSL connection requires an SSL certificate, using public and private keys
- public key is placed into Certificate Signing Request (a CSR file containing your details)
  - submit the CSR, then during SSL certificate application process, the certification authority will validate your details, and issues an SSL certificate containing your details and allowing you to use SSL.

### Web Sockets
Sockets are endpoints of two way communicaiton. Unix domain sockets use TCP or UDP. SSL (secure socket layer) is the standard security protocol.

[source](https://en.wikipedia.org/wiki/Transport_Layer_Security)
