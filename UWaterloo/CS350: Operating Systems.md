# [Operating Systems](https://www.student.cs.uwaterloo.ca/~cs350/W18/reading.html)

### Summary
- Lock for achieving mutual exclusion
  - spinlocks vs locks that block
- for blocking, threads sleep on wait channels
- Semaphores for resource tracking
- conditional variables when we need to wait

### Intro
Three views of an OS: 
- application (services)
  - provides an execution environment, with interfaces for network, storage, I/O
  - isolates different programs running
- system (problems)
  - OS manages hardware, allocates resources among programs
- implementation, it's a concurrent real-time program
- **kernel** is the part of the OS that responds to system calls, interrupts, and exceptions

### Threads
- All threads share access to the program's global vars and heap

Threads expose parallelism, enabling faster program execution and better processor utilization through less blocking
- conceptually, each thread has its own private register contents and stack
- implemented either through multiple processors, or timesharing (context switches)

**preemption** is forcing a running thread to stop so that another thread has a chance to run, accomplished using interrupts (maybe a timer based)
- need an interrupt handler at some memory location (subroutine)
- scheduling **quantum** is the upper bound for the run duration of a thread, tradeoff between responsiveness and fairness

### Synchronization
Critical section is some portion of memory shared between threads
- bunch of interesting race condition examples
- can be fixed by forcing mutual exclusion of critical sections of code
- a simple spin lock blocks until the lock is free

Hardware-specific synchronization instruction, `xchg` provides a way to test and set a lock in a sing atomic operation (instead of multiple)

OS/161 has locks which block instead of spinning
- blocked threads are put in a wait queue (not part of the ready list)

**Wait channels** are used to implement thread blocking 
- `wchan_sleep` blocks a thread, and causes a context switch like `thread_yield`
- `wchan_wake` unblocks a thread sleeping on a certain (or any) wait channel

Semaphore keeps track of how many resources are available
- "P a semaphore" is asking for a resource, acquire, procure
- "V" is return, 
- binary semaphore can be used as a lock to provide mutual exclusion
  - not equivalent because a binary semaphore can be released by anyone, lock cannot
- bounded buffer can be built with two semaphores, with a read/write lock when adding and removing
- barrier semaphore is built as follows: each piece of work V(semaphore) after it finishes, producer loops n times for n workers, P(semaphore) n times
- condition variable works in conjunction with a lock and has a wait channel
  - mug in a bar example, for safely releasing a lock for the purpose of satisfying a condition
  - signal, one blocked thread on the signaled condition is unblocked
  - broadcast, wakes everyone waiting on the condition
    - each wait channel is for one resource only
  - wait, releases the lock, waits and then reacquires the lock
 
 ```c++
 // like lock acquire implementation?
 wait(lock * my_lock, cv * my_cv)
   ???
   ???
   lock_release(lock)
   wchannel_sleep(cv -> )
   lock_acquire(lock)
 ```
 
- HOARE, signaling thread goes to sleep, woke thread immediately run, good for responsiveness

Bounded Buffer can be written with locks and CVs
- producer lock, while loops to `cv.wait(notfull, mutex)`, then insert item and `cv.signal(notempty, mutex)`, unlock

CV implementation, 1 lock and 4 CV for assignment 1. Don't use timers. Use pressure-plate like behaviour for fairness. Let `k` more cars or if the intersection clears, switch.

If you own the lock that you try to acquire, you get a deadlock
- deadlocks happen as a result of use of synchronization primatives (programmers fault)
  - one or more threads are stuck
- another common example, two threads try to acquire multiple resources in varying order across threads

2 techniques for prevention
- **no hold and wait** says you need to acquire all your resources at once, don't sleep while acquiring resources
  - new lock to implement this, try-acquire
    - take lock and return true if available
    - else return false

acquire(A)
while(!try_acquire(B)
  release(A)
  acquire(A)
// now guaranteed to have A and B

Not great because context switch isnt guaranteed, and we are spinning

**Resource ordering**, assign all resources a unique number and then you must acquire resources in strictly increasing order

Suppose that a threaded program has N queues of items. The program needs to support an operation called Transfer i,j). Each call to Transfer will transfer a single item from the ith queue to the jth queue, unless there is nothing in the queue, in which case the call will not affect the queues. The program will have multiple concurrent threads, each of which may call Transfer zero or more times. How would you use locks to ensure that Transfer operations are atomic? Specifically, how many locks would you use, what would each lock protect, and when would the locks be acquired and released to ensure that transfers are atomic?
- tl;dr: N queues, implement a concurrent transfer function, n locks with resource ordering, supports N/2 transfers concurrently

### Processes
a process is the environment created to run a program in

a process has an array of threads, data, files

kernel abstracts physical ram as virtual memory, remaps addresses to 0, so every process is isolated and each thinks it is the only thing running; **processes dont talk to each other**
- kernel keeps track of processes in a table, with what state theyre in currently
- states = {READY, RUNNING, BLOCKED, ZOMBIE}

**process management calls**: creation, destruction, synchronization, attribute management
- fork, execv
- waitpid lets us wait for another process to terminate

fork Creates an identical clone, child, returns 0 if its the child

exit terminates, stores a final message (status code) and turns the process into a zombie

waitpid makes process go to sleep until process with pid terminates, can omly be called on children
