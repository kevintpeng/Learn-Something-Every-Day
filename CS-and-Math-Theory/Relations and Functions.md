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
weird notation, but `>` can be thought of as the set of possible ordered pairs.

#### Kinds of relations
A relation R on set A is called
- reflexive if for all a in A, aRa (true for itself)
- symmetric if for all a,b in A, aRb implies bRa
- antisymmetric if for all a,b in A, aRb and bRa implies a = b (not symmetric unless equal)
- transitive if for all a,b,c in A, aRb and bRc implies aRc
- **Equivalence relations**. A relation that is reflexive, symmetric and transitive.

**Partion** of a set A is a set X ⊆ 2^A \ {ø} s.t.
- Each a in A belongs to some S in X
- If S,T in X, either S = T or S ∩ T = ∅

Where [2^A represents the set of all subsets](Sets.md#set-of-all-subsets).

Basically, the partion of set A is a grouping of the set's elements into non-empty subsets, such that every element is included in one and only one of the subsets. Or, A is the union of all members of X, and these members are disjoint.

Now given an equivalence relations R on A, the *equivalence class* of `a` in A is defined as `R[a] = {b in A : aRb}`

**Theorem 7.3.2.** *Let R be an equivalence relation on a set A. Then `{R[a] : a in A}` is a partition of A.*

  *Proof*. Consider an equivalence relation R on A. Due to reflexivity, every element `a` in A belongs to R[a], which implies the first property of a partition. Now consider two equivalence classes R[a] and R[b]. If aRb, then for any c in R[a], by transitivity and symmetry, bRc and c in R[b]. This shows that R[a] is a subset of R[b]. We can symmetrically argue that R[b] is a subset of R[a], implying that R[a] = R[b].
  Otherwise, if a(¬R)b, then consider some c in R[a]. If c in R[b], then aRc and bRc, which implies aRb, leading to contradiction. So if R[a] ≠ R[b] then R[a] ∩ R[b] = ø. This shows second property of partition and proves the theorem.
  
