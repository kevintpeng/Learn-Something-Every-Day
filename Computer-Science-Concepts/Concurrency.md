# Programming Models
## Synchronous Programming Model
For a list of tasks, thread is assigned a task, completes task, starts new task…

Single thread completes them like a queue. Multi-threaded, each thread completes task.

## Asynchronous Programming Model
For tasks, a single thread can hold the state of a task, complete another task and resume original.

**Concurrency** is when multiple requests are being processed at a time.

# Multithreading
Programs can run multiple threads, carrying out multiple tasks at once. For ruby, its `Thread.new do ... `

Multithreading can maximize performance of a program by taking advantage of multi-core hardware. It is called **Parallel Computing** and can drastically improve performance, and in extreme examples with distributed systems can complete intensive tasks that would be otherwise unreasonable.

Multithreading and Asynchronous programming are separate concepts. **Multi-threading can be applied to both synchronous and asynchronous models.** Multiple threads can work on a single queue of tasks, as in the synchronous model. In the asynchronous model, multiple threads can work on entirely independent tasks, like waiting for user input, reading a database, computing a task etc...

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

### Mutual Exclusion
Mutual Exclusion is the requirement of ensuring no two concurrent processes are accessing critical sections at the same time

Removing two nodes i and i+1 at the same time results in i+1 not being removed:
![example](https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Mutual_exclusion_example_with_linked_list.png/1024px-Mutual_exclusion_example_with_linked_list.png)
