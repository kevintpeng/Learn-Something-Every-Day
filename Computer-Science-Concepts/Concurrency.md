# I/O Concurrency Models
Concurrency describes the concept of running several tasks at once. See [Asynchronous Programming and Multi-threading](../Software-Development-Concepts/Asynchronous Programming and Multithreading.md).
### Single-threaded Multi-process
Each process handles exactly one request at a time. The web server load balances between processes. Not suitable for long-running blocking I/O workloads (workloads that call HTTP APIs).

### Multi-threaded Single-Process
Multi-threading allows high I/O concurrency, good for both short-running and long-running blocking I/O workloads. Prone to concurrency bugs.

### Evented
Different than previous two, allows very high I/O concurrency. Rails does not support evented code. Javascript uses evented concurrency.


### Race Condition/Hazard
Behaviour of systems where the output is dependent on the sequence/timing of events. Originates from circuits.
- affects multi-threaded or multi-process software, that share persistent components
- an operation that is **mutually exclusive** cannot be interrupted while accessing a resource
- for file systems, file locking is common to avoid this
  - software generally requests and reserves all resources it will need before a task
