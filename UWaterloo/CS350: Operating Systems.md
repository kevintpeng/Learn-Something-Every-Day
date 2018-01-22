# [Operating Systems](https://www.student.cs.uwaterloo.ca/~cs350/W18/reading.html)

### Summary
- Lock for achieving mutual exclusion
- Semaphores for resource tracking
- CV's when we need to wait

### Synchronization
Semaphore keeps track of how many resources are available
- "P a semaphore" is asking for a resource, acquire
- "V" is return
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


   lock_release(lock)
   wchannel_sleep(cv -> )
   lock_acquire(lock)
 ```
 
- HOARE, signaling thread goes to sleep, woke thread immediately run, good for responsiveness

Bounded Buffer can be written with locks and CVs
- producer lock, while loops to `cv.wait(notfull, mutex)`, then insert item and `cv.signal(notempty, mutex)`, unlock

CV implementation, 1 lock and 4 CV for assignment 1.
