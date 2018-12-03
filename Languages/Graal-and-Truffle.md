# [Graal & Truffle](https://blog.plan99.net/graal-truffle-134d8f28fb69)
- Truffle is a framework for implementing languages using an AST interpreter
- Graal is a compiler, supporting several advanced optimizations aimed at high levels of abstraction and dynamism
  - can substantially [reduce the number of heap allocations](http://www.ssw.uni-linz.ac.at/Research/Papers/Stadler14/Stadler2014-CGO-PEA.pdf)
- the aim of the project is to make it easy to build languages, with an existing ecosystem to springboard off of
- [demonstration language](https://github.com/graalvm/simplelanguage) using truffle
- AOT and JIT refer to when a compilation takes place
  - JIT compiler from X to Y requires an interpreter for Y
