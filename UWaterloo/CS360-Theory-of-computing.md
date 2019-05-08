# Theory of Computing

### 1 [Background](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/01.pdf)
- Computational problems themselves can be viewed as mathematical objects
- a set `A` is countable iff there is an injective function from A -> Natural numbers
- if set `A` is infinite, it is countable if there's a bijection (total)
- recall the power set is the set of all subsets of a set
- one proof pattern is breaking down a set into finite lists of sets for the purpose of enumeration
- **Cantor's** theorem: the power set of the natural numbers P(N) us uncountable (since N is an infinite set)
- strings are finite sequences of symbols from an alphabet
- languages are sets of strings

### 2 [DFAs and Countability](https://cs.uwaterloo.ca/~watrous/CS360.Spring2019/Lectures/02.pdf)
- languages are countable because you can map the natural numbers to the infinite set of all possible strings (again, there is a bijection that can be defined)
- the set of all languages over any alphabet is uncountable by Cantor's theorem
- recall from CS241 that a DFA is a state diagram representation
- we use the function L as a filter for a language
- a language `A` is **regular** if there is a DFA, `M`, s.t. `L(M) = A`
