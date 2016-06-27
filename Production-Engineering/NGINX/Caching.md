# NGINX Caching
- to enable caching, `proxy_cache_path` directive at the top level of `http` context
  - takes first parameter, local filesystem path for cached content
  - second parameter, `keys_zone` defines the name and size of the shared memory zone, used to store metadata about cached items
  - `proxy_cache_path /data/nginx/cache keys_zone=one:10m;`
- `proxy_cache` directive in the context for which you want to cache server responses, specifying zone name
