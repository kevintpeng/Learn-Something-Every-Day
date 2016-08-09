# Database Systems
### ACID Properties of Transactions -- [source](https://en.wikipedia.org/wiki/ACID)
These are properties of database **transactions**. Transactions are used in transactional databases, which describe most relational database management systems. Necessary design where sequence of data is important, and for critical operations.
- **atomicity** requires each transaction be "all or nothing" (occurs in whole or not at all)
 - generally implemented with some mechanism that indicates which transactions have started and finished
 - Operating systems use `open(2)` and `flock(2)` 
- **consistency** ensures that any transaction will bring the database to a valid state based on set rules
- **isolation** ensures that concurrent operations should act as if they were executed serially (one after another)
- **durability** ensures that commited transactions remain in the database even in the event of failure

# Distributed

## Apache Cassandra
Distributed database for managing large amounts of structured data
- lives across multiple servers
- provides highly available (resilient to outage), no single point of failure
- provides a solution to distributing data across data centers and availability zones
- uses a masterless "ring" design
 - doesn't have to use sharded architecture or master-slave models
- because there is no master, and no single point of failure, it is truely continuous in uptime

Disadvantages:
- doesn't handle transactions (local nor XA (aka 2 phase commit) )
 - this implies inconsistent indexing
 - actions are not totally ordered
- data is structured around the queries made to the database, so it doesn't handle ad hoc queries well

# Firebase
Stores and syncs data in a NoSQL cloud database. Data *syncs across all clients in realtime*, by pushing data to clients when changes are made to the database.
- allows you to build server-less apps 
- offers offline support
- can be used to store remote config, that pushes to services when changed
 
Firebase's database store information as JSON objects; it's a JSON Tree. 
- no tables or records
- Firebase Storage (component of firebase) stores files

# In-memory Data Stores

## Redis
Redis is a data store, useful for simplifying a system, increasing responsiveness, and capable of working in addition to other SQL and NoSQL servers.

Redis is a data structures server, using key-value storage format (like hashes) with support for different types of values. Redis can hold more complex data structures than regular key-value stores.

### Advantages of Redis 
- It doesn't have to replace elements of the current tech stack, it can be **added to the current stack**. 
- Disk persistent memory makes data retrieval much faster than SQL and NoSQL data stores.

[source](http://oldblog.antirez.com/post/take-advantage-of-redis-adding-it-to-your-stack.html)

## Memcached 
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

### Memcached vs Redis
Both in memory key/val lookup tables, for high speed/availability.
- both cluster, add in memory objects without needing to reference a data store
- comparable access speeds
- past a single instance, they have different deployed and scaled architectures
