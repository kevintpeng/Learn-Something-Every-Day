# How to use interfaces
An interface is two things: a set of methods and also a type. 
- interfaces let you use [duck typing](../Duck Typing.md) like in a purely dynamic language like Ruby but still have the compiler catch obvious mistakes like passing an `int` where an object with a `Read` method was expected
- interfaces also have dynamic type checking in addition to static
  - **Type assertions** provide access to an interface value's underlying concrete value. `t, ok := i.(T)` asserts the interface value `i` holds concrete type `T`, assigns it to `t` and returns a boolean to `ok` (Where T can be the type of interface you are trying to assert).
  - omitting the `ok` return causes it to `panic` if not type `T`

### Its methods
A core concept of Go's type system is that instead of designing our abstractions in terms of what data a type can hold, **abstractions are designed in terms of what actions a type can execute.** 
- `type Animal interface { ... }` describes the actions (methods) the type `Animal` can perform
- when creating a type, you do not explicitly state that the type is an implementation of some `interface`, it is determined automatically at compile time
  - a `type` can then implement mulitple `interfaces` 

### The `interface{}` type
`interface{}` type is *the empty interface*. It has no methods, so **all types implement the empty interface**. 
- if you write a function that takes an `interface{}` value as a parameter, it can take any value, assigning not its original type but an `interface{}` type
  - `func DoSomething(v interface{}) {...}` (performs a type conversion, `DoSomething(5)` converts `int` to `interface{}`

### The interface value & method table
An interface value is constructed of two words of data
- one points to a method table for the value's underlying type
- one points to the actual data being held by that value ( a copy of it )

The method table or interface table, is some metadata about the types involved and a list of function pointers. 
- the interface table corresponds to the interface type, not the dynamic type
  - table is not the implementor, it is the method signatures for the interface type itself
- the interface table **must be computed at runtime** because of dynamic type conversions
  - isn't reasonable to precompute all possible method tables
    - too many (interface type, concrete type) pairs
- compiler generates a type description for each concrete type, which contains a list of methods implemented
  - at runtime, interface type's method table is compared to concrete type's method table to compute the interface's method table 
  
### Pointers and Interfaces
An interface definition does not explicitly state whether an implementor should implement the interface using a pointer reciever or value reciever
- for an interface value, its underlying (concrete) type could be a pointer (and go won't complain)
  - A method signature for an implementor could change from `func (c Cat) Speak() string` to a Cat pointer: `func (c *Cat) Speak() string ` and would still be a valid implementor (potentially leading to bugs)
    - this would then only work if called by `&Cat.Speak()`
- interestingly, `&Dog.Speak()` works the same as `Dog.Speak()` if `Speak` had a value receiver
  - doesn't work the other way around, so when calling methods on an interface value, a pointer to a concrete type is more flexible
    - this is true since a pointer that is passed to a method with a non pointer parameter can dereference the pointer that is passed to get the right type to work with
    - note  a function `func (t T)MyMethod(s string)` is of type `func(T, string)`: method recievers (`T`) are passed into the function by value like any other pass by value call
  

[source](http://jordanorelli.com/post/32665860244/how-to-use-interfaces-in-go)

[source](http://research.swtch.com/interfaces)
