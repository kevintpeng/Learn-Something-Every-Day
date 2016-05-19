# Anonymous Functions
Anonymous functions are function definitions that are not bound to an identifier. 
- are often arguments being passed to higher-order functions
- used for constructing result of a higher-order function that returns a function

It is syntactically lighter than a regular function, for one-time use functions.

# Closure
Closures are a technique for implementing lexically scoped name binding in languages with first-class functions.
- a closure is a record storing a function together with an environment

```go
func intSeq() func() int {
    i := 0
    return func() int {
        i += 1
        return i
    }
}
```
A function that returns another function that *closes over* the variable `i` to form a **closure**.
- the value of `i` persists in the environment defined by `intSeq()`
