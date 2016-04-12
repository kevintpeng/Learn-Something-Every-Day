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
C++ *templates* are the C++ language mechanism that can be used to implement *generic* functions and classes. Type generic swap function:

```C++
template <typename T>
void mySwap(T &x, T &y){
    const T temp = x;
    x=y;
    y=temp;
}
```
Templates are expanded at compile-time.
