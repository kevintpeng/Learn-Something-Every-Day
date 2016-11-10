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

### Finite Automata
In Theory of Computation, a Deterministic Finite Automata is a deterministic finite state machine that accepts and rejects finite strings of symbols, to produce a unique run of the automata for each input string. It recognizes exactly the set of regular languages, useful for lexical analysis and pattern matching

[ASIDE] A regular language is a formal language (set of string and symbols constrained by rules) that can be expressed with regular expressions.
- the collection of regular languages over an alphabet ∑ is defined recursively
  - The empty language ø and the empty string language {ε} are regular languages
  - forall a in ∑, the singleton language {a} is a regular language
  - if A and B are regular languages, then A u B, A•B (concat), and A* (Kleene Star, one or more) are regular languages
  - no other languages over ∑ are regular
- it is a language accepted by deterministic and nondeterministic finite automaton

Formally, a DFA is a 5-tuple; <∑, Q, q0, A, ∂> where
- ∑ is a finite alphabet
- Q is a finite set of states
- q0 is an element of Q, is the starting state
- A is a subset of Q, is the accepting states; machine reports the input string is a member of the language it accepts
- ∂: Q x ∑ -> Q is a transition function

DFA recognition algorithm:
- define ∂* : Q x ∑* -> Q extended transition function, ∑* is a string of symbols from ∑
- ∂*(q, e) = q
- ∂* (q, head::tail) = ∂* ( ∂(q,head),tail), recursively applies alphabet symbols with function ∂() to move states

- A word is **accepted by the DFA** if ∂* (q0, w) is an element of A
- the language defined/specified by a DFA is the set of words accepted by the DFA
- a language is **regular** if exists a DFA that specifies it

Non-determininistic Finite Automata (NFA) has multiple choices of transitions between states
- a word is accepted by a NFA if any path leads to accepting state
- the machine takes all choices at once, so the NFA is a set of states at any given point, rather than a single state

