# [Operating Systems](https://www.student.cs.uwaterloo.ca/~cs350/W18/reading.html)

### Summary
- Lock for achieving mutual exclusion
  - spinlocks vs locks that block
- for blocking, threads sleep on wait channels
- Semaphores for resource tracking
- conditional variables when we need to wait
- virtual memory is important for isolation of processes and their security
- page tables are fast + handle fragmenting, but extremely space inefficent (since page tables could be larger than the actual amount used in the address space)
  - kernel manages MMU registers on context switches, manages page tables, handles exceptions raised (for writes/loads outside of address space), and MMU translates addresses and throws exceptions

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

### Multiprocessing
You need synchronization around the global parts of sys4 implementation
- you can have an interrupt while running in the kernel
- practice working through user + kernel stack state for a scenario
  - all trap frames + kernel code is on the kernel stack
  - user stack lives in the address space of the process
  - kernel stack does not; elsewhere, only the kernel knows about it

System calls to implement:

1. pid_t fork
  - create process structure
  - `struct proc p = kmalloc`
  - set all fields
  - fork is a clone, so address space is the same. So create new address space (allocate memory) `memcopy`-like thing
    - loaded, same size
  - assign PID AFTER you know it's allocated (it's unique)
    - edit process structure to include pid
  - pick a unique id (counter maybe, or use address with conversion to unsigned)
  - add parent/child relationship (either part of the struct or global)
  - now we need a thread; needs to be a new thread. So use thread fork with a parameter to tell it to attach it to
    - `proc_create_runprogram()` to setup process
      - it can fail if there's no memory, or other things, so check return value to make sure it didn't fail
  - create and copy address space `as_copy()`, pass it old and new address spaces, then it allocates memory and copy it from the parent
    - if it failed, return appropriate error code
  - `thread_fork()` creates new thread, need entry point function to setup kernel stack so that it can return to user mode ..?

```C
// entry point
entrypt( void *tf, unsigned long ) {
  // take parent's trap frame and put it on the kernel stack
  struct trapframe t = *tf;
  // setup return value for fork, which need to go in the trap frame for that thread
  t.tf.v0 = 0
  t.tf.a3 = ...
  t.tf.pc += 4 // program counter
  mips_usermode // fake the return from the exception
```
- parent process could destroy it's trap frame before the child reads it

