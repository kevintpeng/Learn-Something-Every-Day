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

## Firebase Realtime Database
Stores and syncs data in a NoSQL cloud database. Data *syncs across all clients in realtime*, by pushing data to clients when changes are made to the database.
- allows you to build server-less apps 
- offers offline support
- can be used to store remote config, that pushes to services when changed
 
Firebase's database store information as JSON objects; it's a JSON Tree. 
- no tables or records
- Firebase Storage (component of firebase) stores files
