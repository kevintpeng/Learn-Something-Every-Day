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

