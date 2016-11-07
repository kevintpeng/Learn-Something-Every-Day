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
