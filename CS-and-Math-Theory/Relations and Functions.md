## Relations and Functions
#### Ordered Pairs
Sets disregard order of set elements. *Ordered pair* of two elements x and y,
```
(x,y) = (u,v) iff x = u and y = v.
```
Can be extended to *ordered n-tuple* for n elements.

Given two sets A and B, their *cartesian product* `A x B` is the set of all ordered pairs (x,y) s.t. x in A and y in B:
```
A x B = {(x,y) : x in A, y in B}
A^2 = A x A = {(x,y) : x,y in A}
A^n = {(x1,x2,...,xn) : x1,x2,...,xn in A}
```
R^2 and R^n are examples of cartesian planes. 

#### Relations 
For set A, *a relation on A* is some property that is either true or false for any ordered pair (x,y) in A^2. Greater than `>` is a relation on Integers. For example, `>` is true for (3,2) but false for (2,2).

For relation `>` on the set `{1,2,3}`:
```
> = {(3,2),(3,1),(2,1)}
```

#### Kinds of relations
A relation R on set A is called
- reflexive if for all a in A, aRa
- symmetric if for all a,b in A, aRb implies bRa
- antisymmetric if for all a,b in A, aRb and bRa implies a = b
- transitive if for all a,b,c in A, aRb and bRc implies aRc
