# Programming Models
## Synchronous Programming Model
For a list of tasks, thread is assigned a task, completes task, starts new task…

Single thread completes them like a queue. Multi-threaded, each thread completes task.

## Asynchronous Programming Model
For tasks, a single thread can hold the state of a task, complete another task and resume original.

**Concurrency** is when multiple requests are being processed at a time.

# Multithreading
Programs can run multiple threads, carrying out multiple tasks at once. For ruby, its `Thread.new do ... `
