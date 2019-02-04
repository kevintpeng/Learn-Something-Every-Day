# [Task-based asynchronous programming (C#)](https://docs.microsoft.com/en-us/dotnet/csharp/async)
Programming paradigm, using `Task<T>` objects
- similar to futures/promises
- `async` keyword is used to declare an asynchronous function, which runs alongside the caller
  - can return a `Task`, `Task<T>` or `void` (async event handler, I guess background work where you don't need a response)
  - useful for possibly blocking routines (like something that must wait for a response over a network)
  - an async function runs until it has no more work to do (`await`ing some data to return back)
  - as soon as the `await`ed data is ready, resume the async function and compute/set the result in its Task, marking it completed
- `await` unwraps a `Task<T>` object, while giving control back to the caller
- for I/O bound code, `await` an `async` operation that returns a `Task<T>` 
- for CPU-bound code, `await` an operation which was started on a background thread with `Task.Run`
- `Task.Run` takes a `Func<Task>`
  - `Func<TResult>` is just a lambda (in this case it can be used as a closure)
  - `delegate` keyword can be used to declare a type (class?) which can point to a function
  - `Func<bool> methodCall = a.mymethod;` is an example of defining a delegate without the `delegate` keyword
