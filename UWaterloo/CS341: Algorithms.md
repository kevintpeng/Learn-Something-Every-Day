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

### Intractability
Looking at problems that we do not know of any efficent algorithms for (SAT, 01 Knapsack, Travelling Salesman Problem)
- focus on decision problems: boolean output rather than optimization problems

Let's formalize the set of tractable problems, "easy":

class P: given a computational decision probelm C, C is in P iff there exists an algorithm solving C in O(n^k) for constant k

pretty good definition in practice, but edges cases exist like n^1000 or exponential algorithms that run efficiently on average 

Idea behind **reduction**: if you're trying to sell security software, you can't say that it not hackable, but you can argue that if your software is hacked, then every other piece of software is hacked too. 

Looking at travelling salesperson problem, there is no known algorithm that can determine a tour in G in polynomial time. It's really hard to prove that there is absolutely no algorithm that exists. But we can prove that TSP is as difficult as a bunch of other unsolved problems. 

How do we prove in a relative sense?

C1 **reduces** to C2 (C<sub>1</sub> <=<sub>P</sub> C<sub>2</sub>) if given a polynomial time solution for C2, we can solve C1 in poly-time

We define **completeness** as, Let C be a set of problems, let ci in C b3 C-complete if forall ck in C, ck reduces to ci (ci is the hardest problem in C).

We can try to argue that TSP is the hardest problem in its class by saying that it is C-complete for a set of problems. This is C=NP. It is canonically the set of brute-force solvable problems.

Looking at the optimization version of the knapsack problem, it's clear that finding the max value also let's us simply solve the decision version of it.

C* is NP complete means

1. Show C* in NP
2. Show every C in NP, C <=<sub>P</sub> C* showing that C * is NP-hard

### How to argue a problem is in NP
Pick some set of problems C and show that C in NP if

1. correct solutions have polynomial length
2. problem instane that have YES answers are verifiable in polynomial time, given a solution

So all problems in P are also in NP.

So we have two ways to argue `C*` is NP-complete


### Reduction Example
Remember, C1 reduces to C2 => C2 is as hard as C1

Prove that Independent Sets (IS) reduces to 3-SAT

IS says find some k vertices that have no edges between any of them

3-SAT says given a boolean expression in CNF, find an assignment to n variables that yields true for the whole expression.

Write a reduciton, a polynomial time coverter from an IS problem instance to a 3SAT problem instance.
- in this case, make an edge between two vars if they are joined by `and`, and also make an edge for any pair of vertices labelled `xi` and `not xi`

State that the reduction is polynomial time

Claim: F is satisfiable iff exists an IS, S in G of size >= m (for m clauses in 3SAT)

Can there be an IS of size > n?

Proof of Claim:

1. Assume F is satisfiable. Prove there exists an IS S in G of sie exactly m.
- exists an assignment of vars that makes each clause Ci true
- pick one vertex from each clause that makes it true, then the selected m vertices are independent because we picked one from each clause and we cannot have picked xi and `not xi` at the same time for any xi

2. If there as an IS, S in G, then F is satisfiable
- then S contains exactly one vertex from each clause gadget Ci

Prove that IS reduces to Vertex cover.

Vertex cover outputs yes iff exists subset S of vertices of size <= k s.t. forall edges (u,v) in E, either u in S or v in S. 

Write a reduction, notice that they are inverse problems in a sense: for solution S of vertices that covers all edges, then V - S is a solution for independent sets, since V - S cannot have any edges within in, otherwise S wouldn't have been a solution to vertex cover.

Claims:

1. VC is NPC
2. VC is in NP (check that a given solution is correct by iterating through edges)
3. IS  <=p VC

Prove that Clique is NPC

Clique is a set S subset of V, where all possible edges exist within S and S is of size >= k. 

Claims:

1. Clique is NPC
2. Clique is NP
3. IS reduces to Clique

Notice that we can covert the problem by using the idea that a clique is exactly the opposite of an independent set. So we can just invert the edges of the graph and find a solution for Clique, and that is the solution for IS.

Subset-Sum reduces to 0-1 Knapsack

Instance converter: 

```
Subset Sum
X = {x1, ..., xn}, t

|
V
0/1 Knapsack
values = {x1, ..., xn}
weights = {x1, ..., xn}
W = t
V = t
```
