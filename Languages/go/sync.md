### [Mutexes](../../Computer-Science-Concepts/Mutual Exclusion.md)
Mutexes allow safe access of state across multiple goroutines. If one goroutine is r/w to a var, other goroutines are mutually excluded from accessing it.
- `var m = &sync.Mutex{}`
- goroutines must have access to the same mutex to lock properly
- goroutine will block if the mutex is locked, and unblock when mutex is unlocked
  - race conditions can still occur if the var is accessed without mutex protection
- mutexes can be embedded in structs:
```go
type currency struct {
  sync.Mutex
  amount float64
}
func (c *currency) Add(i float64) {
  c.Lock()
  c.amount += i
  c.Unlock()
}
```
- `defer c.Unlock()` is useful if a function contains multiple return statements
- Read Write Mutexes allow multiple readers to hold the lock, still only one writer
  - `snyc.RWMutex`, with `m.RLock()` and `m.RUnlock()`
