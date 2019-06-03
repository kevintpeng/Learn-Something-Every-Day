# Theory of Computing
### Summary
- **Cantor's** theorem: the power set of the natural numbers P(N) is uncountable (since N is an infinite set)
- any single language is countable because you can map the natural numbers to the infinite set of all possible strings (again, there is a bijection that can be defined)
- on DFA and NFA equivalence, a language `A` is regular iff there exists an NFA that accepts all strings in `A`
- there are uncountably many languages over sigma, but countably many regular languages
- **pumping lemma** (for regular languages) tells us that there is always a loop in a DFA for input string whose length is greater or equal to then number of states

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

### 5 [Proving languages to be nonregular](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/05.pdf)
- **pumping lemma** for regular languages allows us to observe the pigeon hole principle for DFAs: that more inputs than states means that some state was visited more than once.
  - also, for any string length greater than or equal to n for n states, there must be a loop
  - formally, for a regular language there is always some point at which all strings longer than or equal to `n` can be written containing a loop in the first n characters
  
How to use the pumping lemma:
1. fix n as any number, we describe the rest of the proof based on any fixed selection of n
1. define a string towards contradiction, that satisfies the requirements of the pumping lemma
1. determine what form the loop must take
1. because the pumping lemma must hold for all number of loops, show that there is a particular number of loops where xy<sup>i</sup>z is not contained in the language which contradicts the third condition of the pumping lemma.

- one example of a nonregular language is closing parentheses
- one where the number of loops affects the state is not truly a loop
- one where certain lengths are accepted, but are not cyclic values (exponential, prime)

### 6 [More regular languages](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/06.pdf)
- reverse is another closure property of regular languages (proven by constructing a reversed NFA, or by reversing a regular expression)
- symmetric difference of languages is another clousre property
  - if A is regular, B is nonregular, A ▲ B is nonregular
- prefix is a closure property, proven by constructing a DFA where the new accepting states are the set of all states q where there's some string v s.t. δ * (q,v) in the original accepting states
- suffix is a closure property, proven by allowing an epsilon transition to any reachable state
- substring is a closure property, because it is a prefix of a suffix
- example proof showing that the language where a single symbol can be skipped can be proven using two copies of the DFA with modifications to the first copy, where there exists epsilon transitions from the first to the second DFA wherever there exists transitions within the first.

### [7 Context-free grammars and languages](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/07.pdf)
- CFG `G = (V, Σ, R, S)`, where V is variables, Σ is the alphabet, R is rules, S is start variable
  - rules are of the form `A → w`, A in V, w in (V union Σ) * e.g. S -> 0 S 1, S -> epsilon
- every CFG generates a language L(G)
- formally, the **yields relation** defined by CFG G is a relation x maps to y, where some variable in V from x is replaced by some new set of symbols, following some rule in R.
- if x in L(G), we can find some **derrivation** of it from the CFG, a sequence of strings where the first is S and the last is x

Prove that all w in A is generated by CFG G:
1. Let w be a string in A, and set n = |w|. Prove that w is in L(G) by strong induction
1. base case: n = 0 so w is empty, and show that there is some derivation
1. induction step: assume n >= 1, and hypothesize that x in L(G) for every x in A with |x| < n
1. use properties of language A and the assumption that any strings less are generated by G to find a derivation of w in terms of other generated strings smaller than w

### [8 Parse Trees, Ambiguity, Chomsky Normal Form](https://cs.uwaterloo.ca/~watrous/CS360/Lectures/08.pdf)
- **left-most derivation**: the left most variable always gets replaced. All strings generated by a CFG have a left-most derivation because each step can only ever correspond to a single variable, never multi-variable so we choose can choose the left by convention
- ambiguity between parse trees can arise even in left-most derivations, and unambiguous CFGs are a requirement for some applications
- it is not always possible to generate unambiguous CFGs, specifically for **inherently ambiguous languages**
  - one such example includes an OR in its definition, and when you satisfy both conditions, it's ambiguous which one can be used to satisfy it
- a CFG can always be written in **Chomsky Normal Form**, so that only binary parse trees can be derived (allowing unary branches)
