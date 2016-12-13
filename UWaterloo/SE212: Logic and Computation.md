# Summary
Propositional logic uses terms that are either true or false, or a composition of terms 
- Prime propositions cannot be decomposed further, used to build compound propositions
- a formula is **satisfiable** if there exists a boolean valuation of `True`
- tautology's are true for all boolean valuations, contradictions are always false, a contingent formula is neither
- a set of formulas is **consistant** if there exists a boolean valuation so that they are all true
- proof theories are used in place of truth tables to show things like logicial implications
- a sound proof theory means any correct use of rules forms a correct argument
- a complete proof theory means that any problem that follows the constraints of a proof theory is provable using the rules
- (ECE124) Conjunctive Normal Form and Disjunctive Normal Form are simple ways of expressing a formula (only &s and |s)
- **Natural Deduction** is a proof theory where we prove a set of formulas entails another formula (and we often assume that the premises are consistent)
  - an argument is invalid if for some boolean valuation, the premises are true and the conclusion is false
- **Transformational Proof** uses `<->`, a composition of logically equivalent statements to "transform" the premise into the conclusion
- **Semantic Tableaux** is another proof theory, which proves arguments by disproving the negation of the conclusion. You start with the premises and the negation of the conclusion, then form a tree to essential show there is no possible boolean valuation where the premises entail the negation of the conclusion (meaning the argument never invalid, and thus always valid)
  - we aim to branch the tableaux on connectives like `and` where you have two possibilities, and aim to close each branch with contradictions


# Notes
- Semantic Tableau is a tree of boolean valuations for a conjunction of formulas at the root
  - by looking at the leaves of the tree, you can prove validity
  - generally or statements branch, because naturally they are satisfied by two cases
  - a branch is closed if P and !P appear on the path from the root to the leaf

## Predicate Logic
- predicate logic is a set of symbolic formal systems, much more semantically rich system than propositional logic, and can be reduced to propositional logic
- predicate logic introduces quantifiers, universal (forall) and existential (there exists)
- predicate is a symbol denoting the meaning of a relationship between two or more values
- a constant is a symbol denoting a particular value
- a predicate applied to arguments has a truth value and can be used as a prime proposition in propositional logic
- functions

### Syntax
- Alphabet: the syntax of predicate logic consists of:
  - constants (Keivn, true, false, propositional symbols), variables (x,y), function symbols (`father`), logical connectives, predicate symbols (`>`), quantifiers, punctuation, brackets
- terms are: constant, variable, function with arguements
- Well formed formulas have truth values
- !(forall x . P(x)) <-> exists x . !P(x)
- the scope quantifier is the subformula over which the quantifier applies in the given formula
  - a variable is bound to the closest quantifier to the left of its name
  - an occurrance of a variable is bound if it falls within the scope of a quantifier for that variable
  - a free variable is not defined within the scope of hte quantifier
  - a wff is closed if it contains no free variables (all formulas in this class are closed)

### Formalizing English
Logical Connectives -> Quantifiers -> Constants -> Functions -> Predicates
- Types are a set of values describing the possible values of a variable (important for functions)
- Typing rules for predicate logic: Bool is a special type, all constants have a type T1
  - each n-ary function has a type g : T1 x T2 x ... x Tn -> Ret (takes n different types and returns value of type Ret)
  - each n-ary predicate has a type: P : T1  x T2 x ... x Tn -> Bool
- a formula is well-typed if it obeys the contraints of the respective function/predicate definitions
- Type inference can be done on formulas to figure out if their typing is consistent
- `Forall x : Person . Forall y : Person` can be simplified as `Forall x,y : Person`

### Semantics
- semantics map propositional formulas to truth values in the set Tr = { T, F }
- Boolean valuation determines hte truth value associated
- in predicate logic, there's more things to break down, in order to get the meaning of a formula
  - in addition to a truth table, use a domain of discourse D
  - terms of predicate logic map to values in the domain
  - well formed formulas of predicate logic map to truth values
- the meaning of a predicate logic formula by using an interpretation:
  1. a non-empty domain, a set of distinct values
  2. constants map to a value in the domain, functions map to a total function (mapping from domain to domain), predicates take arguments from domain and returns values of Tr
  3. universally quantified variables must be T fro all substitutions of a value in the domain, existential must be true for some value on the domain
  4. logical connectives have the same meaning as in propositional logic