Formally, a NFA is a 5-tuple; <∑, Q, q0, A, ∂> same as DFA except `∂: Q x ∑ -> 2^Q` is a transition function to set of states, where 2^Q is the [power set](../Math-CS/Sets.md#set-of-all-subsets)

NFA recognition algorithm: 
- define `∂* : Q x ∑* -> 2^Q` extended transition function, `∑*` is a string of symbols from ∑
- `∂*(q, e) = {q}`
- `∂*(q, head::tail) = union of all( q' in ∂(q,head) . ∂*(q', tail))`

A word `w` is accepted by an NFA if `∂*(q0, w) n A ≠ {}`, the set of possible transitions is contained in `A`, the set of accepting states

NFA-ε, accepts ε (empty string) as a possible string input. It nicely represents unknown states. To eliminate all epsilon-transitions from an NFA:
- where an epsilon transfer (`∂*(q, epsilon) = {q}`) is a given element of the alphabet that, for example, causes state A -> B, then replace all transitions to A with a transition to B, and remove the epsilon-transition from A to B

### Scanning
Breaking a string into tokens using an NFA constrained by maximal munch property
- Recognition: is some word in language?
- Scanning: split a string into tokens s.t. each token is in language
- maximal munch is the principle that when creating some construct, as much of the available input should be consumed
- input: string w, language L
- output: sequence of words w1, w2 ... wn s.t.
  - w1, w2...wn = w
  - forall i . wi in L
  - forall i, wi is the longest prefix of wi, wi+1 ... wn that is in L (maximal munch)
- *when tokenizing, break the string into the largest tokens possible*

Let L be language of tokens, `L*` be the language of words that can be scanned
- Given an NFA for L, construct an NFA for `L*` by adding epsilon-transitions from every accepting state to start state
- since NFA is nondeterministic, we constrain each transition to use the maximal munch to produce a unique transition
  - :( might not find a solution when one exists because it chooses branches of maximum token size and over looks a possible path to a solution
  - if `L = {aa, aaa}`, `W = aaaa`, then maximal munch first takes the token `aaa` from W, leaving W = `a`. `a` is not in L, so our method says no solution, even though it's possible to take the tokens `aa` and `aa` from W.

Method:

1. run DFA for L until it gets stuck
2. if in non-accepting state, **backtrack** to last-visited accepting state. if no accepting states visited, ERROR
3. output a token corresponding to accepting state
4. set DFA to start state and repeat from 1 (this is why we have to add epsilon transitions for `L*` eariler)

### Regular Expressions
A regular expression expresses a regular language. So L is basically a function that maps regular expressions to the sets of strings that it represents.  
```sh
ε       L(ε) = {ε} # empty string
a in ∑  L(a) = {a} # literal character
ø       L(ø) = {} # empty set
R1 | R2 L(R1|R2) = L(R1) u (L(R2) # R1 & R2 are regex
R1R2    L(R1R2) = {xy | x in L(R1), y in L(R2)} # concatenation of elements contained within each of the regular languages
R*      L(R*) = { x1x2..xn | forall i . xi in L(R), n ≥ 0 } # Kleene's Star
```

Kleene's Theorem:
- For a language L, the following statements are equivalent to each other:
1. exists a DFA specifying L
2. exists an NFA without epsilon-transitions specifying L 
3. exists an NFA specifying L (could have epsilon)
4. exists a regex specifying L
5. L is regular 

### Context-Free Grammars
Regular expressions can't express unlimited recursive structures. We want nesting in programming languages, so we need something more powerful than regular languages.

A context-free grammar (CFG) is a set of recursive rewriting rules (productions) used to generate patterns of strings. Regular Expressions use iteration, Context-free Grammars use recursion
- set of terminal symbols ∑, which are the characters of the alphabet that appear in the strings
- a set of nonterminal symbols N, placeholders for patterns of terminal symbols that can be generated by nonterminal symbols
- a set of productions P, rules for replacing nonterminal symbols on the left side of the production with other nonterminal or terminal symbols on the right
- a start symbol S, which is a special nonterminal symbol that appears in the initial string generated by the grammar
- A CFG may have a production for a nonterminal to the empty string (epsilon), effectively removing the nonterminal from the generated string

*So it looks like you can represent a CFG with a dfa based on their similar definitions. Perhaps CFGs are a subset of all possible dfa's.*

To generate a string of terminal symbols from a CFG:
- start with a string consisiting of the start symbol
- apply one of the productions with the start symbol 
- repeat the process of selecting nonterminal symbols in the string and replacing them with the right side of corresponding productions until only terminal symbols remain
- αAβ **directly derives** (in one step) αγβ if A → γ ∈ P
- a **derives** (in 0 or more steps) an if a1 => a2 => ... => an (a =>* an)

- Def: A formal grammar is a set of production rules for strings in a formal language
- Def: A regular grammar is a formal grammar that is right-regular or left-regular. For A, B, C in N, a in ∑:
  - a right regular grammar where B -> a, B -> Ca, or B -> epsilon
  - a left regular grammar is where A -> a, A -> aB, or A -> epsilon
- *a regular grammar describes a language describable by a regular expression. DFAs, Regular Grammar and Regular Expressions are just three formalizations of the same concept.*
- context free languages are generated by CFGs, the set of all Regular languages are a proper subset of all Context Free Languages

canonical derivations: rightmost and leftmost, for precedence of parsing
- there exists a parse tree iff exists rightmost derivation iff exists leftmost derivation
- A CFG is **ambiguous** if it allows multiple parse trees for the same input (different paths of production rules for the same output)

### Parsing
- Top-down parsing starts with S and finds derivation steps leading to result w. The hard problem is choosing the right rules
- Bottom-up algorithm starts with w, finds derivation steps leading to s.
- Chomsky Normal Form: RHS of CFG can have an arbitrary number of symbols
- in CNF form, production rules can only have either two nonterminals on the RHS or one terminal
- formally, CFGs are allowed to have empty productions NP -> epsilon, which can always be eliminated without changing the language via epsilon (by altering production rules)

### CYK
CYK starts with S, starting nonterminal, as alpha. We want to expand nonterminals in alpha such that the input string is represented by the CFG. So, check all possible chains of production rules until it finds a valid parse tree. It follows four cases, each trying to reduce the string of terminal and non-terminal characters, alpha, to the base case where alpha is empty. Since alpha is our current state, we keep checking the leftmost character from alpha to see if it can reduce our input, with the end goal being an empty alpha and empty input (i.e. all of the input is represented by a parse tree of terminal/nonterminal characters). Complexity occurs when the leading character of alpha is a nonterminal, since you have to now have to split the input string in two, such that the nonterminal describes the first partition and the rest of alpha describes the second partition of the input string. So there are a quadratic number of substrings of input that could be checked, each with a linear time partition check. So O(n^3) time complexity. Dynamic programming is used to optimize the problem by eliminating repeated calculations with a memoization table.  
  - Bottom up parsing, with dynamic programming to save results in table
  - given w, does `s =>* w`
  - sub-problem: given x, does `alpha =>* x`, alpha is a sequence of terminals and nonterminals, x is a seq of characters 
  - w =yxz for some y,z. x is a substring of w
  - A -> gamma alpha in P. alpha is a suffix of RHS of a rule in R
  - *so we have to test for every suffix alpha and every substring x, in O(w^3) time, since for each w^2 substrings, check against O(w) partitions of each substring.*
  - the table contains single entries for each nonterminal, where each cell of the table has a substring
  - cases for filling our table:
    - alpha -> epsilon (empty string) : true if x = epsilon
    - alpha -> aß : true if x = ay AND  `ß =>* y`
    - alpha -> A : true if exists A -> gamma in P s.t. `gamma =>* x`
    - alpha -> Aß : if exists y,z where x=y and `A =>* y` and `ß=>* z`

### Earley's Algorithm
- bottom-up
- P(w^2) Space
- O(w^3) time for ambiguous
- O(w^2) time for unambiguous

### Context Sensitive Analysis
Reject programs that satisfy a grammar but are still invalid
- in LACs, types prevent accidential misinterpretation

Lacs Types
- Int
  - integers between -2<sup>31</sup> to 2<sup>31</sup>-1 with arithmetic modulo 2<sup>32</sup>
- (type, ...) =&gt; type
  - functions that take arguments of the specified types, return a value of the specified type

A type is a collection of values. It is an interpretation of a sequence of bits 
- a type is a compatable property of programs that guarantee some property of their execution 
- ensures consistent use of operations
- identify how much memory is needed for a value

A **type system** is a set of rules htat compute the type of expression from the types of its subexpressions
- type system is **sound** if when it computes a type gamma for expression e, then e evaluates to value v in &gamma;

Using premise-conclusion notation from proofs, type inference rules:
```
Γ |- NUM: Int    in the context Γ (captial gamma), the symbol table, NUM has type Int 
Γ(ID) = γ        Γ must be fed through all rules so that our symbol table is accessible when needed
____________
Γ |- ID: γ

Let E in {expras, expra, expr, term, factor}

Γ |- E1 : Int
Γ |- E2 : Int
_____________
Γ |- E1 op E2 : Int   for op being arithmetic operation


```
