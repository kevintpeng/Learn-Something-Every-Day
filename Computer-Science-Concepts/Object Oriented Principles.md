# Object Oriented Programming
Object based programming forces the programmer to think about designing clean API for clients and allows hiding implementation. Adds **inheritance** which is the creation of subclasses who share an API with the superclass.

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

## Inheritance
A hierarchy of classes that share functionality and API.

### Abstract Base Class
Cannot be instantiated, contains many virtual methods, so that children (inheritance) have consistent API for polymorphism

A Polymorphic container:
```C++
vector<Humanoid*> humanoidList;
// pointers of a parent class can point to an instance
Humanoid *p = new Elf ("Elrond"); 
Dwarf *d = new Dwarf("Gimli"); // static pointer, pointing to its type
Monster *m = NULL; // dynamic pointer, currently pointing to nullptr
```

`Protected` describes private elements, available to children. ABCs should have constructors in protected, ABCs need ctors for children to be instantiated

### [Polymorphism](Polymorphism and Dispatch.md)
A benefit of inheritance, the ability to treat all subclasses in similar ways (a unified API), e.g. all `Shapes` can use `.area()`. This is an example of subtype polymorphism (see link).

## Some C++ Object Oriented Programming

Syntax is well explained using code:
```C++
Balloon b;
Balloon *pb = new Balloon;
class Balloon : public ParentClass{     // class declaration, with parent, in .h file
    public:
        Balloon(); // constructor
        Balloon(string colour); // constructor with parameter
        virtual ~Balloon();     // allows for redefinition in derived classes
        getColour() const ; // constant method, cannot change object
        static balloon_counter; // class variable
    private:
        string colour;
};
// Method definitions, in .cc file
Balloon::Balloon () {
    this->colour = “clear”;
}
Balloon::Balloon (string colour){
    this->colour = colour;
}
Balloon::Balloon(string colour) : ParentClass(), colour(colour) {}     // shorthand syntax, stops double instantiation of object parameters, calls parent constructor

Balloon::~Balloon (){}     // destructor
```

### Copy Constrcutor
Takes a `const` ref to existing object, creates a new copy of it as a new object:
```C++
Classname::Classname( const Classsname & c);
```
There is an implicit default copy constructor predefined for every class, it performs a memberwise copy construction, for every subpart of Classname.

**Rule of 3**: if your class needs to override the default implementation of any of the destructorm copy constructor or `=` operator, then it should be explicitly defined for all three.

### Destructor
Handles freeing memory, and is *implicitly* called when an objects scope is exited or `delete` is called on object.
- Says what happens to heap-based sub parts of object.
- good practice to log what happens in dtor

### Sharing Objects
1. Objects to be shared should be declared on the heap using a ptr.
2. Need clear "owner", who is responsible for deletion in dtor.
3. "owner" needs protocol for transferring ownership.
 
### Generics and Templates
C++ *templates* are the C++ language mechanism that can be used to implement *generic* functions and classes. Type generic swap function:

```C++
template <typename T>
void mySwap(T &x, T &y){
    const T temp = x;
    x=y;
    y=temp;
}
```
