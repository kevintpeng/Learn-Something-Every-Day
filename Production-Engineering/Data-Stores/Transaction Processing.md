# Transaction Processing
### Serializability -- [paper](https://github.com/kevintpeng/Learn-Something-Every-Day/blob/master/Research-Papers/1990%20Linearizability.md)
A type of guarantee that transactions have some order, and that final state is deterministically reproducable by replaying transactions serially
- considered the highest level of isolation (AC**I**D) between two transactions

### Two-phase Locking 
Concurrency control method that guarantees serializability

### Snapshot Isolation
A type of guarantee that reads be only made to a snapshot of the database until a transaction is fully completed, and then commit only if no updates conflict with any concurrent updates made since the snapshot
- main purpose is for better performance in comparison to serializability 
