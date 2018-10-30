# LLVM
an umbrella project for compiler infrastructure
- front end of a compiler analyzes the source code to build an internal representation (IR), and manages symbol table
  - has front end implementations for nearly every major languages for front end
- its intermediate representation is strongly typed RISC instruction set
- compiler back ends translate between machine instructions and text
- the `lld` linker
