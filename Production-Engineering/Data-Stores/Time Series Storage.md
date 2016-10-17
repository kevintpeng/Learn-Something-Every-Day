# Time Series Databases
Time series modelling is important as data sets grow
- a series is identified by a source name/ID
  - consists of a sequence of {timestamp, value}
  - ordered by timestamp, using high-precision Unix timestamp tupled with a float
- time series databases should be optimized for lots of writes (think 99% of operations)
- writes are generally sequential appends
- bulk deletes for a metric
- updates are rare
- data can be immutable in general, since writes are usually for recent timestamps and generally do not change
  - think preserving history of time series
- data reads are generally sequential
- concurrent reads are common

### Performance Characteristics
- distributed by design (not encouraging sharding)
  - fault-tolerance and high availability
- send the query to the data
- each node should aim for efficiency 
- able to take advantage of powerful hardware (lots of RAM, many CPU cores); no single writer systems
- fast and consistent, no stalls freezes
- we need non-blocking backups for failovers
- auto scaling without downtime/locking
- compressibility of data

### Language & API Design
