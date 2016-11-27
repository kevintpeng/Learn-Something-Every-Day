# Digital Computers
### Summary
- focus learning cache problems

# Part 3: ISA & Addressing Modes
### Intro to Addressing
- binary prefixes, 2^10 kibi, 2^20 mebi, 2^30 gibi ...
- memory systems do not address single bits, they have an address space, range of addresses
- byte addressable systems refer to bytes or a word for instructions
- word addressable memory systems are rare, instructions don't have access to individual bytes, only words
- commonly, word length is 32 bits can be encoded for types of information (integers, ASCII or Unicode)
- byte ordering defines how addresses are assigned to bytes of a word
  - **big-endian** byte ordering assigns the lower byte address to more significant bytes within a word (more sequential)
  - **little-endian** is opposite (like how numbers are read)
- word alignment structures words 4 addresses apart

### Instruction Sets
- computer must have instructions capable of performing data transfers, arithmetic, sequence control, I/O
- an Instruction-set architecture (ISA) defines set of opcodes and native commands by a processor (ARM, x86, MIPS, SPARC, RISC-V)
- RISC ISA, each instruction fits in a word and memory operands are accessed only using load and store instructions
  - all operands for arithmetic and logical operations must be in processor registers
- CISC ISA has variable length for instructions, many instructions can access memory direction using memory addresses

### Representative Notations
- **Register Transfer Notation** is a way of expressing semantics of instructions as data transfers
  - memory locations are symbolic names like `LOC1`
  - Registers are identified by register names `R0`
  - contents of memory locations are denoted by placing square brackets `[LOC1]`
  - control signals are symbolic names `T1`
  - assignment statements transfer/manipulate data `R1 <- [LOC1]`
- **Assembly Language Notation** represents machine instructions and programs, to express operations, source and destination operands
  - `Load R1, LOC1` *load into R1 from LOC1*
  - `Add R2, R3, R4` *add R3 and R4 and save into R2*
  - `Store R1, LOC1` is **BACKWARDS**, *store contents of R1 into LOC1*
  - `Subtract R2, R2, #1` = `R2 <- [R2]-1`
  - `Branch_if_[R2]>0 LOOP` = `If(T1>0) where T <- [R2] then PC<-LOOP` used for looping until conditional
  - `Clear` = `R2 <- 0`

### Addressing Modes
- addressing modes are different ways to specify the location of instruction's operand
- *effective address* is the location of an operand, which differs based on the addressing mode
- Immediate `#Value`, Operand = Value
- Register `Ri`, EA = Ri where i is any integer and R is a keyword
- Absolute/Memory Addressing `LOC`, EA = `LOC` is exact address
- Register Indirect Addressing `(Ri)`, EA = `[Ri]` evaluates the value in the register (or mem location)
- Index addressing `X(Ri)`, EA = `[Ri] + X` is used when the operand address is a known constant offest from a known mem location, useful for arrays
- Base with index addressing `(Ri, Rj)`, EA = `[Ri] + [Rj]`, useful when index offset is non constant
  - PC-relative addressing is a special case of index addressing, where Ri = PC, useful for branching 
- Auto increment addressing simplifies successive address loading: `(Ri)+`, EA = `[Ri]`; `increment Ri`
  - increment is dependent on addressing system (byte vs word), and post-increments
  - `Load R2, (R3)+` = `R2 <- [R3]; R3 <- [R3] + #4`
  - decrementing is similar, but it decrements prior to the register being read
  - both are useful for dealing with stacks a queues

### Stacks
- resides in main memory, top of stack is the lowest memory address, pointed to by the special CPU register called the stack pointer
- Push is `Subtract SP, SP, #4; Store R2, (SP)`, Pop is `Load R1, (SP); Add SP, SP, #4;`
- Subroutines are blocks of instructions that are executed repeatedly for modularization
  - invoked by executing a `Call` instruction, executes, returns to the main program by `Return` instruction
  - implemented by **subroutine linkage method**, stored on the stack or in a special register called the *link register*
  - a call is a special branch instruction that invokes a subroutine by storing contents of PC to the link register and branching to the new target address, then returns the PC to the value in the link register
