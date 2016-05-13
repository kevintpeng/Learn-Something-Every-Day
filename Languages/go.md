# Go
Go is a portable language, well catered for small tasks. In comparison to ruby, go has less overhead for simple low level tasks. Go is good for concurency.
- Go is a C-like language, also comparable to Java
- Go programmers keep all code in a workspace
- A workspace contains many version control repos
- each repo contains ≥ 1 packages
- each package consists of ≥ 1 go source files in a single directory
- path to a package's directory determines its import path

## Packages
Every go project is made up of packages. Prgrams start running in package `main`. The package name is same as last element of the import path (`math/rand` has `package rand`).

Individual statement: `import "fmt"`. Factored import statement: 
```go
package main

import (
  "fmt" // formatted I/O package
  "math/rand"
)
func main() {
// ...
}
```

- `fmt.Printf()` prints without line break
- `fmt.Println()` prints, followed by a line break

#### Exported names
A name is exported if it **begins wiht a capital letter**. `Pi` is exported from the `math` package.

When importing a package, only exported names are accessible. `fmt.Println(math.Pi)`.

#### Functions
- type comes after the variable name
```go
func add(x int, y int) int {
  return x + y
}
```

A function can return multiple results, comma delimited. 
```go
func swap(x, y string) (string, string) {
  return y, x
}
```

Return values can be named, and treated as variables in the return specification on the function.
```go
func div10(sum int) (x, y int) {
	x = sum /10
	y = sum - x*10
	return // "naked" return, returns the current values of x and y
}
// div10(52) => 5 2
```

#### Variables
`var` statement declares a list of variables, type is last. 
```go
var c, python, java bool

func main() {
	var i int
	fmt.Println(i, c, python, java) // prints 0 false false false
}
```

An initializer assigns values: `var i, j = 1, 2` (notice type can be omitted). `=:` is the short assignment statement, used in place of `var` with implicit type declaration (only available within the scope of a func).

##### Variable Types
`bool`, `string`, `int`, `int8`, `int16`, `int32`, `int64`, `float32`, `float64` (only specify size of ints in specific uses). Zero values are assigned when there is no explicit value given:
- `0` for numerics
- `false` for bool
- `""` empty string for strings

When declaring a variable without specifying type, type is inferred based on right side value.

A **constant** is decared like variables, but with `const` keyword instead of `var`. Cannot use `:=` for constant declaration.

##### Pointers
- Pointers hold the memory address of the variable. `var p *int`.
- The type `*T` is a pointer to a `T` value. 
- The zero value is `nil`.  
- The operator `&` generates a pointer to its operand.
- No C-like pointer arithmetic

##### Structs
collection of fields. 
```go
type Vertex struct {
  X int
  Y int
}
```

- `.` is used to access struct fields. `v := Vertex{1, 2}` `v.X = 4`
  - When accessing a field, we could have struct pointer `p` and dereference `(*p).X` but syntactic sugar allows `p.X`
- A struct literal denotes a newly allocated struct value by listing the values of its fields. 
```go
var (
	v1 = Vertex{1, 2}  // has type Vertex
	v2 = Vertex{X: 1}  // Y:0 is implicit
	v3 = Vertex{}      // X:0 and Y:0
	p  = &Vertex{1, 2} // has type *Vertex
)
```

##### Arrays
`[n]T` is an array of `n` values of type `T`
- `var a [10]int`
- accessed using `a[1]`
- arrays are not resizable 
- Slicing an array with `[]T` creates a slice, dynamically sized view into the elements of an array. 
  - `var s []int = primes[1:4]` => [3 5 7]
- slices do not store memory, they reference an array
- a slice literal is like an array literal without the length
	- `[]bool{true, false, true}`
	- slice bounds can be omitted: `s = a[3:]` excludes the first 3 elements
	- `len(s)` returns current number of elements in slice, `cap(s)` returns length of array that the slice is referencing
- `range` in `for` loop iterates over a slice or a map
	- `for i, v := range pow {}` where `i` is the index, `v` is a copy of each element

##### Map
maps keys to values. Zero value of a map is `nil`. A `nil` map has no keys, keys cannot be added.
- `m = make(map[string]Vertex)` maps "strings" => a Vertex struct, if Vertex is defined somewhere
```
m["Bell Labs"] = Vertex{
	40.68433, -74.39967,
}
```

A map literal can be defined like `var m = map[string]string { "hello": "world", "other": "string" }`
- If the top-level type is just a type name (like a Vertex struct), it can be omitted from elements of the literal:
```go
var m = map[string]Vertex{
	"Bell Labs": {40.68433, -74.39967},
	"Google":    {37.42202, -122.08408},
}
```

- `m[key] = elem` updates/inserts
- `elem = m[key]` retrieves
- `delete(m, key)`
- `elem, ok = m[key]`, if `key` is in `m`, then the variable `ok` is assigned `true`
	- if `elem` or `ok` are not yet defined, use short declaration form: `elem, ok := m[key]`

##### Function Values
Functions are values too, and are able to be passed around like other values. `func compute(fn func(int, int) int) int {}`
- functions may be closures. A closure is a function value that references variables outside of its body.

## Flow Control
#### For
`for` is the only looping construct. `for i := 0; i < 10; i++ {}`. This also works: `for ; i < 10 ; {}` (some optional fields). Also `for i < 10 {}`. `for {}` is infinite loop.

#### If
`if i < 0 {}` braces around condition are optional. `if {} else {}`. You can use the short assignment statement in the if condition to assign a test value to a variable: `if v := math.Pow(x,n); v < lim { ... }` where v is now accessible within the if block.

#### Switch
```go
switch os := runtime.GOOS; os {
  case "darwin":
    fmt.Println("OS X")
  default:
    fmt.Printf("%s.", os)
}
```

Switch statement breaks after a case succeeds, read top to bottom. 

#### Defer
`defer fmt.Println("world")` prints "world" when the func returns. Deferred function calls are pushed onto a stack. 
