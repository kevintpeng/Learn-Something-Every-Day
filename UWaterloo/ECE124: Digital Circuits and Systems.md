# Digital Circuits and Systems
Notes are for post midterm material.
## 4 Combinational Logic
A circuit whose outputs are Boolean functions of its inputs is a **combinational circuit**. 
- to analyze, label all gate outputs
- write down truth table
- write boolean expressions for gate outputs in terms of inputs and simplify
- draw diagram

For speed, use 2-level implementations, for minimization, use simplified expressions.

**Half Adders** sum two inputs and has two outputs, S (sum, with XOR gate) and C (carry, with AND gate).

**Full Adder** sums three inputs. Implemented with two half adders and an AND gate.

**Decoders** can, for example, take 3 inputs to 8 outputs, with 8 AND gates.

**Encoders** take 8 inputs and binary representation of the selected input in terms of three outputs (z = d1 + d3 + d5 + d7, y = d2 + d3 + d5 + d7, x = d4 + d5 + d6 + d7).

**Multiplexers** are switches that connect selected inputs to their outputs. Can be used to implement any function of n variables with a 2^(n-1)-to-one-line multiplexer.

## 5 Synchronous Sequential Circuits
**Sequential Circuits** contain memory elements. Mealy machine output depends on inputs AND the state of memory elements. Moore machines' outputs depend only on the current state. Uses circuit feedback. A circuit that is a loop with two NOT gates (using feedback) holds two steady states Q and Q'. 
- SR latch is implemented with two NOR gates, S=1 sets, R=1 resets (Set Reset Latch).
- D latch (Data latch) stores the value of D

**Flip-Flops** use "edge-triggered" enabler inputs to allow time for the combinational logic outputs to reach their correct values, simultaneously. These are *sequential* using the *clock* signal.

**Positive edge triggering** enables when the signal goes from 0 to 1. **Negative edge triggering** enables when the signal goes from 1 to 0.
- JK flip-flop are SR latches that are edge triggered with the ability to toggle when J=K=1. The characteristic equation is A(t+1) = J•A'(t) + K'•A(t). Sets for J, resets for K.
- T flip-flop toggles current memory value.
  - both implemented with D latches

Characteristic tables are truth tables where outputs can be written as state prior to triggering as Q(t) and after triggering as Q(t+1). Same with characteristic equations.

## 5.5 Analysis of Synchronous Sequential Circuits
Clock driven circuits with memory elements. Analysis:
- state equations
  - input equations (for flip flop inputs), with current state of flip flops
  - characteristic equations of flip-flops (for A(t+1))
  - output equations, with functions of present state and inputs
- state table (tabular form of equations, with Present State, Inputs, Next State)
- state diagram (graphical representation of table)
  - mealy diagrams have states (with just identifier), whose path's have inputs and outputs (in/out)
  - moore machine diagrams have outputs dependent on the state (state identifier/output) and change state based on input (paths just have input)

**State Assignment** is identifying each state as a binary string:

State | Binary  | Gray Code | One-Hot
----- | ------- | --------- | --------
a     | 000     | 000       | 00001
b     | 001     | 001       | 00010
c     | 010     | 011       | 00100
d     | 011     | 010       | 01000
e     | 100     | 110       | 10000

- Gray code useful if system cycles through its states in sequence (only one flip-flop changes state at a time).
- One-Hot requires as many flip-flops as states but simplifies next-state and output combinational logic.

**Excitation Tables** are convinient for JK and T flip-flops. They show *how to drive desired state transitions*. For JK flip-flops:

Q(t) | Q(t+1)  | J | K
----- | ------- | --------- | --------
0     | 0     | 0       | X
0     | 1     | 1       | X
1     | 0     | X       | 1
1     | 1     | X       | 0


In more complex excitation tables, header might look like: 

Present State, Inputs | Next state, Flip flop inputs
--------------------- | ----------------------------

States can be reduced by merging states with the same outputs (based on input) or if they are equivalent by the property of state equivalence: 
- **Property of state equivalence** says that two states are equivalent if for every possible input combination, they give the same output and next states that are equivalent.

## 6 Register & Counters
**Registers** are a collection of flip-flops that store a collection of bits.

**Counters** a class of registers that cycle through predetermined state sequences. 

**Parallel Loading** allows a circuit to load all information simultaneously (and synchronously using a clock) into the register. n-bit register with parallel load can be implemented with n 2-to-one multiplexers, that choose between read/write (load), and n D flip-flops which store the n bits.

**Shift Registers** shift information to neighbouring cells. With two (first takes input from itself, second also takes input from first), **serial transfer** can be done to copy information from one register to another.

**Universal Shift Register** can shift both ways, implemented using 4 4x1 MUX for state selection and a 4 bit register.

**Ripple Counters** use negative edge triggered T flip-flops whose outputs feed into the next flip-flop's clock input. All T inputs are set by input `LOGIC`. They are non synchronous and use the clock input to ripple instead.

**Synchronous Counters** use T flip flops, clock driven, AND all previous flip-flop values as the input for a give flip flop. Counter can also be implemented with parallel load, allowing counter to be set to a value.

## 7 Memory and Programmable Logic
- **Memory** stores information in groups of bits called **words**
- **Processing Unit** tranfers words into registers
- **Read only memory (ROM)** are programmable logic devices (PLD)
- **Random Access Memory (RAM)** directly access any part of memory
- **Static RAM** latches store bits -> faster, requires more space
- **Dynamic RAM** stores electronically

**Memory decoding** is converting address lines to appropriate select inputs for an array of binary cells. For a **binary cell**, SR latch with input, select, read/write mode and output. For a selected cell:
- if r/w=1 (then read), S=0 R=0 so latch holds, then read Binary Cell's output.
- if r/w=0 (then write), S=input, R=input', writes to Binary Cell and output value isn't used.

**Error detection and correction** is used to increase reliability of memory.

**Hamming Code** defines parity conditions. When checking parity, set an associated "check bit" to 0 if parity is correct, 1 otherwise.

**ROM** element has k inputs (address) for 2^k • n bits of ROM and n outputs.