1. parent could have to wait until the child is finished (but it's slow)
2. copy the parent's trap frame to the heap, and pass it to the child (so no synchronization issue)

2. waitpid
  - is this one of my children? no? then return error code
  - else if it's a zombie, read child's exit status and destroy it
  - else, wait channel (/ lock + cv) on the child
    - every process needs to have one of these, so wait on the child's cv
    - now when child calls exit, it deletes address space and stuff, then checks if parent is sleeping and wake them up
    - now the child must be a zombie
    - if child's parent is dead (zombie/non-existant), then delete yourself instead of becoming a zombie because no one can waitpid on your child
    - if a parent exits without calling waitpid, it has to check it's children and delete all zombies
  - exit code says why this process died
  
### A note on Page faults
If the kernel panics on a page fault, it's just telling you you're getting a segfault: doing something with memory you're not allowed to do
- epc (program counter) >= 0x8000 0000 implies bug in kernel code
  - <= 0x8000 0000 implies that error is noticed by user proc implies stack or address space is setup wrong
- virtual address is either a load (read) or store (write)
  - if the address is a low like 0x4 implies dereferencing/writing to NULL
  - if really high like 0xdeadbeef implies reading/writing memory that's already been freed
  - other, could be anything but typically it's an array out of bounds error
- really bizarre behaviour implies overwriting important data like program info or constants

### Virtual Memory
Warning: Do hex math on exam

In our address space, code starts at 0, followed by data. Data grows up. Stack starts on the far right and grows right.

In OS-161, stack is set by OS.

Each process has an address space. OS allocates some ram for the process based on its request (code + data size). Core map is a data structure that is used to track memory that's used vs. free. Each address space is mapped with respect to 0, and uses fake addresses. 

Aside: modern operating systems randomize position of code, data, stack and heap to hide any information about the process structure itself

**Address Translation**: performed by the hardware by the MMU. Every time there's a context switch, the kernel tells the MMU how to translate instruction addresses. We have three goals
- transparency: for any scheme, the process must not know of the scheme
- efficiency: time & space (table vs. two vars)
- protection: true isolation

**Dynamic Relocation**: most efficient scheme in both time and space. 
- find contiguous memory block to assign a process. Then subtract the beginning address from each address (offset)
  - store the limit (size of block), and hold the limit and offset in the kernel
- if virtual address v >= Limit, throw EXCEPTION, else p <- v + Relocation
- requires contiguous memory regions, leading to *external fragmentation*

**Paging**: divide memory into small segments (frames or physical pages). Now we can request ANY frames
- fixes problem on fragmentation, but requires a page table
  - exhaustive list, with an entry for each page, whose value 
  - MMU doesn't know how much was allocated, so it has to look it up to see if it's `valid?`
- page table is fixed size, regardless of the addressing space size

```
V -> virtual addr
PGSIZE = page size = frame size
PG# = V / PGSIZE
OFFSET = V % PGSIZE
FRAME# = lookup(PG#)
PHYSADDR = FRAME# x FRAMESIZE + OFFSET
         = FRAME# x PGSIZE + OFFSET
         = first address of page + offset into page
#OF_PGS = VMemSize / PGSIZE (not virtual address size)
     = 2^16 / 2^12 
     = 2^4 pages
#BITSPERPG = log (#OF_PGS) (these are bits to address pages)
           = log (2^4)
           = 4
#OFFRAMES = PhysMemSize / FRAMESIZE
BITSPERFRAME = log (#OFFRAMES)
BITSFOROFFSET = log (PGSIZE)
```

practice:

```
a) bitsforoffset = 16
pages = 2^16
b) bitsforpageaddr = 16
c) 48

Vmemsize = 2^16
Physmemsize = 2^18
pagesize = 2^12
pages = 2^4
pageaddrbits = 4

phys = framesize x frame# + offset
phys = 2^12 * 0x26 + 2c
     = 0x900 * 0x26 + 2c
     = 

page# = 0x1
frame# = 0x26

0x1502C
0x32800
0x14024
```

so the format of the solution for "given v find p using page tables": first calculate `b`, the # of bits needed for the page address, take the first `b` bits of `v` and lookup in our page table to get `f` the frame number. Finally "append" them together.

#### Translation Look-aside Buffer
Page table lookups are slow. The idea is, when an address needs to translated, check the cache before leaving the CPU to memory. Improves performance, especially on sequential reads (like programs, arrays, etc...)
- in hardware managed TLB, MMU picks up exceptions 
- in software, the kernel will handle exceptions, fetching pages, TLB eviction, and re-execution
- MIPS TLB entries are 64 bits: first 20 bits for page #, 6 bits for PID, first 20 bits of lower word is frame #


Page fault is when the TLB does not have the page cached already so it throws an exception to be handled by the kernel (as in software managed tlbs)

1. If TLB is full, perform eviction
2. Else load the page into cache
3. Update PTE present bit
4. Return from exception and retry memory access

We want to try to limit page faults. This can be done by
1. Having a good cache eviction algorithm (round robin skip method)
2. Prefetch relevant pages
3. Limit number of processes to prevent cycling cache evicitons

What is the clock replacement algorithm for cache eviction?
Modified round robin heuristic with a skip bit. Every time a page table entry is used, set the skip bit to 1. When evicting, round robin and skip any tlb entries that have a value 1, zeroing it as it’s passed. Evict the first 0.

#### Segmentation and Paging
TLB is paging, physical memory is segmented. Looked for contiguous frames in physical memory for a segment


#### Address Spaces
Modern OS's use on demand leaves them on disk, and only load frames into memory the exact moment it's needed. Downside, everytime you address something that's not in RAM, you need to fetch it from disk (slow process)

Executable and linking format (ELF) files 
- `cs350-objdump`, load elf function reads header, which contains all information you need to know about a program (code segment, virtual memory address, offset, rodata / read only data / constants)

50 / 50 split between user and kernel
- user space: kuseg
- kseg0: does not use TLB or paging for address translation, but is cached
- kseg1: does not use TLB or paging for address translation, not cached since it's for device registers which are semantically volatile
- kseg2 not used
- exam question: based on fault address, what happened?

In OS161/MIPS, given a physical address, it could have come from 3 possible spots: kuseg, kseg0, or kseg1

#### Scheduling
Scheduling is a problem of ordering jobs based on parameters like arrival time, duration/size, priority. Simple approaches include round robin and shortest job. Pre-emption can be used so that jobs don’t have to run in one pass, they can be stopped in between. This allows for round robin with a runtime, or longest time remaining. In the context of operating systems, jobs are processes, and often processes do not have a known duration. Jobs can also be blocked when doing CPU scheduling.

CFS (linux completely fair scheduler) is a weighted scheduling system that tries to balance process runtimes based on weight which is semantically a process’ priority. At any time, the amount of effective CPU time a process gets should be approximately it’s percentage of the total weight of all jobs (job weight/ sum of all weights). We measure this will virtual runtime, which can be calculated as the actual runtime * all weights / job weight, and CFS will attempt to have equal virtual runtime across all processes.

This is implemented in two possible ways. 
1. Shared queue. Requires mutual exclusion, so contention increases as we have more cores requesting work. But should maintain fairness extremely well.
2. Separate per-core queues. Scales better as we won’t have cores waiting on the locked queue for work. However, load imbalance is very possible and requires periodic rebalancing. This is called thread migration.

#### Hardware Devices
What are device registers vs device drivers? 

Device drivers are the kernel code that interacts with hardware devices.

Device registers are either status or command, (read/write) and act as an interface for sending and receiving information from a hardware device. 
1. Memory mapped IO. Each register has a physical memory address
2. Special I/O Instructions, in x86 `in` and `out`

Current time status registers
Restart-on-expiry command
Countdown status+command
Beep command

Data transfer to/from devices is facilitated by a data buffer. Two options for transferring to or from this buffer
1. Program controlled, cpu transfers bytes but blocks cpu
2. Direct Memory Access, CPU initiates, device controller does the transfer and notifies completion via an interrupt.

Went over disks. Old hard drives had spinning disks for large data storage. Disks are divided into tracks and have blocks/sectors on each track. Disks use a mechanical head the seeks across tracks while the disk spins. We want to minimize seek time (time for head to move across tracks), rotational latency (how fast the disk spins and how much it has to rotate to line up the starting block) and finally transfer time (time taken to spin through number of sequential blocks). In practice, software can only optimize seek time. 

What is the elevator algorithm for disk head scheduling?
Always seek in one direction (either inwards or outwards) until there are no more read requests in the given direction, then go the other direction. In this way, read/write operations are batched, with a maximum latency guarantee of two full end to end seeks, preventing starvation. 

#### File Systems
Interface:
1. Open(filepath, option), returns a file descriptor for the file at file path. The file descriptor is unique (per process) and is stored in a process’ file descriptor table. This might create a new file depending on the options passed in. 
2. Close(descriptor), invalidates a valid file descriptor.
3. Read(fd, length, options), performs sequential read for a file corresponding to the descriptor provided, of length specified by the parameter.
4. Write “”
5. lseek(fd, size, offset, option)? 
6. Meta-data like chmod

Persistent data structures:
1. File data
2. I-nodes
3. Links + directories

Directories are special case of files. They have an i-number and an i-node.
Directories use hard links to the files in it. A hard link is a mapping from a pathname to an i-number. I numbers are unique, pathnames are not. Once all hard links are deleted, the file is effectively deleted too. Hard links cannot be made to directories in order to prevent cycles in file system structure.

Very Simple File System (VSFS) is an implementation of the logical file system. It uses I nodes to store file meta data. An i-node is a fixed size, 256 bytes, containing file size, number of data blocks, and up to 12 pointers to data blocks (either direct or with some degree of indirection depending on the implementation of the file system, we covered double and triple).  VSFS has all the i-nodes at the start of the file system in addition to the superblock, i-node bit map and the data block bitmap. Bitmaps are a simple block of binary data that corresponds to which data/i-node locations are in use vs free. This is for fast lookup (constant time) for finding free I-nodes or data blocks. Finally, the superblock holds all the file system information like i-node capacity and location of the i-node table. 

A file system might observe power failure or unexpected shutdown, and use be tolerant to such failure. Two options to do so are,
1. Special purpose restoration tools that look for inconsistencies in expected data structures and tries to fix them.
2. Journaling file system operations and replaying journals during crash recovery.
