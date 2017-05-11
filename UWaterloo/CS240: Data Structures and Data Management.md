# [Data Structures and Data Management](https://www.student.cs.uwaterloo.ca/~cs240/s17/)
- storing, accessing, performing operations on large collections of data

### [Introduction](https://www.student.cs.uwaterloo.ca/~cs240/s17/modules/module01-2up.pdf)

#### Problem 
Given a problem instance I (input) find a solution (output with correct answer) in finite time with Size(I)

Example:
- Problem: multiply two matricies
- Instance: Two matrix inputs
- Solution: One output matrix

Running Time Simplifications

Matrix multiplcation performs in n<sup>2</sup>(n+n-1) time or O(n<sup>3</sup>) in naive implementation
- Strassen's Algorithm n<sup>log2(7)</sup>
- Le Gall n<sup>2.37</sup>

Order notation:
- f(n) in O(g(n)) if exists constants c > 0 and n<sub>0</sub> > 0 s.t. 0 ≤ f(n) ≤ c g(n) forall n ≥ n<sub>0</sub>
- O describes the set of functions asymptotically upper bounded by function g
- &Omega; describes the set of functions asymptotically lower bounded by a function g
- &Theta; describes the set of functions asymptotically equal to g
- o is describes functions strictly less than g
- &omega; is strictly greater than g
- `c` offsets a transformation of the function, while `n0` describes the "sufficiently large" factor during comparison 

"Best Case & Worst Case" refer to instances of inputs into the algorithm, but this has nothing to do with upper/lower bounds. Lets look at a contrived example:
- best and worst cases can have a range; suppose we introduce a probabilistic, nondeterministic factor (contrieved example in class)

Proof: first derive an appropriate c and n<sub>0</sub>, then show that desired relationship holds for all n ≥ n<sub>0</sub>
- 0≤2n2+3n+11≤cn2 foralln≥n0.
- exists some c > 0, and n0 > 0 s.t. 2n<sup>2</sup> + 3n + 11 ≤ cn<sup>2</sup>
- n<sup>2</sup> ≥ n forall n ≥ 1

Prove that 2010n2 + 1388n ∈ o(n3) from first principles.
- if 2010n<sup>2</sup> + 1388n in O(n<sup>3</sup>), then forall constants c > 0, exists n0 > 0 s.t. 2010n<sup>2</sup> + 1388n < cn<sup>3</sup> forall n ≥ n0
- *now we can simplify the expression by subbing n squared for n*
- 2010n<sup>2</sup> + 1388n<sup>2</sup> < cn<sup>3</sup>
- 3398n<sup>2</sup> < cn<sup>3</sup> for n ≥ 1
- 3398 < cn, n ≥ 1
- n0 > 3398/c, c > 0
- n0 = 3398/c + 1, *since n ≥ 1*
- *now prove for n ≥ n0*
- 3398 < cn
- let n = n0 + k, k ≥ 0
- 3398 < c(3398/c + 1) +ck
- 3398 < 3398 + c + ck
- 0 < 1+k, *since k ≥ 0, we can set k = 0*
- 0 < 1, *therefore true*

Now let's compare two implementations of exponentiation:
```
Bruteforce(b,x) we iteratively call ret *= b x times
Squaring(b,x) we recursively call ExpSquaring(b*b, x/2) or b*ExpSquaring(b*b, (x-1)/2)

we see that Tb(x) = x, and Te(x) = {3log2(x), 4log2(x)
```

#### Loop Analysis
Start from inner-most loop, and use &Theta;-bounds throughout to obtain a &theta;-bound for the complexity of the algorithm
- identify elementary operations of &theta;(1)
- complexity of loop is expressed as the sum of complexities at each iteration
- use maximum rules whenever to simplify: that is O(f(n) + g(n)) = O(max{f(n), g(n)})
