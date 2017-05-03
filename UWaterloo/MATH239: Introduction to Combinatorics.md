# Combinatorics
### Summary
- fibbonacci numbers come from the number of **compositions** from the set {1,2}
- the set of binary strings can be represented through a **cartesian power**: {0,1}<sup>n</sup>


### Introduction
Study of finite or countable discrete structures 
- discrete mathematics involves structures and processes that can often be enumerated by integers
- includes counting the structures of a given kind/size
- deciding when certain criteria is met
- four colour theorem: any separation of plane into contiguous regions can bel coloured with no more than four colours so that no two adjacent regions have the same colour
- Fibbonacci from permutations of {S,L}, where S is length 1, L length 2, n = total length
  - compute # of permutations of a set of length n, happens to equal the nth Fibbonacci #
  
A **composition** of a non negative integer `n` is a sequence where m1,..mr are positive integers and n = ∑m1...mr
- Fibbonacci is the number of compositions of an integer, where the elements are 1 or 2
- in example, SSSS -> (1,1,1,1), and SLS -> (1,2,1) 

**Binary Strings** have some length `n`, and are a sequence of 0s and 1s, with 2<sup>n</sup> possibilities
- Cartesian product of sets A and B are all ordered pairs of their elements; |A x B| = |A| • |B|
- Cartesian power A<sup>n</sup> is the set of ordered n-tuples of elements from A; |A<sup>n</sup>| = |A|<sup>n</sup>
- set of binary strings with length `n` can be expressed as the cartesian power: {0,1}<sup>3</sup> = {000,001...111}

**Binomial Coefficients** help us tackle "enumeration problems", like *how many k-element subsets are there of an n-element set*, which we recognize to be the nCk (combinations)
- `[n] = {1,2,...n}`, then a permutation of [n] is a rearrangement of its elements, with `n!` total permutations written as k-tuples
- combinations are different ways to choose k things from n things
- Pascal's triangle shows the number of combinations for a given column and row

**Binomial Theorem**: (1+x)<sup>n</sup> = ∑ (nCk)x<sup>k</sup>
- intuition: we have n `(1+x)` terms. When multiplying these terms, we either choose the 1 or the x
  - when multiplying we end with n+1 terms x<sup>0</sup> + ... + x<sup>n</sup>
  - to get the coefficients of these terms, we want to look at how many combinations we get for choosing x:
  - we get nC0 x<sup>0</sup> + ... + nCn•x<sup>n</sup>
