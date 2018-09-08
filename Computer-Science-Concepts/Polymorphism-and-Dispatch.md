# Polymorphism
The act of providing a single interface to entities of different data types (objects for example). A **polymorphic type** is a data type whose operations can also be applied to values of some other type.

### Ad Hoc Polymorphism 
Where polymorphic functions can be applied to arguments of different types (often through function overloading). `+` can be used like `1 + 3.7 = 4.7` or `int + float = float`. It also overloaded in some languages to do `"bab" + "oon" = "baboon"`.

### Parametric Polymorphism
Non type specific code, called *generics*. 

### Subtyping
When a name denotes instances of many different subclasses of a superclass (polymorphism in OOP). 

# Dynamic Dispatch
A feature of The process of selecting which implementation of a polymorphic operation to call at run time. A prime characteristic of object oriented programming languages. It is desirable to name multiple methods with the same name, whose functionality is similar, but operate on multiple types. 

*Static dispatch*, the implementation of a polymorphic operation is selected at compile-time. Dynamic dispatch provides support for cases where the appropriate implementation cannot be determined at compile time, because it depends on the runtime type.

### Single and Multiple Dispatch
The decision of which version of a method to called can be based on a single object or many objects. **Single dispatch** is supported by OOP languages like smalltalk, C++, ruby, where the object itself. Multiple dispatch is a generalized form of single dispatch, where functions are dispatched based on multiple objects.

