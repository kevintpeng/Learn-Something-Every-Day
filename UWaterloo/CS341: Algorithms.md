# [Algorithms](https://www.student.cs.uwaterloo.ca/~cs341/)
[learn](https://learn.uwaterloo.ca/d2l/le/content/362174/Home?itemIdentifier=TOC)
- Insertion Sort O(n^2)
- Maximum sub-range sum, use prefix sum array for O(n^2), or divide and conquer for O(n log n)
  - recurrence relation is T(n) = 2 T(n/2) + O(n), reducing to O(n log n)

### Sorting
selection sort is naive approach, swap minimum element to leftmost position
- how many operation?
- for loop increment, assignment, comparison, swap all one ops
- write number of ops per loop block, calculate nested loops with arithmetic sequences

mergesort gives us a divide and conquor solution, using in tandum merge
- we can use recursive trees to count recursive call

**worst case** runtime analysis makes no assumption about input, and thus must hold for all input

### on some math rules
Proving asymptotic bounds (big O) can be done through the use of limits, where the limit->infinity of T(n)/f(n) = 
- 0 implies o(f(n))
- infinity implies omega(f(n))
- infinity > c > 0 implies theta(f(n))

sum of 1/i for i 1 to n is essentially the approximation of the integral for 1/n, but strictly less than the actual integral, log n

log n! = nlog n - theta(n) is stronger than saying big o n log n

### Reduction
informally solving a computational problem c1 by using an algorithm that solves another computational problem c2
- useful in complexity theory to compare difficulty of problems
- we can use reduction to solve parts of algorithms
- three sum can be represented as a two sum problem where we use sorted two sum for the second value, composed of the second and third array

**recurrence** is an equation for divide and conquer problems / recursive
- solvable with induction, guess and check
- recursion tree, mergesort example
- master theorem, practical
  - intuition is that certain bounds can be estimated based on what dominates; root, leaves
