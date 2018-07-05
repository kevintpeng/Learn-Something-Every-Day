# ElastiCache
Service that makes deploying a caching system easier by managing hardware
- Redis and Memcached are available engines
  - memcached is simple, and scales horizontally with auto discovery for adding
  - has less features, each node starts empty
  - redis is more feature rich, including state snapshotting
  - redis clusters can only have one node, with up to 6 replica clusters
- offers horizontal and vertical scaling options
