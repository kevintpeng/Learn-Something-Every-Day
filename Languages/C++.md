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
