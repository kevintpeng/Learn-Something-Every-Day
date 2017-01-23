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
