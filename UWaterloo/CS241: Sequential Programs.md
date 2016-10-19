# Sequential Programs
### MIPS [aside]
- a reduced instruction set computer (RISC) instruction set architecture (ISA)
- MIPS implementations are primarily used in embedded systems
- tries to avoid the use of stacks (because of speed)
  - MIPS reserves four registers to pass arguments `$a0` ... 3
  - passing arguments that cannot be contained in 4 registers use the stack
  - however, nested functions still require the use of the stack
- this kind of architecture is advantageous for leaf procedures, where there are no nested function calls 
  
### Abstraction: labels & variables
- an **opcode** is a word that represents a machine language instruction (ADD, JR ... )
- **assembly language** is a lang for writing machine lang programs using opcodes instead of bits
- **assembler** is a program that translates assembly lang. into machine lang.
- **label** is an abstraction of a memory address (think variable assignment)
- instructions are words (strings of bits)
- a **code** can be a word for instructions or extra features like labels, that are not instructions
- to eliminate labels, first pass build a symbol table, a map from labels to addresses. second pass converts each use of label to address/offset
```sh
Find abs value of $1 (two's complement)
SLT(2,1,0)
beq(2, 0, label) # beq takes labels while BEQ takes offsets
SUB(1, 0, 1)
Define(label)
JR(31) # end the program
```

### Relocation and Linking
- def: an *object file* contains machine language code with additional metadata, which records how labels were used before translation to machine lang (which addresses need to be offset)
- def: *relocation* is the process of adjusting addresses in machine lang code so it can be loaded at different memory addresses
  - conceptually, it reverse engineering what the assembly code would have been, then it reassembled at some offset, loaded at a different memory address
- def: *linking* is the process of combining object files into one (object file, program, library)
  - to link, relocate conflicting object files and labels based on metadata
- Typical c compilation process: `.c` compiles to assembly `.s`, assemble to object files `.o` , then link object files to an executable program

Stack, `$30` stores the stack pointer, pointing to the top of the stack
- to access variables, you need an offsest from the stack pointer
- a symbol table maps variables to offsets
- a *frame pointer* at `$29` is a copy of the stack pointer made at the beginning of a procedure that stays constant for the *duration of the procedure call*, this is used as the origin of offset for accessing variables in the current stack frame. This allows the actual stack pointer to change without ruining our symbol table

- *variables* are abstractions of storage locations that hold a value
- the *extent* or lifetime of a variable instance is the time interval in which the variable can be accessed
  - local vars have the extent of execution of procedure, global have extent of entire program, fields of objects have extent of time until object is freed (explicitly or by GC)
  - variables are stored at offests relative to the frame pointer
- Symbol table holds the offset of each variable 
  - translation time/compile time is when you tkae high level program with variables and translate to machine code. Symbol table is used here to replace variables with their respective address
  - at compile time, to access variable, `LW(3,8,29)` loads into R3, from an offset of 8 to the frame pointer
- on the stack, allocate chunk of consecutive memory locations rather than single bytes. Each chunk has 2 reserved words of memory: first is size, second is reserved by convention
  - in assignments, allocate all memory in chunks

### Evaluating Expressions
1. Using the stack:
- for `(e1 op e2)`, build a binary expression tree, generate code to evaluate `e1` and `e2`
- store intermediate responses on the stack
- conceptually simple, but verbose
```
evaluate(e1, op, e2)
  evaluate(e1)
  push $3 onto stack
  evaluate(e2)
  pop from stack $4
  $3 = $4 pop $3
```

2. Using temp vars/virtual registers:
- flexible but still generates lots of variables unnecessarily
```scala
evaluate(e1, op, e2):(Code, Variable) = {
  val (c1, v1) = evaluate(e1)
  val (c1, v1) = evaluate(e2)
  val result = new Variable
  val code = block(c1,c2,"result = v1 op v2")
  (code, result)
}
```
- **register allocation** is the process of assigning virtual register (Variables) to real registers or memory locations
  - minimize number of real registers/stack locations by sharing them among non-interfering virtual registers
  - intermediate representation with virtual registers => register allocation => intermediate representation with real registers and stack locations 
 
 3. Using temp vars with operations on registers
- same as first, but adds abstraction with lends to more efficient underlying implementation
```
evaluate(e1 op e2) {
  withTempVar {
    block(
     evaluate(e1)
     write(t1,$3)
     evaluate(e2)
     read($4, t1)
     $3 = $4 op $3
    )
  }
}
```

If statements:
```
if (e1 op e2) T else E

evaluate(e1)
t1 = $3
evaluate(e2)
$4 = t1
comparison of $4 and $3, branch to labelElse
T
jump to labelEnd
Define(labelElse)
  E
Define(labelEnd)
```

- a variable is **live at program point p** if the value that it holds is called (even if just conditionally) read sometime after P
- the **live range** of a variable is the set of program points where it is live
- two variables can share the same register if their live ranges do not overlap 
- the start of a live range is always just after a write to the var
- the end of a live range is always just before a read to the var
- **interference graph** has each variable as a vertex and edges between variables that share a live range
  - apply graph colouring 
  - finding a minimal colouring (fewest colours) is NP-Hard
  - simple greedy algorithm: for each vertex, assign the smallest colour not used by its neighbours
  - some special structured graphs allow for efficient algorithms

