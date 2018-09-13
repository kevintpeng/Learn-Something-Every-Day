# [Concurrency](https://www.student.cs.uwaterloo.ca/~cs343/documents/notes.pdf)

### Introduction
Concurrency is advanced code control flow.
- one possible control flow style is to use `break`s instead of flag variables, creating a multi-exit loop
  - no loops on middle exits
- static exit points known at compile time

#### Dynamic Multi-Level Exit
- modularization cannot always work when attempting to break out a function that contains an exit (routine scope)
- **dynamic multi-level exit** calls extend call/return semantics to transfer in the *reverse* direction to normal routine calls
  - control structures can use exceptional transfer to facilitate multiple outcomes
  - direct control flow to the specified activation (function) on the stack
  - therefore not lexically determined, meaning a flow to a recursive function is ambiguous
- **nonlocal transfer** is any that isn't a call or return

### Coroutine
Any routine that can be suspended and resumed
- requires execution location, state, status (active, inactive, terminated)
- synchronous execution alongside other coroutines
- **semi-coroutine**
