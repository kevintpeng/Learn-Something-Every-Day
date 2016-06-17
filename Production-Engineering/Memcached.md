# Memcached 
Memory object caching system.
- speeds up dynamic web applications 
  - lightening database loads
- in-memory key-value store for small database and api calls, or page rendering
- allows you to make better use of available cache space from multiple web servers
  - done by combining the cache size of multiple servers into one combined cache

![diagram](https://memcached.org/memcached-usage.png)

### What is it made up of
- client software, which is given a list of available memcached servers
- client-based hashing algorithm which chooses a server based on the "key"
- server software, stores values with their keys into a hash table
- LRU (algorithm), which determines when to discard old memory

Half server, half client logic
- clients choose which server to read and write from 
- servers manage storage and implement LRU
- servers are unaware of each other 
