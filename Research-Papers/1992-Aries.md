# [Algorithm for Recovery and Isolation Exploiting Semantics](https://www.cs.berkeley.edu/~brewer/cs262/Aries.pdf)
Designed to support the needs of transaction processing databases, for the purpose of improved locking, rollbacks, write-ahead logging. ARIES uses logs to record *progress* of transactions. The logs are the source of truth. Each entry has a unique, ascending ordered log sequenece number.
- logging is a common technique for surviving system failure in transactional databases
- **write-ahead logging** (WAL) is writing to the log before the change is applied, aimed to provide atomicity and durability
  - usually stores both redo and undo operations in the log
- **No-Force, Steal** are two policies that ARIES implements
  - no requirement to write dirty pages to disk at a given time (No-force)
  - database can flush dirty pages to disk whenever (steal)