- Procedures: an abstraction that encapsulates a resuable sequence of code
  - calling code transfers control to procedure (modifies PC), passing arguments for parameters
  - procedure-transfer control back to caller
    - returns a value
  - caller and callee must agree on conventions:
    - which registers to pass arguments and return values
    - which registers procedures may modify or preserve
    - register with return address (31 or Reg.savedPC)
    - who allocates/frees memory

```sh
# CALLER
Stack.allocate(parameters)
LIS(Reg.targetPC)
Use(proc)
JALR(Reg.targetPC)

# PROCEDURE/CALLEE
Define(proc)
Reg.savedParamPointer = Reg.allocated  
Stack.allocate(frame)
dynamicLink = Reg.framePointer  # saved frame pointer of caller
# savedPC is on the Stack, this is needed for nested procedures
savedPC = Reg.savedPC # Reg 31
Reg.framePointer = Reg.allocated
paramPointer = Reg.savedParamPointer
# body
Reg.savedPC = savedPC
Reg.framePointer = dynamicLink
Stack.pop # pops frame chunk
Stack.pop # pops paramaters chunk
JR(Reg.savedPC) 
```

On the stack:
- size
- Assignment11
- variables
- savedPC
- dynamicLink
- paramPointer
argChunk (pointed to by paramPointer):
- size
- A11
- arguments
Some Conventions:
- Caller-save (what registers will be written to): 31 savedPC, 3 result
- Callee-save: 29 framePointer, 30 stackPointer

a5 - don't mess up Reg.result

### Static Link
Static lib
A static link is a pointer to the frame of the statically enclosed procedure of the currently executing procedure
- the nesting depth of a proc is the number of outer procs that it is nested inside of 
- top-level depth is 0
- to access variable (eliminateVarAccessesA6), n = depth(current proc) - depth(proc declaring variable)
  - follow static link n times, then find variable in that frame
  - to compute static link at call site: 
    - we want depth(static link) = depth(call target) - 1
    - let n = depth(current proc) - depth(static link)
    - n = depth(current proc) - depth(call target) + 1
    - if n is 0, pass parameter pointer for static link
    - else follow static link n times and pass to callee as static link. n ≥ 0
    
### First class functions
- should treat functions as any other object
- related to lambda's, anonymous functions and closures
```scala
def procedure(x: Int) = { x + 1 } 
var increase: ((Int) => Int) = procedure
increase = { x + 2 } // nameless, so { x + 2 } is an anonymous function
increase = { x + increment } // increment is undefined, it's a FREE VARIABLE
increaseBy(increment: Int) : (Int) => Int = {
  { x => x + increment }
} // increaseBy closes increment
```

- a free variable in an expression is a variable that is not defined within that expression
  - x is not free in { x => x + increment } above, but increment is free
  - an expression is closed if it has no free variables
- a closure is an expression with its environment for the free variable in the expression body
  - implements a function value
- in this example, the environment is the frame of increaseBy. The closure closes over the environment
  - the closure adds the environment for the lambda { x => x + increment } bu defining what increment really is.

### Heap
A data structure that manages memory so it can be allocated and freed
- A6 - allocate and never free
- A11 - allocate and free when extent ends
- every procedure with a closure nested inside will have a frame on the heap

#### Objects
Objects can be thought of in terms of closures
- objects have state and behaviour
- a collection of closures (indexed by names) that close over the same environment

```scala
def newCounter: (()=>int, (int)=>Unit) = {
  var value = 0
  def get() = value
  def incrementBy(amount: Int) = {
    value = value + amount
  }
  (get, incrementBy) // returns a pair of functions, that share an environment stored on the HEAP
}
```

### A6 Tutorial
```scala
// Testing your closures locally

def increaseBy(increment: Int): (Int)=> Int = {
  def procedure(x:Int) = { x + increment }
  procedure
}

def main(a: Int, b: Int) = (increaseBy(a))(b)

// now reimplemented in Lacs
val increment = new Variable("increment")
val increaseby = new Procedure("increaseBy",
  Seq(increment), Seq())

val x = new Variable("x")

// 4th arg, Option can be None or some other Procedure 
val procedure = new Procedure("procedure", Seq(x), Seq(), Some(increaseBy))

// some helper function
def v(variable: Variable): Code = read(Reg.result, variable)
// now define the body of the procedure
// make sure you implement some way that accesses outer scoped variable (should be similar to a regular read)
procedure.code = binOp(v(x), plus, v(increment)) // increment is an outer variable

increaseBy.code = Closure(procedure)

val a = new Variable("a")
val b = new Variable("b")

val parameterVar = new Variable("parameterVar")
val main = new Procedure("main", Seq(a,b), Seq())

// you can't use paramChunk because you don't know until runtime which paramChunk to access outer vars
main.code = CallClosure(call(increaseBy, v(a)), b, Seq(parameterVar))

val machineCode = compilerA6(Seq(main, increaseBy, procedure))
val endState = A1.loadAndRun(machineCode.words, Word(encodeSigned(1)), Word(encodeSigned(2)))

```

- For compilerA6, why do we need two phases? Varaccesses handles outer variable. To do that, you need the frames of all the outer procedures. We don't compute the frame of a procedure until runtime.
- Phase one, translate all procedures and generate frames. Then EliminateVarAccesses phase 2.
- phaseOneResults is a map from procedure to frame
- eliminateCalls -> closurecalls, static links?
- implementCall: Closure calls & Regular Calls. ImplementCall is the similarity between the two.
