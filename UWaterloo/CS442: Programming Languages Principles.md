# [CS442: Programming Languages Principles](https://cs.uwaterloo.ca/~plragde/442/slides/)

### Summary
Untyped Boolean Expressions
- recursive grammar with terminals as true, false and nonterminal conditional statements
- can be simply extended to untyped arithmetic expressions, with the notion of successor/predecessor of some constant 0
- we learned that grammars formally define some syntax for a language but ultimately we must assign some semantic system to the syntax to get meaning
- operational semantics use a sort of "iterative simplification" called small-step, using an abstract machine which is essentially a state machine

Untyped Lambda Calculus
- 3 grammar production rules, other definitions follow based on the three possible 
- helps to formalize substitution, through a-equiv and B-red

Recursion
- use some tricks to make recursion a finite substitution, we do this under normal order reduction and also under call-by-value
- we use combinators, in this case the Y combinator, to make recursion work 

### 1 Intro
Expressivity, meaning, guarantees, implementation

parantheses based syntax facilitates metaprogramming
- core language can be extended using marcos rewritten at "compile time"
- racket macro system is world class, allows hygiene to be bent through controlled manipulation of the source's abstract syntax tree

A truly minimal subset of racket: lambda abstraction & function application

#### Mutation in Racket
**mutation** is changing the value bound to a name, or stored in a data structure (think variable)
- used sparingly in scheme and racket
- why not mutation? **referential transparaency**, expressions may be replaced with one of equal value
- mutation is occasionally useful for expressivity or efficiency, but **complicates the substitution model**
- `box` provides an intermediate mutation mechanism, and is a racket value that contains a racket value

#### [More notes on Racket](https://cs.uwaterloo.ca/~plragde/tyr/)
- lambdas/closures refer to any variable in lexical scope
- lists are immutable
- has separate mutable list type
- module system is sophisticated becausae it must deal with **multi-phase macro expansion**

### 2 Logic Review & Arithmetic
Propositions are variables, with logical connectives

`Γ |- α` means “From the set of propositions Γ, we can prove the proposition α. Inference rules have their syntax, see notes.

#### Untyped Boolean Expressions
Can be described with production rules as a grammar, with term simplifying to true, false, or conditionals
- terms are really trees, that expand to the AST

Prove a property P by structural induction on the parse tree

Need meaning to our language:
- Denotational semantics: associate terms with math objects
- Axiomatic semantics: ?
- Operational semantics: evaluation of boolean expression is defined by computation of an abstract machine
  - transition function says how to reduce a term, and its machine code is a term
  - we can say that a term's meaning is the final state that the machine reaches when started with t as its initial state (small-step style of operational semantics)
- if elimination is deterministic; the relation is actually a partial function (some x have at most 1 value)
  - `if t -> t' and t -> t", then t' = t"`
- term t is in **normal form** if there is no `t' s.t. t -> t'` (only `true` and `false` in our system)
- and `if t is in normal form, then t is a value`
- `forall terms t, there is a normal form t' s.t. t ->* t'`

#### Untyped Arithmetic Expressions
In our definition of this, a number is either 0 or a successor of a number
- this can be expressed with 4 rules; t ::=

1. 0
2. successor t
3. predecessor t 
4. iszero t

In our definition, we have term's normal forms that aren't values, e.g. `succ true`
- these are called **stuck**, a notion of run-time error


### 3 Untyped Lambda Calculus
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

**Confluence**, not every term has a normal form:

`(λx.xx)(λx.xx)` one step beta reduces to itself (since `x = (λx.xx)`, for x x)

- confluence theorem roughly says that if you can beta reduce divergently, you can bring them back together to a unique normal form
  - normal forms are unique is a consequence of the confluence theorem
- diamond property doesn't hold (some operations simplify the number of steps taken, but doesn't affect normal form still)
  - instead we need to define a form of parallel reduciton, where the diamond property holds
  - finally show that the multi-step relation (transitive closure) for parallel beta reduction is equivalent to full beta-reduction

`(λz.w)((λy.yy)(λy.yy))` can reduce forever if we try to first reduce the argument, or reduce in one step if we reduce the lambda.

**Standardizaiton Theorem** says the repeatedly reducing the leftmost outermost redex will find a normal form if it exists. It's called **normal order reduction** and is deterministic, unlike full beta reduction in general.

```
(λz.w)((λy.yy)(λy.yy))
       1-------------
2---------------------
2 is the outermost (in this case also leftmost)
```

