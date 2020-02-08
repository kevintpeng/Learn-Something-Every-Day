# [CS462 Formal Languages and Parsing](https://www.student.cs.uwaterloo.ca/~cs462/)

### Combinatorics on Word: Definitions
- A **primative** `x` and **power** `w` form the word `w = x^k` for integer `k`
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
- if every subword of an infinite word appears at least twice, then every subword appears infinitely many times
- if every subword appears infinitely many times, the infinite word is **recurrent**
- thue-morse sequence is recurrent because any subword is from position i to j, and for the binary representation of `j`, you can always find the same subword ending at `11j` 
  - another way to think about this is the complementary construction. complement of complement gets you the original string back at a later position
  - ![thue-morse](https://upload.wikimedia.org/wikipedia/commons/f/f1/Morse-Thue_sequence.gif)

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
- **transducer** is a generalization of the mealy machine which transforms input to a new output, which has finite states, nondeterministic transitions, and each transition takes some input and produce output of possibly a different alphabet

Proof tricks:
- for induction, always construct the problem recursively. Then make sure during the induction step, we apply it to pieces recursively.
- start with reprentations of an object (regular language represented by DFA, NFA, etc) and modify it to reach an answer

### 3.8 Automata, graphs and boolean matrices
A transition in a NFA can be represented using an **incidence matrix**: a boolean matrix where for a given input character `a in Sigma, Ma[i][j] = 1` if there is a transition from state `i` to state `j` on character `a`, or `delta(qi, a) = qj`. (we use `AND` instead of multiply, `OR` instead of addition).

If you multiply matrices, we end up "following paths" along the NFA. `Ma x Mb` gives us the incidence matrix for word `w = ab`.

We learned from algos cs240 that there are more effective implementations of matrix multiplication than the naive `O(n^3)`. This gives us a more efficient computation for NFA simulation.

There are a finite number of possible matrices, even after infinite operations on them since each state can only be 0 or 1.

**Proof trick:** construct a second DFA from the original, using tuples of matrices as the states (this works because there are finitely many possible incidence matrices). Define the final states using a sort of "query" on all states that satisfy some property, enabling traversal from the initial state (row 0) to final states in the original DFA.

### 3.9 Myhill-Nerode theorem
The following are equivalent:

1. `L` is regular
2. `L` can be written as the union some of the equivalence classes of `E`, where `E` is a right-invariant (`xRy => xzRyz` `x,y in S, forall z in S`) equivalence relation with finite index
  - an equivalence relation `R` partitions a set into disjoint subsets of "equal" things (equivalence class)
  - index is the number of classes
3. Let `R`<sub>L</sub> be the Myhill-Nerode equivalence relation. Then `R`<sub>L</sub> is of finite index.
