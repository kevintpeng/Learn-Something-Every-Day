# Tableau
### [Column-Oriented Database Systems](http://nms.csail.mit.edu/~stavros/pubs/tutorial2009-column_stores.pdf)
- Row-store have all associated data in a tuple, making it easy to add/modify records
- Column-stores have all data points as separate entries, storing them individually meaning we won't make unecessary reads
- provides heavy optimization for complex queries on wide databases
  - less reads since we might only read a few columns instead of hundreds
  - column-stores can optimize for compression (more consistent formatting so less entropy)
  - sorted columns compress better, range queries are faster (since the data can be stored sequentially)
  - performance benefits from clustered indexing

### Tableau Extracts
Compressed snapshot of the disk