- When solving for a problem in predicate logic, we need to define a domain and an interpretation, that is what domain, set of values can a variable take on, and what is the truth value for each predicate on each element of the domain
  - generally we expand our domain large enough to disprove a statement
  - exists unrolls to disjunction of domain; forall unrolls to conjunction of domain
- to determine validity using the semantics, if the domain is finite, we can try all interpretations (all possible functions and predicate valuations). But we also have to check INFINTE domains, so to prove, we have to use proof theory.

### Natural Deduction
We extend the rules used in predicate logic, with ones able to handle quantifiers
- Forall elimination: if a formula P is true for all values x, then t can be any term and P[t/x] is concluded, where we define P[t/x] to be the formula obtained by replacing every free occurrence of variable x **IN** formula P with t.
- variable capture during substitution is when a free variable becomes bound
- "t is free for x in P" if in P, no free x's occur within the scope of Forall w or exists w for any var w occurring in t
  - you can substitute a var x for a formula as long as the formula doesn't contain x as a free variable within it
- whenever we use P[t/x], t must be free for x in P
- If t is not free for x in P, then variable capture would occur
  - in the substitution of t for x, no free variables in t should be captured
- Exists introduction: If P is true for some value, then there exists a value for which P is true
  - choose a line of the proof to be term t, replace it with x and bound it by Exists x .
  - all occurences of t do not need to be replaced
  - you have to choose t that does not contain bounded variables
  - avoid introducing x that is already free in the formula, since you might bound a free variable during substitution
- unknown variables have restricted set of values that satisfy the formula (`exists x . P(x)`)
- genuine variables satisfy the formula for all x (`forall x . x + x = 2x`)
- Forall introduction: for every xg (generalized) if a formula is true for some unconstrained value, then it's true for all values
  - xg must be a genuine variable and **not used on any previous line of the proof**
- exists elimination: if the formula is true for some value, using an unknown variable xu, we derive that formula Q holds (not containing xu), then Q holds
- Natural deduction is sound (proves only valid arguments) and complete (any valid argument is provable with ND)
- Semantic tableaux is used to show a set of formulas is inconsistent, where each branch represents a conjunction of the set of formulas at the root can be satisfied
  - the goal being to close all branches of the tree by creating valid contradictions
- universal instantiation (forall nb): forall x . P(x) non branches to P(t) for term t, t is free for x in P
- existential quantification: exists x . P(x) non branches to P(yu) where yu is a constant or unknown var, not a free variable in the tableau so far

## Theories
### Hidden Premises
north_of(Ottawa, Toronto) and north_of(Toronto, Waterloo), therefore north_of(Ottawa, Waterloo)
- north_of is implied to be transitive: `forall x,y,z . north_of(x,y) & north_of(y,z) => north_of(x,z)`

An **enthymeme** is an argument that contains a hidden premise
- hidden premises are environmental assumptions

A theory is a set of statements we want to make about some phenomenon
- a set of axioms about specific constants, function, and predicate symbols
- also defined as the set of all theorems provable from those axioms (called the closure)
- we include the axioms as premises
- we can use multiple theories together
- an interpretation in which all axioms of the theory are true is called a **model of the theory**
- need theories to capture facts about environment so we show that software has certain behaviour within an environment
- theories can be general math, or constructed for an environment

### Predicate Logic with Equality
- proof rules so far are not dependent on context
- some statements can be equivalent if for example nouns refer to the same thing
- use `=` for equality predicate, a binary infix predicate whose arguments are terms `a = b`
  - for formula equality use `<=>`, logical equivalence
- equality is symmetric and transitive
- Leibniz's Law: If `t1 = t2` is a theorem, then so is `P[t1/x] <=> P[t2/x]`
  - *substitute equals for equals*
- **normal interpretations** of `=` symbol is treating it as equality on the values of the domain. All interpretations are normal in this course

