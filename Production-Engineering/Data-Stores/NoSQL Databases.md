# NoSQL
DB architectural design, opposed to SQL. The main advantage of NoSQL over SQL is that it can model data in different ways than a relational model, which can improve performance. A disadvantage is that NoSQL can result in very complicated data models 
- can store structured or unstructured data, not requiring a predefined schema for data
- while SQL databases require migrations for schema changes, NoSQL schemas can interate dynamically 
- strong for graph stores and document databases
- can handle wide column stores, optimized for large queries and joins
- SQL databases scale vertically, to ensure validations across data and for cross table joins
- NoSQL auto-shard nicely by scaling horizontally with more servers
- NoSQL is inherently less structured than SQL, storing information in only two columns, key and value

### Database Normalization
In relational databases, it is the process of organizing columns and tables to reduce data redundancy. If multiple Books have the same genre, create a new table Genres with a row Sci-fi where genre attribute of the book points to this row.

### Modelling Data
OO, we use classes and objects. In relational DBs, we use tables 

Denormalization separates data into documents, of similar data
- a document like a book is a hash of keys and values which can be saved into a collection of books
  - something like genre, is stored as an array rather than a relation
  - this is structured with a multi-key index rather than a second table 
- represented with high level entities with nested attributes
- RDBMS use tables of rows, while NoSQL uses collections of documents
- consider how data will be manipulated, and what the access patterns will be like (read/write ratios ...)
- no joins

### Object Oriented Design to Databases
- mapping an OO modelled data, for example an inheritance tree, to RDBMS can end up being modelled as a shapes table, with each row having a shape type with some attributes that may be unique to that type of shape
  - lots of columns with lots of `nil` data, very inefficient
  - in NoSQL, query planner will overlook documents that are missing an attribute being queried through a `find`
  - sparce indexes exclude documents without the indexed key 
  
### One to Many relationships
Ownership pattern determines which model we should use
- Embedded Arrays in documents hold keys for related documents
  - slice subsets of arrays
  - uses foreign keys
- Embedded trees nest documents
  - more performance, since documents are nested directly inside
  - harder to search, and hard to fetch partial results (must fetch all comments then filters)
- Normalized approach using multiple collections (creating 
  - results in more subqueries (loses data locality) 

### Many to Many
Relational needs a 3rd join table (again less performant)

NoSQL, we can do one-sided where all categories are stored in embedded arrays in products

# Cassandra
Distributed NoSQL DB. 
- distributed, so no single point of failure
- **gossip protocol** is used
- data is indexed with a memtable
- writes are fairly cheap, and indexes greatly improve reads at the cost of writes-

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

### Gossip Protocol
Communications protocol for spreading new information 
- through periodic, pairwise, inter-process interactions, nodes spread information in a robust way
- information exchanged during interactions is bounded

### Durability through Storage -- [TODO source](https://static.googleusercontent.com/media/research.google.com/en//archive/bigtable-osdi06.pdf)
Writes first to the CommitLog, and then to the Memtable, overflowing into disk as an SSTable
- fsync synchronizes file's in-core state with a storage device
- durability is achieved through fsync, flushing the write-back cache to disk (ECE 222)
- commitlog is append-only which obviates the need for random seeking 
  - CommitLogAllocator manages CommitLogSegment instances (each being a file on disk, with a sequence of serialized RowMutation objects)
  - commitlog_sync can be periodic or batch which dictates how fsync to disk is called
