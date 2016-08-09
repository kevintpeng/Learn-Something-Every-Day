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
weird notation, but a relation can be thought of as the set of possible ordered pairs that satisfy `>`.

#### Kinds of relations
A relation R on set A is called
- reflexive if for all a in A, aRa (true for itself)
- anti-reflexive if for all a in A, a/Ra (aRa is false)
- symmetric if for all a,b in A, aRb implies bRa (`=`)
- antisymmetric if for all a,b in A, aRb and bRa implies a = b (not symmetric unless equal, ≤)
- transitive if for all a,b,c in A, aRb and bRc implies aRc
- **Equivalence relations**. A relation that is reflexive, symmetric and transitive.

**Partion** of a set A is a set X ⊆ 2^A \ {ø} s.t.
- Each a in A belongs to some S in X
- If S,T in X, either S = T or S ∩ T = ∅

So, a partition of a set S is a collection of nonempty subsets A1, A2, ... with **no overlaps** (Ai and Aj are pairwise disjoint for all i ≠ j), and **union of all A is S**>

Where [2^A represents the set of all subsets](Sets.md#set-of-all-subsets).

Basically, the partion of set A is a grouping of the set's elements into non-empty subsets, such that every element is included in one and only one of the subsets. Or, A is the union of all members of X, and these members are disjoint.

Now given an equivalence relations R on A, the *equivalence class* of `a` in A is defined as `R[a] = {b in A : aRb}`

**The Fundamental Theorem: Equivalence relations and partitions.** *Let R be an equivalence relation on a set A. Then `{R[a] : a in A}` is a partition of A.*

The set of distinct equivalence classes forms a partition of S.

Given a partition of S into sets A1, A2, ... An, the relation defined by `xRy iff x and y belong to the same set A from the partitions` is an equivalence relation on S.

  *Proof*. Consider an equivalence relation R on A. Due to reflexivity, every element `a` in A belongs to R[a], which implies the first property of a partition. Now consider two equivalence classes R[a] and R[b]. If aRb, then for any c in R[a], by transitivity and symmetry, bRc and c in R[b]. This shows that R[a] is a subset of R[b]. We can symmetrically argue that R[b] is a subset of R[a], implying that R[a] = R[b].
  Otherwise, if a(¬R)b, then consider some c in R[a]. If c in R[b], then aRc and bRc, which implies aRb, leading to contradiction. So if R[a] ≠ R[b] then R[a] ∩ R[b] = ø. This shows second property of partition and proves the theorem.

**Order Relations:** A relation that is reflexive, antisymmetric and transitive called a **partial order**. `≤`, `≥` on Integers, and subset relation on the powerset 2^A, are familiar partial orders.

A pair of elements can be *incomparable* with respect to a partial order. Divisibility `|` is a partial order on Integers, but 2 doesn't divide 3 and 3 doesn't divide 2.

A set A with a partial order on A is called **partially ordered set** or a **poset**.

A relation R on A is a **total order** if it is a partial order s.t for all a,b in A,  `aRb OR bRa` is true. The relations ≥, ≤ are total orders on Real Numbers, but `|` is not a total order on Integers.

A **strict order** on A is a relation R s.t.
- For all a,b,c in A, aRb and bRc implies aRc. (Transitivity)
- Given a,b in A, exactly one of the following holds: aRb, bRa, a = b.
- `<` and `>` are relations that are examples of strict orders.

#### Functions
A special kind of relation.
*Given two sets A and B, a function ƒ : A -> B is a subset of Ax B s.t.*
 - If x in A, there exists y in B s.t. (x,y) in ƒ. (everything in A should map to something in B)
 - If (x,y) in ƒ and (x,z) in ƒ, then y = z. (think back to vertical line test, uniqueness)

A function is a *map or mapping*. The set A is the domain and B is the codomain of ƒ. This defines functions as the set of all pairs (x, f(x)).

Set of f(A) = {f(x) : x in A} is the **range** of ƒ. Range is a subset of the codomain. If f(A) = B (function maps to exactly the codomain) then ƒ is *surjective* or *onto* if each element of B is of the form f(x) for at least one x in A.

A function is *injective* if for all x,y in A, f(x) = f(y) implies x = y.

A function is *bijective* if each element of B is of the form f(x) for exactly one x in A.

##### First-class and higher-order functions
Higher-order functions take other functions as arguments or return them as results. In calc, the differential operator `d/dx` is an example since it takes a function.

Highly related, a first-class function also take and output functions. Distinction : "higher order" describes a math concept of functions that operate on other functions, "first-class" is a CS term for entities in a programming language that have no restriction on their use.

**One application is currying (partial application)**, a technique where a function is applied to its arguments one at a time and each argument returns a new function that accepts the next argument.

##### Pure functions (expressions)
No side effects from state (memory or I/O).
- If the result of a pure function is not used, it can be removed
- A pure function will always return the same value given same inputs (leads to memoization)
- if there is no data dependency, expressions can be reversed or performed in parallel (thread-safe)
