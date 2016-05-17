# How to use interfaces
An interface is two things: a set of methods and also a type. 
### Its methods
A core concept of Go's type system is that instead of designing our abstractions in terms of what data a type can hold, **abstractions are designed in terms of what actions a type can execute.** 
- `type Animal interface { ... }` describes the actions (methods) the type `Animal` can perform
- when creating a type, you do not explicitly state that the type is an implementation of some `interface`, it is determined automatically at compile time
  - a `type` can then implement mulitple `interfaces` 
[source](http://jordanorelli.com/post/32665860244/how-to-use-interfaces-in-go)
