# Go
Go is a portable language, well catered for small tasks. In comparison to ruby, go has less overhead for simple low level tasks. Go is good for concurency.
- Go is a C-like language, also comparable to Java
- Go programmers keep all code in a workspace
- A workspace contains many version control repos
- each repo contains ≥ 1 packages
- each package consists of ≥ 1 go source files in a single directory
- path to a package's directory determines its import path

### Packages
Every go project is made up of packages. Prgrams start running in package `main`. The package name is same as last element of the import path (`math/rand` has `package rand`).

Individual statement: `import "fmt"`. Factored import statement: 
```go
package main

import (
  "fmt"
  "math/rand"
)
func main() {
}
```

#### Exported names
A name is exported if it begins wiht a capital letter. `Pi` is exported from the `math` package.

When importing a package, only exported names are accessible. `fmt.Println(math.Pi)`.
