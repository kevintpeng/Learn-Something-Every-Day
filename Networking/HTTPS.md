# HTTP Secure
Extra layer of encryption, using SSL/TLS
- protects the url, query params, headers, cookies
- address (hostname) and port are a part of the TCP protocols and cannot protect the disclosure of these
- only the server is usually authenticated, through the client examining the server's certificate
  - the public key certificate proves ownership of a public key (so that you know the server that's able to decrypt your messages is exactly who you think they are)
  - cert contains which DNS names are a part of the cert, expiry date, issuer, and of course the public key for encryption

Looking at wikipedia, we see `Issued by: GlobalSign Organization Validation CA`

The issuer in this case is an **intermediate certificate authority**

The intermediate certificate authorities are owned by the **root certificate authority**. These are trusted using some other mechanism, such as secure physical distribution.
