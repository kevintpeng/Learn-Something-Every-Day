# [1981 Optimistic Methods for Concurrency Control](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.65.4735&rep=rep1&type=pdf)
**concurrency control** in database management systems handles critical sections of code in multi-user systems
- **pessimistic locking** is a strategy which involves keeping an entity in a database locked the entire time it exists in memory, which *is sort of a traditional mutual exclusion idea* 
- **optimistic locking** expects collisions to be relatively infrequent, and aims to detect and resolve collisions if they occur
- **basic timestamping** is a concurrency control mechanism that doesn't use locks. Unique (totally ordered) timestamp is assigned to each transaction before it's first action occurs
  - starts with an empty set of transactions which it depends on
  - starts with an empty set of old objects which will be populated as it updates objects
  - RTS(Oj) is the read timestamp of the jth object's last read
  - WST(Oj) is the write timestamp of the jth object's last update

For each action in a transaction i,

```c
read (Oj):
  if WTS(Oj) > TS(Ti) abort // a more recent transaction has changed the value 
  else RTS(Oj) = max(RTS(Oj), TS(Ti))

write (Oj):
  if RTS(Oj) > TS(Ti) abort     // more recent transaction is already using the old value
  else if WTS(Oj) > TS(Ti) skip // useless write, thomas write rule
  else WTS(Oj) = TS(Ti)         // and update

abort:
  for each (oldOj, oldWTS(Oj)) in OLD(Ti)
    if WTS(Oj) == TS(Ti) then restore Oj and WTS(Oj) // undo all actions performed in transaction
```

Problems with locks: deadlock, livelock
- livelock is when two or more threads are looping, trying to respond to each other repeatedly
  - think two people walking into each other in a hallway and swaying back and forth to try and pass one another
- locking has a high overhead cost, particularly with read operations which require locks to prevent writes during the read op
- there are no general purpose locking protocols that are both deadlock free and provide high concurrency (1980)
- locking may be necessary only in the worst case

Two directions are taken to try and find accurate high concurrency protocols:

1. find deadlock-free locking protocol
2. elminate the use of locks

