# Golang Internals TODO -- [source](http://blog.altoros.com/golang-internals-part-3-the-linker-and-object-files.html)
### [Linkers](../../Computer-Science-Concepts/Linker.md) and Go object file
An object file is created when a program is compiled: the go compiler is writen in go, and it creates a go object. This object has a `Syms` array (array of `goobj.Sym` structs):
```go
&goobj.Sym{
  SymID: goobj.SymID{Name:"main.main", Version:0},
  Kind:  1,
  // ...
```
- Sym struct holds information about symbols (id, size, type, data ...)
  - `main.main` symbol is the first symbol in the SYM array from `goobj` packages, corresponding to STEXT. These contain executable code

#### Relocations
`Reloc` array in the Sym struct consists of the following structs
