# Complexity Theory
Classifying computational problems according to their inherent difficulty, and relating those classes to each other. A problem is inherently difficult if its solution requires significant resources. 

## Computational problems
An infinite collection of instances together with a solution for every instance. 
### Decision Problems as Formal Languages

## Machine models and complexity measures
### Turing Machine
A Turing machine is a mathematical model of a general computing machine. It is a theoretical device that manipulates symbols contained on a strip of tape. 

All programming languages can be computed with a Turing machine. Any computer is **Turing complete** if it can compute anything a Turing machine can. 

A **deterministic Turing machine** is the most basic machine. It uses a fixed set of rules to determine its future actions. Being deterministic, it will always evalute to the same outcome.

A **non-deterministic Turing machine** is a deterministic Turing machine with **non-determinism**, allowing it to have multiple possible future actions for a state. It can branch into many possible computational paths at each step. Not realistically feasible, but an interesting postulate for complexity classes.

## Complexity Class
A set of problems of related resource-based complexity. A class is the set of problems solved by abstract machine M using O(f(n)) of resource R, where n is the size of the input.

## P versus NP problem
P (Polynomial) is the class of problems with polynomial algorithms. The complexity class NP (Non-deterministic Polynomial) is the set of problems with no known efficient algorithm. P is a subset of, and possibly equal to NP. 
- NP can be defined as problems solvable in polynomial time with a non-deterministic turing machine. 
- NP can also be defined as any problem where the solution can be verfied as true in polynomial time.
  - *non-deterministic turing machines can evaluate all paths at the same time. If the machine halts on a given path, then if the path was found in polynomial time, then a regular turing machine can verify the solution in polynomial time too.*
  - 
  [source](https://en.wikipedia.org/wiki/Computational_complexity_theory#P_versus_NP_problem)
