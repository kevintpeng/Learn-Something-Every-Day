# Errors
Go has a built-in `error` type. 
- `error` values are used to indicate abnormal state

### `error` type
```go
type error interface {
    Error() string
}
```

`error` is an interface type. An `error` var represents any value that can describe itself as a string.
- error is predeclared in the universe block
- most commonly used implementation of the `error` interface is the `import "errors"` package's unexported `errorString` type

```go
// errorString is a trivial implementation of error.
type errorString struct {
    s string
}

func (e *errorString) Error() string {
    return e.s
}
```

