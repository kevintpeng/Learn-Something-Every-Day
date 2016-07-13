# NGINX Caching
- to enable caching, `proxy_cache_path` directive at the top level of `http` context
  - takes first parameter, local filesystem path for cached content
  - second parameter, `keys_zone` defines the name and size of the shared memory zone, used to store metadata about cached items
  - `proxy_cache_path /data/nginx/cache keys_zone=one:10m;`
- `proxy_cache` directive in the context for which you want to cache server responses, specifying zone name

```sh
proxy_cache_path /path/to/cache levels=1:2 keys_zone=my_cache:10m max_size=10g inactive=60m
                 use_temp_path=off;

server {
    # ...
    location / {
        proxy_cache my_cache;
        proxy_cache_lock on;

        proxy_pass http://my_upstream;
    }
}
```
In location context:
- `proxy_cache_revalidate on;` instructs nginx to use conditional GET requests when refreshing content from origin if client requests a resource that is cached but expired by the cache control headers, then nginx uses the If-Modified-Since field in the header of the GET
- `proxy_cache_min_uses 3;` number of requests before nginx caches the request
- `proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;` determines when stale content should be served ([see SO question](http://serverfault.com/questions/752838/nginx-use-proxy-cache-if-backend-is-down))
  - the `updating` parameter instructs nginx to deliver stale content while an update is being downloaded from the upstream server (avoids multiple requests to the upstream server)
  - `error` permits using stale cached responses if the proxied server cannot be selected
- `proxy_cache_lock on/off;` only allows one request at a time to populate a new cache element (according to `proxy_cache_key`). All cache 'MISS' will wait for the first request to be satisfied, then pull from the cache
  - can be used to minimize the number of accesses to proxied servers, reducing load 
- `proxy_next_stream` directive defines a failover upstream server to request to (has exact same parameters as `use_stale`)

### Splitting a Cache
```sh
proxy_cache_path /path/to/hdd1 levels=1:2 keys_zone=my_cache_hdd1:10m max_size=10g 
                 inactive=60m use_temp_path=off;
proxy_cache_path /path/to/hdd2 levels=1:2 keys_zone=my_cache_hdd2:10m max_size=10g 
                 inactive=60m use_temp_path=off;

split_clients $request_uri $my_cache {
              50%          “my_cache_hdd1”;
              50%          “my_cache_hdd2”;
}

server {
    # ...
    location / {
        proxy_cache $my_cache;
        proxy_pass http://my_upstream;
    }
}
```

### HTTP Headers
`add_header X-Cache-Status $upstream_cache_status;` adds the cache status in the response:
- `MISS` not cached
- `BYPASS` response was fetched from origin instead of cache
- `EXPIRED` the entry in the cache has expired, responds with the origin server content
- `STALE` origin was not responding, so content was served based on `proxy_cache_use_stale` configurations
- `UPDATING` stale because proxy is updating `proxy_cache_use_stale updating`
- `REVALIDATED` the `proxy_cache_revalidate` directive was enabled and verified that content was valid
- `HIT`

- Nginx respects `Cache-Control` headers from the origin server by default
- does not cache Private, No-Cache, No-Store, or responses with a `Set-Cookie` header
- also only caches `GET` and `HEAD` requests from clients

[source](https://www.nginx.com/blog/nginx-caching-guide/)
