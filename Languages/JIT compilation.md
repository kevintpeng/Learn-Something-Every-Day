# JIT Compilation
Also known as dynamic translation, is compilation done during execution, at run time rather than prior to execution
- combinations of ahead-of-time compilation and interpretation
- purpose is to reap the speed benefits of compilation and flexibility of interpretation
- allows for adaptive optimization
  - dynamic recompilation (dynarec) can tailor the generated code to reflect the program's run-time environment and optimize based on information not available ahead of time
  - often very useful when running machine code designed for a different architecture (think emulators for games)
  - some processor running code designed for a simple processor might be able to make use of special instructions that can perform multiple simple instructions in one cycle
  - adaptive optimization is useful for repetitive tasks, recompiling + running new code is faster than running old code
- JIT compilation is suited for dynamic programming languages, where it can handle late bound data types, and enforce typing guarantees
- JIT compilation in theory can surpass static compilation performance, since it can perform optimizations at runtime

### Bytecode & Optimization
Bytecode is an intermediate representation of source code, for the purpose of portability across platforms
- JIT compiler handles the bytecode on a particular computer architecture, converting to machine code and optimizing for the system
  - optimizes traditional use of bytecode, run on an interpreted virtual machines (like the classic JVM)
- JIT compilation is relatively quick because high level code is already converted to bytecode 

Optimizations:
1. targeted CPU optimizations are possible for JIT compilers, while they are impractical for static compilers 
1. systems can optimize based on statics while running in the environment
  - example: JVM uses primarily an interpreter, but monitors frequently used bytecode and optimizes it
1. Inling replaces a function call site with the function body 
  - inlining reduces speed at the cost of space, and can be detrimental if it consumes too much of the instruction cache
1. bytecode systems can more easily rearrange executed code for better cache use

### Javascript JIT Compilation
Safari and Chrome do JIT compilation for JS, using bytecode
- V8 JavaScript Engine compiles directly to native machine code (used in chrome)

### Late Binding in Dynamic Languages
Programming mechanism where method calls are looked up by name at runtime
- language doesn't guarantee existance of method so late binding cannot bind to a particular slot on the virtual method table

