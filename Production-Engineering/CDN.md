# Content Delivery Network
CDN describes Globally distributed network of proxy servers, deployed in multiple data centers. 
- serves content to end-users 
- should be more reliable, better performance
- serve web objects, media files, live streaming media ...
- web caches are used at various points throughout the CDN

Akamai, Fastly are CDN providers.

### Fastly Caching
- once a piece of content has been generated, shouldn't need to be generated again
- stores a copy in a cache 
- caching machines should be optimized for serving small files quickly
- a **cache miss** is when content is not cached yet, CDNs should minimize number of cache misses
- effective at caching small static resources (CSS, images, JS)
