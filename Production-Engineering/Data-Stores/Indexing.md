# Indexing
Optimize read-write time, aiming for sub-linear time efficiency
- important for validations on uniqueness and other database constraints
  - corresponding index is created implicitly for constraints

### Non-clustered
Physical order of rows is not preserved, but the index specifies logical ordering
- indexed columns are typically non-primary keys, used for JOIN, WHERE and ORDER BY
- index tree holds index keys in sorted order, with pointers to the records
- more scalable, but reduced read speeds

### Clustered
Alters the data into a certain distinct order to match the index
- only one clustered index per table, but increases sequential reads (because of hardware burst reads)
