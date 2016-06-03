### Defer
1. A deferred function's arguments are evaluated when the defer statement is evaluated.
2. Deferred function calls are executed in Last In First Out order after the surrounding function returns (stack).
3. Deferred functions may read and assign to the returning function's named return values.

### Panic & Recover
- Panic is a builtin function that stops flow, and starts panicking. 
- Recover is only useful in deferred function, captures value given to panick and returns to regular flow.
