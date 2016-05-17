# Method Lookup
**Virtual Method tables** are a mechanism to support dynamic dispatch.
- Languages with methods typically either prepare tables for all the method calls statically (C++, Java) or do a method lookup at each call (Smalltalk, Python, Ruby?) with caching for efficiency.
- Go computes the method tables at runtime 
