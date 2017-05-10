# [CS247: Software Engineering Principles](https://www.student.cs.uwaterloo.ca/~cs247/current/general.shtml)
Software Engineering is a collection of practices and priciples, tools, techniques, etc. that aims to:
- imporve software quality
- improve developer productivity
- `g++ -5 -std=14 -Wall`
- overloading vs overriding

### [ADT Design](https://www.student.cs.uwaterloo.ca/~cs247/current/Lectures/02ADTDesign-1up.pdf)
- user defined type, bundles together the range of possible values stored, and operations that can manipulate the varible
- provides compiler ways to perform type assertions at compile time
- allows implementations to be swapped out without affecting code

#### Operator Overloading

C++ 11 introduced "move" semantics
- compilers have return value optimization, saving the cost of a copy, when returning a temporary object, holding a function return value
  - copies can be expensive for large objects (omiting storage of temp object)
- move constructor subroutine

#### Non-member
A Non-member function is a critical function of the ADT that is declared outside of the class
- reduces the number of functions with direct access to private data members
- streaming operators `<<` and `>>` act on the stream object, returning a modified stream so that operations are chained
```cpp
// this friend function is a problem! If the implementation changes, this needs to as well!
ostream& operator<< (ostream &os, const Rational &r) {
  const char slash = '/';
  os << r.numerator_ << slash << r.denominator_;
  return os;
}

istream& operator>> (istream &is, RationalNumber &r) {
  int num, den; char slash;
  is >> num >> slash >> den;
  if (is.fail()) return is;
  r = RationalNumber(num, den);
  return is;
}
```

What has to be a member?
- accessors + mutators, constructors, destructor, copy/move
- assignment, [] 
- virtual methods

What cannot be a member?
- I/O operations, or operations that don't want first argunment to be the class type 
  - think stream operations and type conversions
  
We always prefer non-member and non-friend
- less code affected when implementations change
- more secure since they are forced to use accessors & mutators

#### Type Coversions
Type conversions will lose private data

How does a compiler find a conversion function?

1. with exact matches
2. lossless conversion via "promotion" (bool to int, char to int, float to double)
3. standard converson (double to int)
4. user-defined conversions

We have defined some level of precedence, but if there are two or more matches at the same level, the compiler will throw an error because the choice is ambiguous
- if one function is better for at least one argument, and same for the rest, then it will win

Implicit Type Conversions:
```
class X { public: X(int); X(string) };
class Y { public: Y(int) };
class Z { public: Z(X); };
X f(X);
Y f(Y);
Z g(Z);
X operator+ (X,X);

// now for resolution:
strings { "MACK" };
f(X(1)); // X(1) give X; f recieves X and outputs X; OK
f(1); // ERROR: f is looking for X type, not int
g(X(s)) // OK
g(Z(s)) // OK
```

Header file is effectively global
- .cc has a namespace. If you leave it blank `namespace { //functions }` then it's anonymous
- we can hide helper methods best in here
- should not pollute the global namespace

Apply the `override` keyword as a sanity check, so that the compiler can catch it

`final` says you cannot override in a derived class

#### **Attribute-based ADTs** 
are primarily composed of "virtual data members", accessors and mutators (focused on the information in it)
- all other functions are non-members
- easier to write the contract for the ADT
- virtual data members might not have actual storage, since it could be a computed attribute
- attributed based ADT design overall provides safety through enforcing legal value ranges
- compiler reports type incompatibilities 
- efficiency; only areas we need to check for legal values are: constructors and mutators (both member and nonmember)

### Value vs. Entity Objects, Information Hiding
**Entity** has a unique identity (but may have same data), and thus objects are not equal, even with same attribute values
- has a lifespan/continuity, changes over time

**Value** object represents a value of an ADT, managing data and immutability
- faked in C++ by returning a new object by value 
  - over-write/std::move content instead of modifying "this"
  
#### Design of Entity ADTs
An operation on an enitity object should reflect a real-world event
- copying & converting an entity is not meaningful
- equality
- computation on entities are not meaningful; overloading operators should be avoided

Example: Card game 
- Score is a value
- Hand is entity
- Player is entity
- Deck is entity
- Card is value (or could be an entity if you want it to exist in a certain deck and location, if we consider repeatability)

Mutable Value-based ADTs like Dates can be problematic if they can be referenced from two variables
- references/pointers to the object should never be returned, so make a deep copy when returning
- we could remove all mutators to make an object immutable
- we could make all data members private
- could ensure class cannot be derived from "final" or make methods final

```C++
// fake deep copy + over writing original object data via operator "="

class X {
  public:
  X(const X&) = delete;
  X& operator=(const X&) = delete;
} // how to disable C++11 and up
```

- **Singleton Design Pattern** ensures that exactly one object of our ADT exists
- **PImpl Idiom** encapsulates the data representation in a nested private structure (which can be in a separate file)

```
class Rational::Impl {
  int numerator_, denominator_; // private data fields
  public:
    Impl(int n, int d): numerator_ {n}, denominator_ {d} {} // ...
}

Rational::Rational(int n, int d): // start initializer list
  rat_ {new Rational::Impl {n,d} {
  if(d==0) throw "Panic, denominator=0";
  }
```

### Special Member Functions
Member functions are provided by default by the compiler
- move assignment, we don't return things by reference
- Rvalue references are a new category of reference variables 
- usaully overwriting something completely
- since we're stealing things, the thing we're getting information from is not a constant