- subroutines can be nested, so we need a way to store multiple link registers, which is done so on the stack (raises issues with stack overflows if full or errors if the stack is not properly maintained)
- subroutines can take parameters, passed through registers (by value), memory locations (by reference) or passed on the stack (global namespace)
- locations at the top of the processor stack is the *stack frame*, private namespace by subroutines
  - *frame pointer (FP) register* enables access ot private work space
  - stack frame consists of all items pushed onto the stack before or during the subroutine, including parameters and return address before and frame pointer, local variables and register values modified during the subroutine
  - the frame pointer indicates start of new stack frame where parameters are stored at `n(FP)` and local vars at `-n(FP)`, where n is a multiple of 4

# Part 4: ARM
### ARM ISA Characteristics
- Advanced RISC Machine is most common
- RISC has fixed length instructions, load and store instructions access memory, arithmetic/logic instructions operate only on registers
  - requires less transistors than CISC processors in personal computers
- has 16 registers, 15 general purpose and 1 program counter at R15
- CPSR (Current program status register) holds N-Negative, Z-Zero, C-Carry, V-Overflow, (conditional codes, all are set when event occurs else cleared) interupt disable, 5 status registers

#### Addressing Modes
- all addressing modes are derivatives of indexing addressing mode, where effective address is the sum of [Rn, #offset]
  - PC-relative: `LDR Rd, Item` is semantically `Rd <- [[PC] + Item]`
    - for ARM, processors are pipelined, by the time the load is executed, the next instruction has already been fetched so `[PC] = PC+8` pointing two instructions ahead of load 
  - Pre-index: `LDR Rd, [Rn, #offset]` is semantically `Rd <- [[Rn] + #offset]`
  - Pre-indexing with writeback: `LDR Rd, [Rn, #offset]!` is semantically `Rd <- [[Rn] + #offset]; Rn <- [Rn] + #offset`
    - can be used for easier iteration through sequential memory
  - post-index: `LDR Rd, [Rn], #offset` is semantically `Rd <- [[Rn]]; Rn <- [Rn] + offset`; increments index after loading

#### Memory Operations
- when loading with fewer than 32 bits, zero extensions are used to fill the rest of the word with 0s, signed extension fills with the most significant bit loaded into remaining bits
- Regular: LDR/STR for words, H suffix (LDRH) for half words (zero extended), B suffix for bytes (zero), SB/SH for sign extended versions
- Multiple word load/store: `LDMIA R10!, {R0, R1, R6, R7)`, IA is opcode for increment after, R10 holds the memory location to start loading from, and loads words sequentially into specified registers. IA makes R10 hold [R10] + 4*n for n registers

#### Instructions
All instructions can take registers or literals 
- `ADD R0, R2, R4`: R0 <- [R2] + [R4]
- `SUB R0, R3, #17`: R0 <- [R3] - 17
- shifts and rotates can be done on registers: (logical) LSL, LSR, (arithmetic) ASR, (rotate) ROR
  - arithmetic shifts preserve sign, logical shifts clear vacated bits
  - `ADD R0, R1, R2, LSL #4`: R0 <- [R1] + 2^4*[R2]
- `MOV R0, R1`: R0 <- [R1]
- `TST R0, R1`: bitwise AND of [R0] and [R1] and sets condition code Z, good for checking status bits
- `TEQ R0, R1`: Z = [R0] == [R1] ? 1 : 0
- `CMP R0, R1`: [R0] - [R1] and update condition code accordingly
- `B{Condition Suffix} LOC` for branching; see list of condition suffixes
  - conditional suffixes can be attached to other instructions too, executing based on CPSR flags (N,Z,V,C)
  - `CMP R0, R1; MOVLT R0, R1`: R0 <- R1 if R0 < R1

#### Assembler
Assembler converts source program to an object program in machine language
- `label operation operand(s) comment`
- operations can either be mnemonics, labels and names are in a symbol table
- assembler directives does stuff during translation:
  1. define constants
  2. reserve storage locations for data values
  3. initialize data values stored in memory 
  4. indicate where in memory a program should be located
- assembler directives depend on the specific assembler
  - AREA specifies start of CODE/DATA
  - ENTRY specifies start of program execution
  - DCD label and initialize data operands
  - EQU declares symbolic names for constants
  - RN assign COUNTER RN 3
- pseudo-instructions are accepted by assembler and are synthesized to actual instructions 
  - `LDR R0, =ADDRESS`: LDR R0, #0x127, for ADDRESS=0x127
- example: push/pop for stacks 
  - LDMIA => POP, STMDB => PUSH
- Subroutine Linkage with branch-and-link: `BL TARGET`
  - value of PC is store in R14, which is the link register (LR) for returning after a subroutine
  - branch to TARGET 
- multiple passes are necessary for assembly because of forward references
- two-pass assembly first generates symbol table, then substitute values in labels
- linkers and loaders allow multiple modules to assemble into one binary
  - each module is assembled relative to location 0, then linker adds appropriate offset once code location is determined for each module
  - relative addressing and some instructions are position independent, while referencing external labels are position dependent
  
### Conditional
ARM - conditionals
- ROR ROL by four
- must use STR and LDR for memory
- LDMIA SP! or STMDB SP! for stacks
  - LDMFD, STMFD
- 15 PC, 14 LR, 13 SP 
- assemble each module as if starts from 0
- linker adds appropriate offsets in memory
 
# Part 5: Basic IO 
A system bus is an example of an interconnection network, joining I/O devices, memory devices and CPU
- memory mapped I/O treats I/O devices as part of the address space 
  - allows us to apply memory instructions for I/O
- I/O device interface is a circuit between a device and the interconnection network
  - provides means for data transfer (DATA register) and status (STATUS REGISTER) and control (CONTROL register) information
- program controlled I/O and interrupt-driven I/O use memory mapped I/O

### Program Controlled I/O
- program-controlled I/O, I/O interaction is realized by a program, through an interface listening for input
- signal protocol is needed for proper timing of inputs
  - input device, Keyboard, sends 'ready' signal, processor Loads from DATA register, output Display, signals 'ready' to receive, processor Stores to Display's DATA register
  - 'ready' signal is a status flag (bit) in the status register 
- program-controlled I/O polls status flags, wait looping to see if it should load/store for DATA register
- polling is taxing on processor, and locks without using interrupts
- instead let I/O alert the processor when it's ready, from hardware
- interrupts cause processor to deviate from the normal sequence of program instructions to allow the processor to respond to high priority events

### Interrupt Service Routine
  - special subroutine, called interrupt service routine (ISR) is responsible for handling services requested by the interrupt and ensuring consistent state after the ISR
   - difference between this and subroutine is that the ISR has to copy many registers to the stack to preserve their values
- interrupt request signals from devices call the ISR, which responds with an acknowledgement
  1. processor finishes current instruction
  2. state of processor is saved
  3. ISR is called, and services the device
  4. state is restored and next instruction resumes
- **the processor only restores the state of registers, not memory**
- saving state can introduce delay prior to servicing a device, called the *interupt latency*
- if a code fragment requires atomicicity, the *Interrupt Enable (IE)* bit in the processor status register is set to 0
- multiple device interrupts can be supported; IRQ bit in I/O device's status register indicates that it raised an interrupt
  - one approach is to poll all I/O devices, servicing the first deice to have IRQ set
    - a shared interrupt request /IRQ signal is created using one bus driver (where each device is connected with an open switch by default)
    - value of /IRQ becomes 0 if any device connected to the signal wishes to interrupt the processor
    - instead of polling all devices, the device requesting service uses another set of signals to inform the processor that it is the one requesting service
    - the INTA signal is daisy chained through all devices, stopping at the one requesting service
  - alternatively, *vectored interrupts* allow for reduced interrupt latency, without the need for polling
- interrupt vector table holds addresses to Interrupt Service Routines (also called the interrupt vector)
  1. I/O device provides interrupt code through the interconnected network, and asserts the interrupt request signal
  2. saves state of processor, interrupt enable bit disabled
  3. interrupt code is used as a pointer into the interrupt vector table for the right ISR
  4. PC loaded with address of ISR
  5. ISR executes
  6. restore state of processors, IE enabled again
  7. PC returns to the interrupted program
- multiple I/O devices may use shared interrupt request signals for all devices or dedicated interrupt request signals, with lower latency and allowing the ISR to be immediately called by processor
  - requires more wires (1 request signal and 1 acknowledge signal per device), and the processor can only support a fixed number of devices

### Interrupt Nesting
Sometimes ISRs take large latencies for servicing higher priority devices
- disabling all interrupts during an ISR may result in unintended behaviour (order of execution)
- instead, allow higher priority interrupts to be enabled during ISR execution 
- interrupt nesting is similar to subroutine nesting
- for simultaneous interrupt requests, arbitration or priority resolution is required
  - for polling, service order is same as polling order
  - for vectored interrupts, hardware must select only one device to identify itself
- disabling IE bit prevents all I/O devices from interrupting, doesn't give very fine control over disabling I/O
- for more fine control of behaviour, keep IE bit for each I/O device in I/O register (Keyboard IE and Display IE)

### Processor Control Registers
in addition to processor status (PS) register, other control registers are present
- IPS register, where PS is automatically saved when an interrupt request is recognized
- IENABLE has one bit per device to control if request from source is recognized
- IPENDING has one bit per device to indicated if interrupt request has not been serviced
  - `MoveControl R2, PS` is a special instruction used to update the processor control register (knows about keywords IPS, IENABLE, IPENDING, PS and is for moving values)
- **example:** read a line of characters from keyboard
  - use Keyboard ISR, with polling within ISR to display
  - unfortunately only one interrupt occurs
- assumptions: ILOC points to the memory location with the first instruction for ISR
  - LINE is the starting address of where to store the line in memory
  - PNTR points to a memory location for the characters from the ISR
  - EOL indicates that the line has been read

```

mov r2, ps
```

## Part 6: IO Organization
### Basic Hardware
- hardware propagation delay: when a state change occurs at the input, the delay encountered before the corresponding change in the output waveform is the propagation delay
  - sampling during the transition time can lead to incorrect data
  - important to assert over a small time period
- setup (prior) and hold (following) time are necessary for correct sampling of data
- interconnection network is the circuit that transfers info between components (ex: system bus connecting address, data, control)

### I/O Interface
- bus contains signals, one for each component of the I/O interface
- **address decoder** deterines when a device should respond to a request from a processor
  - produces a device enable signal for input addresses belonging to the device range
  - given a memory map, you can determine which address signals identify a particular device
    - each has a boolean expression that represents address ranges
    - also use memory map to determine the address signals used by the device after its enabled
    - also determines number of unique addresses supported by each device

### Bus Operation
- a bus protocol is set of rules governing how the bus is used
  - bus control lines specify whether read or write, the size of the operation, timing info
- broadly, timing data transfers over bus synchronously with a global clock or asynchronously
- master is device that initiates data transfer
- slave is device addressed by master
- X places Y on bus (X asserts signals amount to value Y) on the bus signals 
  - bus signals could be address, command, or data
- Skew occurs when two signals transmitted simultaneously from one source arrive at dest at different times
  - happens because different lines have different propagation speeds

# Part 7: Memory Systems
Array of simple memory cells, each storing a single bit of information
- size is the unique addressable memory locations
- for k address bits, 2^k words of memory are addressable
  - address decoder drives **word line** (bus), selecting a row of cells
  - sense/write circuit connected to two bit lines, during read, read current bit values. during write, take input and store in cells
  - control line for read and write specifies which operation
  - CS is chip select, choses given chip
- 1Kib x 1 means 1Ki bits of memory with 1 bit of input/output
  - implemented with 32x32 cells, with a 5 bit decoder (2^5 = 32 addresses) for column and row
  - read/write one cell at a time
- Static RAM stored in latches, expensive
  - two inverters form a latch, where X=1, Y=0 represents 1
  - on read, the word lines are activated, by closing switches connecting the inverter to the circuit
  - on write, place values on b and b' and connect the word lines via latches
- Dynamic Ram store temporarily using capacitors, requires refreshes to recharge capacitor, but cheaper
  - capacitor holds charge, when the charge is above a threshold, it holds 1
  - during reads, assert word line and switch T is closed, connecting bit line to capacitor for reading
  - during write, assert word line, close swithc T and drive bit line to alter amount of charge
- Organization of Asynchronous 32Mib x 8 DRAM chip:
  - 16Kib x 16Kib, 16Ki rows of 16Kib cells, each row has 16Kib/8 = 2048 bytes
  - log2(16Ki) = 14 bits to address row
  - log2(2048) = 11 bits to address specific byte in row
  - row and column are multiplexed on 14 pins
  - row address first placed then assert RAS 
  
#### DRAM
- 1Kib x 1 means 1Ki bits of memory with 1 bit of input/output
  - implemented as 5 x 5 decoders to access specific memory cells at a row and column (2^5 = 32)
- asynchronous chip uses 14 x 11 decoder to access a row of cells from addresses of 16mib x (16mib/8)
  - this architecture is good for **fast page mode**, once the row is chosen, you can iterate through columns for sequential r/w
- synchronous chip is driven by clock, similar design with a buffered I/O byte, one for reads and one for writes so that they can happen simultaneously while the other operation is finishing up

- **memory latency** is the time before tranfer of memory is complete
- **bandwidth** is the amount of data transfered per unit time
- Double Data Rate SDRAM switches between two banks of data for one r/w on every clock edge

- memory controller is the interface for connecting chips to the system bus
- chips can be combined into large arrays of chips, with a bunch of decoders 

#### DMA
Direct Memory Access is a hardware unit that handles memory access operations for the processor. Program controlled I/O is taxing on the processor with lots of overhead to access just one byte. Processor delagates to the DMA, which responds with an ISR when finished
- DMAs sit in front of things like DISK drives and Ethernet access, separate from main memory

### Caches & Memory Hierarchy
Hierarchy of memory components goes from fastests to slowest, with speed cost trade off
- CPU -> M1 -> M2 -> M3 -> M4
- automatically move data up and down the hiearchy (frequent at the top) to optimize memory access time
- locality of memory references is an intrinsic property of real programs
- temporal locality is data that you recently used and are likely to use soon (local vars)
- spatial locality is data near the recently used data that are likely to be used again soon (elements in an array)
- caches assist with locality of memory references
  - cache block is size that indicates multiple words of data/instructions transferred between cache and main memory
  - cache hit if memory block is found 
  - cahce miss if not
  - cache eviction removing block of data/instructions from the cache
  - cache dirty bit used to identify when contents of a cache block change
- processor connects to the cache
- cache connects to the main memory

Caches are faster than memory because of their hardware implementation. The cache is on the CPU, with transistors and it doesn't have to go through the external bus. Additionally, the cache is smaller so less to check.

Cache Writing Protocol for Store R2, (R3):
- if cache hit 2 approaches:
  - write-through protocol updates the cache block and the main memory simultaniously 
  - write-back protocol updates the cache block and simply flags that the cache block has been modified by setting a dirty bit
if cache miss, 2 approaches:
  - write-through protocol updates main memory directly and cache
  - write-back protocol fetches the main memory block into the appropriate cache block, updates the cache block and sets the dirty bit
- then dirty bit is used to decide whether to write-back data on eviction or replacement
- if cache miss, **write-allocate** says fill cache with line and perform write, while **no-write-allocate** ignores filling cache and writes directly to main memory
- *Writeback caches delay the writeback to memory, using the dirty bit. We only write to memory after the cache block is evicted. This is more efficient when you update values in the cache before they're evicted*

Mapping Functions determine the location in the cache for each memory address
- for any cache, the size of the block must be the same as the number of addressable bits for the main memory
  - *otherwise we don't have enough information to trace back to the original memory block*
  - each cache mapping just dictates how we choose to format this information

- **direct mapping** uses a fixed mapping mem block j => cache block (j mod 128)
  - address is 3 parts; word (offset) selects specific word in a block
  - block (index) determines location in cache
  - tag ensure block found is correct
- **fully-associative** allows a block from main memory to map to any location in the cache
  - block field is empty, and consumed by the tag field
  - when accessing, each block tag is checked, which corresponds to a block of memory in the main memory
  - then the word bits in the cache block decode to the respective word within the main memory block
- **set associative mapping** uses direct mapping to map memory blocks to a set of cache blocks, think combination of direct and fully associative mapping

#### Cache Structure
- to fetch data from the cache, we use indexing based on the main memory address that the cache intercepts. 
  - The first 5 bits of the address will be interpreted as the word bits (n bits to choose from the 2^n words in the block), 
  - next 10 bits will be the block bits (b bits for 2^b blocks of cache capacity). 
  - The remaining bits are called tag bits, used to determine correctness of cache hits (for direct caches, multiple memory blocks map to the same cache block)
- *each cache block holds data, along with **tag bits** and a **valid bit**, tag bits for comparison to the tag in the address, while the valid bit state whether the data stored in the cache is valid data (V = 1)*

#### Replacement Algorithms
For set-associative and fully-associative caches, a cache miss needs to evict some undetermined block, of which is determined using a replacement algorithm.
- LRU leverages temporal locality by tracking age of cache components, using log2(n) bits for each block (for caches with sets of size n)
  - age is defined as the number of elements who have been accessed more recently than it
- FIFO acts as a sort of round robin system
- Random

#### Cache performance
For `C` time required to access a block in cache, `M` time when accessing memory (including miss penalty) and `h` hit percentage, cache performance is intuitively `tavg = (hC + (1-h)M)`. 

If we're given M' instead, being the latency for accessing Memory, then the time is `tavg = C + (1-h)M'` since the time for a miss is equal to the time for a hit, then no matter what, we incur the time taken to access a block from cache, and add extra latency if it's a miss. 

For two caches, intuitively `tavg =  h1•C1 + (1-h1)(h2•C2 + (1-h2)M)`

#### Solving Cache Problems
Given `a`-bit addresses, `2^a` (bytes or words; depending on addressing system) main memory, `c` byte/word cache size, `b` bytes/words per cache block. Cache block capacity = `c/b`. Word bits are first `log2(b)` bits (rightmost), block bits are next `log2(c/b)` bits, tag bits are remaining.

*For final cache content questions, do the timeline table method, visually updated each cache block with respect to a timeline. Then you can figure out quickly which block is the least recently used*.
  
#### Virtual Memory
Programs are written using the full address space 2^32, but physical memory capacity is often less than this (2GB for example). Virtual memory populates the rest, storing it on disk
  
### Lab4: ISR
1. generate Random delay 5-25s in R6
2. display on LED
3. Delay of 1s then decrement your # in R6m then display
4. if R4 ≤ 0, fkasg LEDs on and off for 1 sec each until you press the button (ISR)

# Part 8: Basic Processing
CPU has control unit, ALU and registers. Fundamentally, there are 5 steps:
- **fetch**
- **decode**
- read **memory**
- **execute**: perform operation
- store data by **write back**

Processor has hardware to implement every instruction in the ISA. 

The **datapath** of a processor hold a bunch of components that implement the ISA.
- Register file is a set of registers 
- ALU
- processor-memory interface for memory and write-back operations
- instruction address generator updates PC
- instruction register
- control circuitry, decides what happens with mux selectors, and regulates flow of data

Design of Register file:
- you want to be able to select two registers for a clock cycle, and write to at most one register. So we need two corresponding output data. The width of i/o is 32 bits (same as register width) and addresses are log<sub>2</sub>(32) = 5

1. Fetch gets whatevers at PC address.
2. Decode
  - in ADD R1, R2, R3, Rsrc1 = R2, Rsrc2 = R3
3. Execute



# Part 9: Pipelining
Pipelining allows for concurrent instructions per cycle, with different parts (stages) of the processor
- with 5 stage datapath, only one stage is active in any cycle
- pipeline diagram shows at each clock cycle what stage finished for each instruction is being run
- to implement this we need **interstage buffers** to carry forward information for EACH instruction
  - RA, RB, RM, RY, RZ, IR, PC
- also pipelining the control signals
- this allows a new instruction to enter and exit the pipeline every cycle

### Issues
- Data hazard is a result of a data dependency. Two successive instructions, `ADD R1, R2; ADD R3, R1`, the second one will decode the wrong value of R1, since the first hasn't writtenback to R1 yet. This can be resolved by stalling the pipeline
- using interstage buffers, check IR for source registers of a new command (before decoding) and  check whether there is an older instruction who has the same destination as a source in the current instruction
- *somethings wrong if there are two of the same stage in the same column (clock cycle) of the pipeline diagram*

*For pipelining problems, be aware of how the register files are being updated. Forwarding is important to understand. Forwarding can be done by adding a mux with the output of one stage, linked to an input of a previous stage to share values. An intermediate register may have a wrong value in it. By adding a mux, we can select the actual correct value from the output of a previous command. In general, we don't want to add a mux in the decode stage since the mux is expensive with time. Adding it to other stages is negligable since they involve memory operations.*

A change made by some stage at a given clock cycle is not noticed until the next cycle.

```
instr PC R4 RA RM RZ RY
1F 37c00 1000 - - - - 
2D 37C04 " 
3X
4M
5W
```
