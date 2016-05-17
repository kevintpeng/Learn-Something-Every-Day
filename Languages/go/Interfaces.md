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

An interface value is constructed of two words of data
- one points to a method table for the value's underlying type
- one points to the actual data being held by that value

The method table or interface table, is some metadata about the types involved and a list of function pointers. 
- the interface table corresponds to the interface type, not the dynamic type

[source](http://jordanorelli.com/post/32665860244/how-to-use-interfaces-in-go)

[source](http://research.swtch.com/interfaces)
