## Counting
Counting is **enumerative combinatorics**. For some set A, we wish to calculate the cardinality (size) |A| of A. Sample questions:
- How many ways are there to seat n couples at a round table?
- How many ways are there to express a positive integer n as a sum of positive integers?

#### Sum Principle
Consider n sets of Ai for 1 ≤ i ≤ n, that are *pairwise disjoint*, namely the intersection of Ai and Aj = ø for all i ≠ j. Then the union of all sets |U Ai| = ∑ |Ai|, i = 1 to n. (using series notation for both)

For example, there are n ways to pick an object from the first pile and m ways to pick an object from the second pile, then there are n+m ways to pick an object altogether. 

#### Product Principle
For n tasks performed in a sequence, with c1 ways to do task 1, c2 ways to do task 2 and so on, then the number of possible courses of action is ∏ ci for i = 1 to n.

*Applies to things like choose 5 times from a set with or without replacement.*

#### Bijection Principle
There exists bijection from A to B iff the size of A equals the size of B. 

*Then A can be counted by showing there is a bijection between A and B, and then counting B.*

#### Basic counting problems
*Counting can be thought of as finding the number of combinations/permutations of sets. More formally, this is equivalent to finding the number of functions that map from set A to set B with some potential constraint.*

**Choosing an ordered sequence of distinct objects with repetition.** Applying the product principle, `Given set A and B, such that |A| = k and |B| = n, the number of functions ƒ : A -> B is n^k.` Prove by induction that this is true for all k.

**Choosing an ordered sequence of distinct objects without repetition.** Applying product principle, there are `n!/(n-k)! = n(n-1)...(n-k+1) = ∏ (n-i) from i = 0 to (k-1)` (sometimes denoted by (n)k subscripted) `Given sets A and B, s.t. |A| = k and |B| = n, the number of one-to-one functions ƒ : A -> B is (n)k.`

**Permutations.** How many ways are there to arrange n people in a row? `(n)k = n!/(n-k)!` A bijection from A to itself is called a *permutation* of A. Same value as choose without repetition. 

**Seating a round table.** For n people, there are (n)k possible ways. But n possible orientations around that table that are all equivalent. So (n-1)!.

**Choosing an *unordered* collection of distinct objects *without* repetition.** Also known as *combinations*. For a set of k objects from n objects, every set can be arranged in k! ways. Each set corresponds to k! distinct ordered tuples. Let X be the number of sets of cardinality k. Then `X • k!` describes all permutations of sets with cardinality k, which is the smae as permutations of cardinality k, `n!/(n-k)!`. So, `X = n!/k!(n-k!)` and X is nCk (n choose k, also denoted as (n k)).

**Choosing an *unordered* collection of distinct object *with* repetition**. (n+k-1)C(k).
