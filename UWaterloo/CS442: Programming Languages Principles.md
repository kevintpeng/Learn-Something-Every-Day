# [CS442: Programming Languages Principles](https://cs.uwaterloo.ca/~plragde/442/slides/)

### Summary
Untyped Lambda Calculus
- 3 grammar rules, other definitions follow based on the three possible 

### Intro
Expressivity, meaning, guarantees, implementation

parantheses based syntax facilitates metaprogramming
- core language can be extended using marcos rewritten at "compile time"
- racket macro system is world class, allows hygiene to be bent through controlled manipulation of the source's abstract syntax tree

A truly minimal subset of racket: lambda abstraction & function application

### Mutation in Racket
**mutation** is changing the value bound to a name, or stored in a data structure (think variable)
- used sparingly in scheme and racket
- why not mutation? **referential transparaency**, expressions may be replaced with one of equal value
- mutation is occasionally useful for expressivity or efficiency, but **complicates the substitution model**
- `box` provides an intermediate mutation mechanism, and is a racket value that contains a racket value

### [More notes on Racket](https://cs.uwaterloo.ca/~plragde/tyr/)
- lambdas/closures refer to any variable in lexical scope
- lists are immutable
- has separate mutable list type
- module system is sophisticated becausae it must deal with **multi-phase macro expansion**

### Logic Review
Propositions are variables, with logical connectives

`Γ |- α` means “From the set of propositions Γ, we can prove the proposition α. Rules have their syntax, see notes.

### Untyped Lambda Calculus
OCaml is kind of lot's of syntactic sugar atop lambda calculus

First order logic (forall, exists), there is no procedure for deciding statements. Church proved this, needing to first define what a procedure is.
- lambda calculus helps us formalize reduction by substitution and scope
  - helps prove properties
  - proofs generalize well

3 grammar rules in lambda calculus (ambiguously)
- any variable is a term
- a term can be formed with a lambda, its parameter, dot (syntactic separator), and another term t
- terms can be a function application; f(x), (f x)
  - left-associative, parathesize to the left conventionally
  
*note concrete syntax tree is just more implementation details*

*formalizing abstract lambda definition is tricky, out of scope*

*truth is a semantic notion, proof is a syntactic notion, and we want to manipulate to prove.*

Abstractions extend as far right as possible

Purely, functions only have one parameter, so functions of multiple parameters must return a function lambda of n -1 parameters. **curried functions**

`λx.t`, we call x **a binder** whose scope does not extend beyond t
- `λx.λx.x` parsed `λx.(λx.x)` is a function that ignores its argument and returns the identity function

`λx.y`, `y` is free because it is not bound

We can recursively define the set of bound variables of an expression because the grammar is recursive:

1. BV[x] = empty
2. BV[ λx.t ] = BV[t] u {x}
3. BV[ t t ] = BV[t1] u BV[t2]

*notice this is just our three grammar rules*

A variable can be both free and bound if there are multiple occurences in different scopes
- name of a binder does not matter, so we need to formalize substitution
- `[x|-> t2] t1` indicates substituting t2 for x in t1
  - we can now define step relation in lambda calculus
- example, `(λx.zx)y` should simplify to `zy`
  - this desire is formalized as `(λx.t1)t2 -> [x |-> t2] t1`

Substitution rule gotchas

1. we need a case that doesn't touch bound variables
2. if our term substitution `s` contains free variables, they must not be bound by a lambda after substitution
  - inadvertent capture of free variables
  - solved with change of variables to a "fresh variable"

This definition of substitution gives us **alpha equivalence**, `=a` 
- so long as y isn't a free variable, `λx.t =a `

β-reduction is `(λx.t1) t2 ->β [x |-> t2] t1`, *notice it just says passing a function an argument is equivalent to substitution in its term*
- **redex** (beta reducable expression), is a subterm of the form `(λx.t1) t2`, a function application
  - several reduction strategies
- **full beta reduciton** allows reduction of any redex, we lose determinacy

Two redecies:
```
(λx.(λy.x)z)w
    1-------
2------------

If redex 1 first:
(λy.w)z

If 2:
(λx.x)w

But they're the same
```

*The rules for full beta reduction says perform any beta reduction in the expression you want*
