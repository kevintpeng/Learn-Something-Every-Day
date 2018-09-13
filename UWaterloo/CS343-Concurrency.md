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
  - in C, `jmp_buf`, `setjmp`, `longjmp`

Traditional approaches
- local fix-up routines
- return union, using `variant<type1, type2>`, and doing checks with `bool holds_alternative<type2>()`

a `goto L` here is the same control flow as exception handling (catching at the label `L`)
- forwarding is a bad thing to have (dealing with union returns)
- in a chain of function calls, the intermediate functions don't need to be coupled when we avoid forwarding

##### Exception handling
so dynamic multi-level exit allows complex forms of transfers among routines, this is often called exception handling
- an **exceptional event** is known, low frequency and triggers an alternative outcome
- exception handling is more complex for some environments, C++ has destructors
  - no matter how a routine is exited, the destructor is ALWAYS run
  - stack un-winding has rules to call destructors
- when a program doesn't catch an exception, a sequential program will abort
- a concurrent program might ask other **executions** (with their own runtime stacks) to handle
- **propagation mechanism** is a rule to locate the handler, often linear search popping off the stack but other algorithms may be used
- **handler** catches exceptions by matching one or more exception types

##### Static/Dynamic Call/Return
return  | call
---|---|---
        | static | dynamic
static  | sequel | termination exception
dynamic | routine | routine pointer, virtual routine, resumption

static return means that where the control flow is transferred after a function call is known statically (without running)

dynamic return means the location to return to (the caller) isn't known until code is run. In other words, there are multiple function callers.

static call means you know what function will be run when calling `foo()`

dynamic call means we don't know what code block will be run when calling a function.


- sequel is static propagation
  - an example of a sequel is the implementation of the catch body
-

### Coroutine
Any routine that can be suspended and resumed
- requires execution location, state, status (active, inactive, terminated)
- synchronous execution alongside other coroutines
- **semi-coroutine**
