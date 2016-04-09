∪⊆∩

## Counting
Counting is **enumerative combinatorics**. For some set A, we wish to calculate the size |A| of A. Sample questions:
- How many ways are there to seat n couples at a round table?
- How many ways are there to express a positive integer n as a sum of positive integers?

#### Sum Principle
Consider n sets of Ai for 1 ≤ i ≤ n, that are *pairwise disjoint*, namely the intersection of Ai and Aj = ø for all i ≠ j. Then the union of all sets |U Ai| = ∑ |Ai|, i = 1 to n. (using series notation for both)

For example, there are n ways to pick an object from the first pile and m ways to pick an object from the second pile, then there are n+m ways to pick an object altogether. 

#### Product Principle
For n tasks performed in a sequence, with c1 ways to do task 1, c2 ways to do task 2 and so on, then the number of possible courses of action is ∏ ci for i = 1 to n.

*Applies to things like choose from a set without replacement.*

#### Bijection Principle
There exists bijection from A to B iff the size of A equals the size of B. 

*Then A can be counted by showing there is a bijection between A and B, and then counting B.*

