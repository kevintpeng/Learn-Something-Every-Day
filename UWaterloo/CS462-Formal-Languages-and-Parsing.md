# [CS462 Formal Languages and Parsing](https://www.student.cs.uwaterloo.ca/~cs462/)

### Combinatorics on Word: Definitions
- A **primative** is not a **power**
- P<sub>2</sub> means the set of all primatives over the alphabet of length 2: {0,1}
- `x Ш y` means shuffle, as in shuffling a deck (interleave)
- lexicographic order is defined for same length strings
- **radix order** sorts first by length then lexicographical
- z is **purely periodic** if z = x^omega for some finite x
- z is **ultimately periodic** if the suffix is purely periodic
- x and y are **conjugates** if x is a cyclic shift of y
- x is a **border** of y if x is not empty, x != y, x is prefix and suffix of y "entaglement"
- Lyndon-Schutzenberger 1st theorem, the "alfalfa" theorem
- can not avoid squares over a finite alphabet
- a **morphism** is a map from one alphabet to another, preserving concatenation

Proof tricks:
- pigeon hole principle is useful for showing eventual repetition in infinite strings 

### Finite Automata and Regular Languages

- **moore vs mealy machines** are representations of a DFA for computation, resulting in some output
  - moore outputs different values at each state. there exists a mealy machine with the same # of states
  - mealy outputs values at each transition. there exists a moore machine with |Q| |Δ| states 
- Quotient operator on languages: `L1 / L2` is defined as `{x in Sigma * where y in L2 and xy in L1 }`
  - we can define `prefix(L) = L / Sigma*`
- Concatenation of languages: `L1 L2` is `{xy where x in L1, y in L2 }`
- Theorem: for language `L` and regular language `R`, then `R / L` is regular
  - idea: start with a DFA for `R`, modify its final (accepting) states
- example: remove trailing zeroes while preserving regularity. `(L / '0'*) n {epsilon u sigma* u sigma - {0}`
- Δ<sup> * </sup> is the set of all languages
- **substitution** maps words to languages. It preserves concatenation.
  - "substitution by regular languages" means regularity is preserved during substitution.
- Theorem: substitution preserves regularity. Prove by induction on the regular expression operators.
- **inverse morphism** on a language L is, given a morphism, the set of all words that when the morphism is applied to them, they result in a word in L

Proof tricks:
- for induction, always construct the problem recursively. Then make sure during the induction step, we apply it to pieces recursively.
- start with reprentations of an object (regular language represented by DFA, NFA, etc) and modify it to reach an answer
