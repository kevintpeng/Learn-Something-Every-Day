# Theory of Computing
### Summary
- **Cantor's** theorem: the power set of the natural numbers P(N) is uncountable (since N is an infinite set)
- any single language is countable because you can map the natural numbers to the infinite set of all possible strings (again, there is a bijection that can be defined)
- on DFA and NFA equivalence, a language `A` is regular iff there exists an NFA that accepts all strings in `A`


### 1 [Background](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/01.pdf)
- Computational problems themselves can be viewed as mathematical objects
- a set `A` is countable iff there is an injective function from A -> Natural numbers
- if set `A` is infinite, it is countable if there's a bijection (total)
- recall the power set is the set of all subsets of a set
- one proof pattern is breaking down a set into finite lists of sets for the purpose of enumeration
- **Cantor's** theorem: the power set of the natural numbers P(N) is uncountable (since N is an infinite set)
- strings are finite sequences of symbols from an alphabet
- languages are sets of strings

### 2 [DFAs and Countability](https://cs.uwaterloo.ca/~watrous/CS360.Spring2019/Lectures/02.pdf)
- any single language is countable because you can map the natural numbers to the infinite set of all possible strings (again, there is a bijection that can be defined)
- the set of all languages over any alphabet is uncountable by Cantor's theorem
- recall from CS241 that a DFA is a state diagram representation
- we use the function L as a filter for a language
- a language `A` is **regular** if there is a DFA, `M`, s.t. `L(M) = A`

### 3 [NFA](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/03.pdf)
- we can think about non-determinism as verification
  - given a string, NFA determines whether its possibly accepted
- there can be multiple possible transitions for each input to the transition function, and epsilon is a possible input
- NFA accepts a string if there exists some
- epsilon-closure is an extension of NFAs over a set of states, e(R) that is the set of states reachable from states in R using just epsilon transitions
- using this, we can delta * for NFAs (taking a string as input)
- a language `A` is regular iff there exists an NFA that accepts all strings in `A`

### 4 [Regular Expressions](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/04.pdf)
3 regular operations:
- union of language A and B: w is in either
- concatenation AB: wx is every combination of w in A then x in B
- kleene star A * : {empty} u A u AA u AAA ...

If A and B are regular languages, any regular operations on them produce regular languages
- prove by defining an NFA that uses DFAs for A and B to accept the resultant language
- proving kleene star acts as a closure does not follow from union and concatenation, because it is an infinite number of operations applied so it needs its own proof
