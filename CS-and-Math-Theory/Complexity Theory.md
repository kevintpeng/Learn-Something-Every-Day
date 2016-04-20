# Complexity Theory
Classifying computational problems according to their inherent difficulty, and relating those classes to each other. A problem is inherently difficult if its solution requires significant resources. 

## Computational problems
An infinite collection of instances together with a solution for every instance. 
### Decision Problems as Formal Languages

## Machine models and complexity measures
A Turing machine is a mathematical model of a general computing machine. It is a theoretical device that manipulates symbols contained on a strip of tape. 

All programming languages can be computed with a Turing machine. Any computer is **Turing complete** if it can compute anything a Turing machine can. 

A **deterministic Turing machine** is the most basic machine. It uses a fixed set of rules to determine its future actions. Being deterministic, it will always evalute to the same outcome.

A **non-deterministic Turing machine** is a deterministic Turing machine with **non-determinism**, allowing it to have multiple possible future actions for a state. It can branch into many possible computational paths at each step. Not realistically feasible, but an interesting postulate for complexity classes.

## Complexity Class
A set of problems of related resource-based complexity. A class is the set of problems solved by abstract machine M using O(f(n)) of resource R, where n is the size of the input.

P (Polynomial) is the class of problems with polynomial algorithms. The complexity class NP (Non-deterministic Polynomial) is the set of problems with no known efficient algorithm. P is a subset of, and possibly equal to NP. 
- NP can be defined as problems solvable in polynomial time with a non-deterministic turing machine. 
- NP can also be defined as any problem where the solution can be verfied as true in polynomial time.
  - *non-deterministic turing machines can evaluate all paths at the same time. If the machine can find a solution in polynomial time, then the path was found in polynomial time, so a regular turing machine can verify the solution in polynomial time too.*

### Reduction
A reduction is a transformation of one problem into another problem. Captures the informal notion of a problem being at least as difficult as another problem. 

**Hardness** for a complexity class says that form a hard problem X in complexity class C, all problems in C can be reduced to X. The set of problems for NP is called **NP-hard**.

If a problem X in C is hard for C, then X is said to be **complete** for C. **NP-complete** contains the hardest problems in NP, that are least likely to be in P.

[source](https://en.wikipedia.org/wiki/Computational_complexity_theory#P_versus_NP_problem)
