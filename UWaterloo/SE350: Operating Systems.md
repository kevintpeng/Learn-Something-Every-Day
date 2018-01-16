# Operating Systems
- [learn](https://learn.uwaterloo.ca/d2l/le/content/372772/Home)
### Summary
OS provides abstraction
- often a cost vs. complexity tradeoff

OS must handling running many processes, uses ISR's & context switches to handle multiple processes

Requires scheduling to determine which processes run with what order and frequency

## Chapter 1

### [Overview](https://learn.uwaterloo.ca/d2l/le/content/372772/viewContent/2065318/View)
- OS is an abstraction the enbles the use of hardware
- CPUs, Memory, I/O modules, timers, interrupt controller, system bus
- Processing Unit has
  - **Memory Address Register (MAR)** address for read/write
  - **Memory Buffer Register** (MBR) contains data 
  - I/O address + buffer registers

User-visible registers (1 to 64 depending on architecture)
- compilers control them
- **data registers** store data
- **address register** points to memory 
- invisible registers
  - program counter cannot be directly modified by the user
  - Instruction register is invisible (the instruction itself)
  - Program status word contains status information, like coditions, exit codes, flags

#### Interupts for Peripherals (ISRs)
- non blocking solution 
- processor checks for interrupt, store snapshot on stack and execute interrupt handler
  - simple model just disables interrupts while running a handler
- lean ISR vs heavy ISR gives you control of what state need be preserved (lean specifies registers to preserve)

Interrupts are mechanically similar to multiprogramming
- ISR jumps with a fresh start, but instead you push the registers onto the control stack and ???

How do you handle interrupts during an ISR?

1. You can disable interrupts to stop nested interrupts
- instead use a queue

2. You could have multiple interrupts going on, with priority (this gets into scheduling algorithms)

ARM fast interrupts for sequential interrupt processing uses a single jump instead of jumping back to user program before next interrupt.
- can cause unexpected behaviour, hard to debug becuase it doesn't have to jump back 

### Context Switching
OS creates an abstraction, running processes; instances of executing programs. Its context consists of registers, vars, program counter)
- Multiprogramming environment has independent sequential processes, only one is active at once
- OS keeps processes in a process table (Process Control Block)
- a **context switch** or task switch is switching the CPU from one process to another
  - **context** is the contents of the CPU's registers and PC at any point
  - consists of suspension of one process and resuming of another

Context switch steps:

1. Save context of CPU
2. Schedule next process for execution
3. Load new context of CPU

Embedded Parallel Operating System (EPOS) for labs

### Scheduler
**scheduler** decides which process to run at a certain time & how long it runs
- part of OS process management subsystem
  - executes scheduling algorithm

#### Scheduling algorithm
- consists of job queue, ready queue, CPU, and I/O waiting queue
- scheduling decision is made when new process is created, process exits, a process gets blocked, or an I/O interrupt occurs

3 types of scheduling algorithms (high level categories)
- all need some sort of fairness, balance, and policy enforcement

1. batch (payroll)
- max trhoughput
- keep CPU busy

2. realtime (deadlines)
- meet deadlines, predictibly

3. interactive (desktop)
- respond to requests quickly

**Preemptive scheduling** is the act of interrupting a task with a context switch, with the intention to resume later

#### Algorithms 
Round robin uses timer interrupts
- time too short is expensive for context switches, too long might not be fair 
- preemptive

Priority scheduling runs processes in priority (static or dynamic)
- extends priority class
- non-preemptive, but may use round robin for tiebreaking priority

First come first server (will extend priority)

#### Implementation
Traditionally implemented with a hiearchy of abstract Scheduler classes
- class can be specialized

EPOS instead uses composition? to detach scheduling policy and data structure mechanism and criteria
- so it has a thread object (process execution instance), criterion, schedluer mechanism (queue for example)

![epos uml](/assets/epos_scheduling_uml.png)

### Multiprogramming
More than one program to execute
- same mechanism for ISR, but instead is used to switch between programs depending on priority
- **busy waiting** is basically polling of a status register
  - important for systems that need extremely low latency (skips context switch)
- interrupt-driven waits for an interrupt from I/O module

## Chapter 2
### Operating System 
A program that controls execution of other programs to help them by acting as a standard interface between application and hardware
- convenience, efficiency, ability to evolve
- we have layers so that programmers can focus on their specific layer (application layer) without worrying about lower level things like file systems
- provide services, things like `ulimit -a`

`ulimit` controls limitations within the shell and its forked processes

The OS manages computer resources. **Kernel** is the portion of OS that is in main memory, containing frequently used functions. 

`/procs/` demo
- bunch of pid directories, with some info about the processes
- nucleus 
