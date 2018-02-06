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
  
### Master Theorem
case based theorem, for find asymptotic behaviour of recurence relations where all subproblems are of equal size.

to prove, expand the recursion tree and simplify the expression using a summation over all levels. then use the sum of c^j formula to get three cases based on the value of (a/b^d)

### Divide and Conquer Algorithm examples
find the two closest points in a set
- naive is O(n^2)
- break the set in half by x value
- find the closest pair in left and right, then find closest pair spanning both L and R
  - finding the spanning pair can be found by checking a bounded region, based on subproblems L and R
  - delta=min(closest(L), closest(R)), then sort by y, move box of size 2delta by delta from the bottom point to top. each box contains at most 8 points ( a fifth on either half would contradict our chosen delta value)
- analysis, n log^2 n
- this can be simplified if you keep an extra copy of the list sorted by y, then filter using sets at each step. this is O(n log n)

multiplying integers is O(n^2) with respect to digits naively
- observing that (a+b)(c+d) - ac - bd = ad + bc reduces our recursive calls from 4 to 3
- from master theorem, this is n^1.4

### Greedy Algorithms and their proofs

### Dynamic Programming
DP can be used to remove repeated recursive calls.
- linear independent set example <= weighted activity selection <= weighted independence set