**Call by name** is like normal order, but does not reduce in the body of abstractions
- this avoids variable capture but is inefficient

Haskell is lazy eval version of call-by-name, call-by-need

**Call-by-value** strict and eager, is leftmost, innermost
- first, substitute values

### Programming in Lambda Calculus
We use symbols to represent familiar notions.

To use conditionals, if B then T else F, we can say if some complex statement B simplifies to `λx.λy.x` it's true, and `λx.λy.y` is false

cons consumes two arguments,
f and r, and produces a function
consuming a message. This function
produced represents a list, where 
based on a sort of control bool
that we pass into it, returns either
first or rest of the list,
recursively defining a list as we 
know it.

[**Natural Numbers** p 60](https://cs.uwaterloo.ca/~plragde/442/slides/03-untyped-lambda.pdf)
- idea: code up by eliminator
- Church numerals
- 3 is something that does something 3 times
  - "apply s to z, n times"

test:
```
λ
```

**General Recursion** p 64
- `?` needs to be something that produces `fact`, let's stick a variable there and call it `r`, and stick a `lambda r` at the start

x = f(x), then x is a fixed point of f, nothing happens

for pfact, we need to compute the fixed point (`fact`) of `pfact`

suppose `fact = Y pfact`, then
```
fact = pfact fact 
fact = Y pfact
Y f = f (Y f)
```

forall f.

Can't substitute pfact into r because the function signature would be wrong in the recursive call


we end up with this cool definition of `pfact'` (protofactorial) which when applied to itself, produces `pfact' pfact'` as a recursive call

finally, rearranging

Y combinator doesn't work with call by value?

```
Y = λf. (
Y g = (λr.g(r r))(λr.g(r r)) // call by value FORCES (r r) to evaluate first
// normal order reduction DOES work though
```

We have to stop this evaluation
- call by value doesn't reduce in the body of an abstraction
- let's wrap it in an abstraction: `(r r) = λx.(r r) x`, now it needs to be applied before it get's reduced
  - this can be used equivilently, but SYNTACTICALLY it is different
  - `f` replaced with `λx.f x` is called η-expansion 
- Normal Order Reduction and call-by-value are two lazy ways to perform reduction

variables? we take out λ. ??? well we re-introduce some combinators. *These give us ways to still represent functions I guess?*

#### de Bruijn (brown) indices p 74
replace terms with numbers based on their function call DEPTH
- this is "lexical depth relative to its binding occurrence", *binding occurrence is where λx appears*
- sometimes indices need to be shifted?

### 4 OCaml
Meta language, for theorem provers. It was supposed to be used to express a proof and mechanical step through it to verify
- talked about syntax, ocaml has type inference, but we can explicitly state types
- user-defined types with algebraic datatype definition is pretty cool, playing cards example
  - can't just `|`-together types, each disjunct needs to have a constructor defined for it (prevents type ambiguity)
    - unambiguous types is what makes static type inferencing work
    - so we get things like `type iors = Int of int | String of string;;`, where `Int` is an arbitrarily named constructor, so it acts as a label so we can distiguish `Int 6` as an `: iors = 6` vs `6` is an `: int = 6`
  - constructors are not subtypes
- types that look the same are not 
- option type: `type 'a option = None | Some of 'a`
- records: `let p = {x = 5 ; y = 2};;`
- file by default exports its function definitions, `Stack.pop` 
- interface is used to check, not infer

### 5 Types
Look at the parse tree of the expression rather than dynamic evaluation of the expression
- can distinguish stuck expressions from valid ones
- `t:T` is pronounced "t has type T"
- if `t` is typable, then its type is unique and there is only one derivation
  - terms can make **progress** and preserve types
- progress says if `t:T`, then either `t` is a value or there is some `t'` s.t. `t->t'`
- preservation says if `t:T` and `t->t'`, then `t':T`
- progress + preservation is type safety
- **strong normalization theorem** says: every reduction of every well-typed term in the simply-typed lambda calculus is of finite length
  - suggests that simply-typed lambda calc is a weak model of computation

### 6 Extension to Lambda Calculus
Type rules for sum types:
- figuring out how to type an element of a subtype (like Int+Bool) isn't straight foward
  - OCaml requires unique constructors as we say to fix this
- inject left (`inl`) and right (`inr`) to express which side the type satisfies
- `inl 5 as Nat+Bool` is an annotation to help the type checker figure out what type it is

General Recursion

```
pfact r n = if n == 0 then 
            else n * r r (n - 1)
```
