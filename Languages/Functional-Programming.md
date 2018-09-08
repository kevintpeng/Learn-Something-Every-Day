# Functional Programming
It is a declarative programming paradigm (based on expression instead of statements), that treats computation as the evaluation of mathematical functions, while avoiding changing state and mutable data.

In functional programming, a functions output is dependent only on the parameters (deterministic?). This is one of the key motivations behind functional programming. This leads to benefits of compile-time optimization (memoization) and thread-safe parallel computing.

### Lambda Calculus
Mathematical abstraction that provides theoretical framework for describing functions and their evaluation.

### First-class functions and pure functions
See [first-class functions](../Math-CS/Relations and Functions.md#First-class and higher-order functions) and [pure functions](../Math-CS/Relations and Functions.md#Pure Functions (expressions))

### Strict vs. Non-Strict Evaluation
A Categorization (aka eager vs. lazy) based on how function arguments are processed when an expression is evaluated. For strict evaluation, a function fails if sub-functions fail. For Lazy, an argument of a function is not evaluated unless the function is dependent on the argument value.

## Comparison to Imperative programming
Imperative languages often:
- do not use higher-order functions
- they use I/O and states, inducing potential side effects.
- are more efficient in general.
