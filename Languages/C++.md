### Structs and Classes
```C++
struct Coord {
    int x,y;
};
Coord a; // struct is allocated on the run-time STACK
a.x = 3; 
Coord* p; // dynamic instantiation of struct through pointer, on the HEAP.
p->x = 4; // pointer attribute
delete p; // will persist until explicitly deleted
```
### Vectors
```C++
string v;
vector<string> s1;
s1.push_back("alpha"); // puts element at the end
s1.pop_back(v); // deletes last element, assigns to string v (optional)
s1.insert("beta"); // inserts element
```

### Reference parameters
Regular parameter passing is call-by-value. C++ can pass a reference without passing a pointer itself:
```C++
void swap(int& x, int& y);
```
Reference Parameters vs. Pointers
```C++
// Common usage
void GiveRaise1 (Employee e, int raise) {} //


// Uncommon
```
### Object-Oriented Programming
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
Balloon::Balloon(string colour) : ParentClass(), colour(colour) {}     
// shorthand syntax, stops double instantiation of object parameters, calls parent constructor

Balloon::~Balloon (){}     // destructor
```

### Templates
C++ *templates* are the C++ language mechanism that can be used to implement *generic* functions and classes. Templates are expanded at compile-time. Vector<int> is an example where vector the defined container for any generic type. 

#### Function Template
```C++
template<class type> ret-type func-name(parameter list){
    //body
}
```

Type generic swap function:

```C++
template <typename T>
void mySwap(T &x, T &y){
    const T temp = x;
    x=y;
    y=temp;
}
```

#### Class Template
```C++
template<class type> class class-name {
    // class content
};
