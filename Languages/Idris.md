# Idris
- pure functional programming language
- use cases in theorem proving

### Type-Driven Development
type-driven development is a paradigm of programming that uses type as a tool for guiding the construction of the program, instead of its usual role as an error checking mechanism
- types are first class language constructs, can be stored or returned like any other value
- can use this to describe rich types by composing characteristics (a list that is never empty, a pair of lists of equal length, ensure that matrices have the same dimensions)
  - asserted statically
- idea is to use types to organize concepts for the programmer, and act as a plan to implement
  - refine your model as you implement the plan
  - concurrent programs in Idris can use type-checking to assert and ensure invariants hold throughout synchronization
- **dependent types** allow more precision in type declarations (dimensions of matrix, size of vector)
- Idris is a pure functional programming language
  - **referential transparency** requires that an expression can be replaced with its output without changing program behaviour
