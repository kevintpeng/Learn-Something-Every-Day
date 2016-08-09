# HTTP
HTTP is a protocol for serving web pages. A HTTP server takes HTTP requests in the form of a verb and a URI. [RESTful APIs](REST.md) describes a convention for how HTTP verbs should be used and how URLs should be formatted. 

### Idempotency
Idempotence is a mathematical property for operations, that can be applied multiple times without changing the result. In HTTP, this describes the ability to send requests to the pipeline multiple times without side effects (like creating multiple records). 

Examples of idemopotent operations: listing (GET) domains, query (GET) items, delete (DELETE) a domain, update (PUT) attributes ...

Examples of non-idempotent requests: create (POST) a domain, create (POST) an attribute

### HTTP Verbs
- **GET**: Only function is to send information back to the client. Should be repeatable without side effects (Idempotence). 
- **POST**: Does operation with side effects. Not repeatable.
- **DELETE**: Only function for destructive operations (non repeatable).
- **PUT**: function to modify an object and update it.

