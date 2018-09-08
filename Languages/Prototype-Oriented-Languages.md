# Prototype Based Programming -- [source](https://en.wikipedia.org/wiki/Prototype-based_programming)
Rather than classes, prototype-oriented languages do inheritance by copying another object (the prototype) and adding attributes and methods to it; objects inherit from other objects. 
- Objects are generally completely mutable during runtime, unlike many class based object-oriented systems like Ruby. 
- generally interpreted and dynamically typed
- objects inherit directly from other objects through a prototype property
- object contruction can happen **ex nihilo** or through **cloning**

**Delegation** is a language feature. Delegates are like function pointers, allowing you to invoke a piece of code that is not known until runtime.
- in languages that use delegation, the runtime is capable of dispatching the correct method by following a series of delegation pointers from object to its prototype until a match is found

In **pure/concatenative** prototyping, there are no pointers to the prototype
- changes to the prototype are not reflected in the cloned objects
