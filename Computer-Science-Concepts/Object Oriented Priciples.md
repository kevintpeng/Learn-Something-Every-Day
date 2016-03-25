# Object Oriented Programming
## OO Terminology
**Member Variable field**:
- an instance variable (one per instance of class)
- A class/`static` variable (one per class)

**Member Method**:
- instance method (operates on `this` (C++/Java) or `self` (python, Ruby) object 
- class/`static` method (called on the Class, not instance)

- Instance variables are created for each instance object
- A `static` variable or class variable only exists once.
- `static` members track meta-data about classes

### Copy Constrcutor
Takes a `const` ref to existing object, creates a new copy of it as a new object:
```C++
Classname::Classname( const Classsname & c);
```
There is an implicit default copy constructor predefined for every class, it performs a memberwise copy construction, for every subpart of Classname.

**Rule of 3**: if your class needs to override the default implementation of any of the destructorm copy constructor or `=` operator, then it should be explicitly defined for all three.