### Theory of Arithmetic
Recall Theories are a set of axioms about constants, functions and predicate symbols; built on logic.
- Theory of Arithmetic contains constants (0), functions (+,x, suc/++), predicates (<)
- Peano's Axioms stating natural number distinctness:

  1. 0 is not a successor: forall n . !(suc(n) = 0)
  2. successors are distinct: forall x . forall y . (suc(x) = suc(y)) => (x = y)
  3. 0 is the identity of addition: forall m . m + 0 = m
  4. forall m,n . m + suc(n) = suc(m+n)
  5. forall n . n x 0 = 0
  6. forall m,n . m x suc(n) = m x n + m
  7. induction: forall P . P(0) & (forall k . P(k) => P(suc(k))) => forall n . P(n)

- **recursive functions** are defined in terms of itself and certain terminating clauses
  - its value for 0 and value for n in terms of n-1
-
### Satisfiable Modulo Theories
- efficient and fully automatic analysis of the satisfiability of a formula in first order logic with theories
- basic method is to map a problem in predicate logic to equivalent problem in prop logic and let SAT solver analyze

## Sets
Distinct elements, unordered collection. Has predicates `element of`.
- Definitions; Set enumeration: list of items `{a, b, c}`
- Set Comprehension: predicates `{ x | x in N and x ≤ 9}`

Axioms:
- types can be written using sets
- set comprehension is equivalent to element of
- all x are not element of the empty set
- set equality
- proper subset
- power set P is the set of all subsets B of a set D

### Set Functions
- set union and intersection
- absolute complement
- set difference
- generalized set operations on multiple sets (think functions like summations ∑)

Derrived Laws of Set Theory:
- intersection and union are commutative, associative, distributive, De Morgan's Law
- empty set identities, universal set identities

### Proofs in Set Theory
There's a whole bunch of rules, see slides for TP and ND extensions. George uses `by sets % then the rule`

Russell's Paradox: if a set can contain sets as elements, can it contain itself?
- he created type theory: for example, arrange sets of sets in levels and refer to all objects with a predicate if they are at the same level (type)

### Relations
- def: tuple is a list of csv
- def: cartesian product A x B is the set of all pairs of the form (a,b)
- def: relation is a subset of the cartesian product of two or more sets
  - binary relation is a set of pairs (in other words, specifically 2D)
- recall set membership and unary predicates express the same info
- similarily, relations and multi-arity predicates expresses the same info
- all functions on sets can be applied to relations
- for binary Relation `R : D <-> B`, dom R = {x : D | exists y : B . (x,y) in R}, ran R = {y : B | exists x : D . (x,y) in R}

### Proofs in relations
- for TP, axioms stated as `|= A <=> B` can be used as law `A <-> B` in a TP step
- set equality A = B is proved by stating x in A <-> x in B, or by starting with A and ending with B (proving A <-> B)
- **inverse relation** is swapping domain and range of R: R<sup>~</sup> = { (b,a) . a : D, b : B | (a,b) in R}
- the **identity relation** of a set is pairing every element of the domain with itself; R : id(B) = {(a,a) | a in B}
- **relation composition** is "R followed by S": R ; S = {(a,c) . a in A, c in C | (a,b) in R & (b,c) in S}
  - composition is associative, `(R;S)~ = R~;S~`, `id(dom R) sube R;R~`, `id(dom R);R = R`
- **iteration** for creating counts of the same element: R<sup>0</sup> = id(D), R<sup>n</sup> = R;R<sup>n-1</sup>
  - it follows that R<sup>n+m</sup> = R<sup>n</sup> ; R<sup>m</sup> and R<sup>n•m</sup> = (R<sup>n</sup>)<sup>m</sup>   
- **relational image** R(|S|) = {y : B | exists x : D . x in S & (x,y) in R}

Can create new binary relations from subsets of existing relations by restricting or subtracting domain or range.
- S <| R triangle is domain restriction for relation R and set S; {(x,y) x:D, y:B | (x,y) in R & y in S}, <-| triangle with strike is domain subtraction, triangles pointing right are for range

Relational overriding R ⊕ S = ((dom S) <-| R) u S

## Z Specification
Formal specification language
- we define types, functions (or other compound types), constants
- relation `f: A <-> B means f in ℙ(A x B)`
- partial functions are generalized functions where the domain on f may include all, some or none of A
- function space is a set of functions

## Program Correctness
Show that program has correct behaviour. A **spec** describes desired output for input.

