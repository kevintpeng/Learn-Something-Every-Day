# [Data Structures and Data Management](https://www.student.cs.uwaterloo.ca/~cs240/s17/)
- storing, accessing, performing operations on large collections of data

### Summary
- for exists proofs, we can keep using the properties of inequalities to simplify the statement

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

### [Priority Queue](https://www.student.cs.uwaterloo.ca/~cs240/s17/modules/module02-2up.pdf)
Priority Queue is an ADT with a collection of items (associated with a priority) 
- insert: with tagged priority
- deleteMax: remove the item with highest priority

**Heaps** are a type of binary tree. A **max-heap** has additional properties:
- heaps are balanced & left justified
- heap-order proerty says that any node's children have equal or lower priority
- since the height of a heap is &Theta;(log n), then insertion and deletion operations are also O(log n)
- our insert will simply add the element in the last slot, then "bubble up"
- our delete will shift the last element into the first slot, then perform swaps again by "bubble down"

# Sorting and Randomization
- kth element in the array in not easy; we need to manipulate to get it
- for a given element, it is easy to find it's index if the array was sorted in O(n)
- quick select uses this intuition; pick a pivot, and restructure the array by partitioning, then the pivot is in it's correct place
  - assuming all n! permutations are equally likely, average cost is the sum of costs for all permutations, divided by n! 
  - T(n,k) is the average cost for selecting the kth item from size n
  - general case: i is the index of our pivot in a sorted array, (n-1)! are the total number of possible positions once we've selected our i. throwing away i+1 elements after partitioning
  - below, we've described below as 
  <img width="696" alt="screen shot 2017-05-25 at 10 12 25 am" src="https://cloud.githubusercontent.com/assets/7998752/26453725/b9a3b52c-4132-11e7-8cc6-a746d643de26.png">

### Randomized algorithms
- relies on some random numbers, from a PRNG, a deterministic program that uses a true random seed
  - the goal is to have a uniform distribution over our desired range, while making the period of repetition large enough that it is negligable 
- basic example: Von Neumann 1946 "Middle squared method", takes a seed of 4 digits, squares it, pad/truncate to get an 8 digit, then return
- *the motivation is that we don't have control over input (bad instances), but we can control the random numbers, to shift the probability distribution from what we can't control*

Average vs expected running time
- the **Expected running time** of a randomized algorithm for a particular input I is the "expected" value of T(I,R)
  - for T, calculate the sum of T(I,R) • Pr[R] (think weighted average) and assuming uniform distribution of R, we get simply the mean runtime across all R
- the motivation behind randomized quickselect is that we have a very small chance of sorting an array by shuffling (2/n!) 
  - first idea: *sorted arrays are worst case for quickselect since we select element 1 and never have a left partition, so O(n^2)*
  - second idea: randomize the pivot, by choosing a random pivot
- Worst-case linear time partitioning called "medians-of-five" for pivot select. Partition into groups of five, find each median and take the median of medians, then we can say in &Theta;(n) run time the number that is highly probable to be close to the actual median 
  - mutually recursive, and can be shown to be &theta;(n) notice they call each other recursively

*Quick Sort vs Merge Sort, quick sort has a slower worst-case, but under expected case, they are comparable. But quick sort retains order and is an in place sorting algorithm*

Tail call elimination can be done using loops to reduce the number of stack frames, and optimized further by only recurising on the smaller partition

*Tutorial*: if A is a partial sorted array where n^k elements are already sorted, 0 < k < 1, then we can sort the remaining elements in &Theta;(n) time. First use merge-sort in &Theta;(n^k log (n^k)) = &Theta;(kn^k log n) = &Theta;(n^k logn) in o(n) since log n is smaller than n^c for any c > 0 and since k < 1.

Consider Stooge Sort: partition sort by thirds. The sort A1 U A2, sort A2 U A3, then finally resort A1 U A2. By the algorithm, we know the recurrence is 

T(n) = 
- &Theta;(1) if n=1 or n=2
- 3T(2n/3) + &Theta;(1) if n ≥ 3
  - three sub problems, of size 2n/3
- simplifies to 3^k T((2/3)^kn) + d•3^i, i from 0 to k-1
- we need log base (2/3)^k n = 1, 3/2 n = K recurences to reach the base case
- 3^k T(1) + d(3^k - 1/2)
- &Theta;(3^k) or ~ O(n^2.71)

Consider Bogo sort. We want the expected case running time. To do so, take a probabilistic approach: `T(n) = 1cn + (1/n!)d + (1-1/n!)T(n)`. Note that this is a probabilistic analysis, so each coefficient is just a probability. 1cn is 100% chance to shuffle n object and check n objects if they're sorted.
- T(n) = cn + (1/n!)d + (1 - 1/n!)T(n)
- T(n) = n!(cn) + d
- T(n) in &Theta;(n•n!)
