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