**Formal Verification** describe in logic the spec for code, verified with proof theory. Important for critical software, helps to find bugs and "tests for ALL inputs".

### Programming Language
We will verify imperative (seq of commands), sequential (no concurrency) and transformational programs (guarantees output and termination).
- assignment `V := E`, assigns result of expression to v
- imperative programs manipulate states, where state is the value of vars at a given time

Spec consists of pre and postcondition
- postcondition is a wff about the final state
- precondition before the program starts

Triples are assertions `assert(P); C; assert(Q);`
- `|=par` is partial correctness, which says for a triple, **if C terminates** then Q is the final state
- `|=tot` is total correctness, which guarantees termination
- proof theories for programs are often sound but are not complete by Godel's completeness theorem

### Proof Rules
We add rules to state whether commands in our programming language satisfy some precondition and post condition, given a set of premises and a conclusion consisting of a triple
- **assignment** says, with no premises, that `assert(P[E/var]); var := E; assert(P)`
- **composition** of proofs: commands are sequential if the postcondition of A is the precondition of B
  - like in TP, this composition of steps is how we form step by step proofs assert(A); c1; assert(B); c2; ... assert(F) |= assert(A); C; assert(F)
  - these are annotated programs, they require every assertion except the precondition to be proven
- **implied** proof rule says P' |- P, assert(P); C; assert(Q) and Q |- Q', then by implied, assert(P'); C; assert(Q'); where we must prove the **verification conditions** (VCs) P' |- P and Q |- Q' separately
- **derived assignment**: if P |- Q[E/Var] then assert(P); Var := E; assert(Q). We prove the premise using ND as a verification condition
- **one-armed conditionals**: assert(P); if(B) C; assert(Q). we need to handle two cases, boolean B true and boolean B false. For B is true, assert(P & B); C; assert(Q), for B is false, prove with ND the verification condition P & !B |- Q
- **two-armed conditional:** no VCs, rule states that if the triples P & B and P & !B lead to Q, then the triple P leads to Q with the if else statement holds
  - modified lets us work backwards, if assert(P1); C1; assert(Q); and assert(P2); C2; assert(Q); then assert((B => P1) & (!B => P2)); if(B) C1; else C2; assert(Q)

### Arrays
Function mapping indicies to values starting at 0 or 1
- for assignment to arrays, use relational overriding (+)
- **assingment**: assert(P[B (+) {(i,e)} / B); B[i] := e; assert(P);

### Functions and Procedures
Formal parameters are the indentifiers, while actual parameters are the values passed during the function call
- the name of the return value is always ret
- return is always the last statement
- functions do not alter global variables or parameter values

Procedures can change parameters and global variables
- **procedure rule**: 
  - premise: assert(R); C; assert(S)
  - assert(H & R[a1/x1,...an/xn]); p(a1...an); assert(H & S[a1/x1,...an/xn]);
  - H must not include any variables that are altered by C, procedure body
```sh
assert(P);
assert(H & R[a1/x1, a2/x2]); # implied (VC i)
p(a1, a2);
assert(H & S[a1/x1, a2/x2]); # Procedure
assert(Q);                   # implied (VC j)
```

### Logical Variable Introduction
For any any assertion with a variable, we can introduce a sort of temporary variable (that is currently not used) to represent a value at a given state.

**Rule: Log Var Intro**, P(w), then P(w0) & w = W0

### Recursive Functions
We use induction in the correctness proofs of recursive functions
1. base case, function satisfies its spec where there are no recursive calls
2. induction step, assuming it satisfies its spec for all calls to the function, then it satisfies its spec

**Look through the examples!!!** around slide 200

### Termination
A non terminating while loop or a non-terminating function or procedure recursion
- partial correctness does not check termination

To show termination, we identify an integer expression involving the variables of the loop condition that
1. is guaranteed to be non-negative
2. decreases with every iteration
3. makes the loop's guard become false as it approaches 0

This expression is called the variant or bounding function.

For recursion, show there is a section of the function that does not make recursive calls and is entered as the bounding function approaches 0

The **Decision problem** is a subset of problems which have yes/no answers

**Unsolvable (undecidable) problems:** decison problems for which no algorithm exists to solve


