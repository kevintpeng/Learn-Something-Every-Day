# API 
Application-Programming Interface (API) describes the set of methods, tools, routines and protocols set out by a library, package, or software applicaiton. An API for the Java Math library describes the method names and their parameters like `Math.pow(int, int)`.

## Good API Design
- should be easy to learn and use
- hard to misuse
- easy to evolve
- Simplicity is better for early API design. 
 
**Once an API is in use, it is hard to make drastic changes without breaking existing code.**

## Developing an API
- get feedback frequently
- aim to displease everyone equally (aim for generalized design)
- API should be as small as possible (**when in doubt, leave it out**)
- powerful with least conceptual weight
- separate implementation from functionality (so algorithms can be potentially optimized in future)
- minimize accessibility of everything, making as many methods and fields private as possible
- consider performance consequences of API design decisions (mutability)
- Avoid mutability when possible, for simplicity and thread-safety
- **Dont make the client do anything the module could do**
- - avoids *Boilerplate* code which is unncessarily repeated code.
 
## Method Naming
- should be consistent (remove vs delete) 
- self explanitory (avoid cryptic abbreviations)
- use consistent parameter ordering across methods

## Principle of Least Astonishment
"API elements should not do 'surprising' things". When overloading methods, the new implementation should conceptually do the same thing. Avoids lots of errors for programmers using your API.

[Google Tech Talks from Josh Bloch, Java API designer](https://www.youtube.com/watch?v=aAb7hSCtvGw&feature=youtu.be)
