# CS444 Compilers

### Scanning and Parsing
- LL(1) is a top-down parser which finds a parse tree or rejects some input. The goal is a linear time algorithm.
  - a grammar is LL1 iff |predict(A,a)| <= 1 for all A,a
  - more generally, this class of parsers is referred to as LL(k), where k = 1 in this case
- LR is a bottom-up parser, AKA a shift-reduce parser
  - a **viable prefix** is a string of symbols that expands to a prefix of a valid sentence
- SLR(1) is same parser as LR(1), but they check viable prefix `Beta A alpha` differently

### Code Generation: Data layouts
#### Object Layouts
We have object layouts and also class layouts for holding instance vs static parts.

An object has to layout two parts:
- type tag/class data
  - includes static fields, method implementation addresses and subtype testing data
  - we need to implement dynamic dispatch for polymorphism
  - use superclass as a prefix of the object layout for all subclasses
- for subtype testing:
  - for single inheritance, we can use a DFA algorithm to precompute intervals, then we get constant time comparison where if one interval is fully contained in another interval, its a subtype
  - for multi-inheritance, use a 2D boolean array to store all type pairs and mark subtype relationships
- instance fields

#### Class Layouts
Class layouts will follow the same principle: superclasses are a prefix of all subclasses
- each method is a part of the class layout. It is a pointer to the implementation (start address of instructions for jumps)
  - it must be a pointer so that the data layout is the same, but the implementation can be overridden by choosing a different address
  
Classes that implement an interface complicate this. Multiple implementation requires a generic runtime lookup solution, that does not depend on the prefix-layout idea.
- selector indexed table is a naive 2D array, really good time (small constant)
- hash table, more efficient for space (no empty entries)

#### Arrays
For arrays, java arrays are a subtype of `Object`
- need vtable (like class layouts)
- subtype testing
- length
