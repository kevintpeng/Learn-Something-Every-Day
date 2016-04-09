## CS 137
Operator Table

precedence  |  operator     |   associativity
---- | ----- | ----
1   |     ++,-- (post)  |  left
2   |     ++,-- (pre)   |     left
    |    +,- (unary)     |   right
3   |     *,/,%         |   left
4   |     +,- (binary)  |   left
5   |     =,+=,-=,*=,/= |   right

Left Associativity
- i-j-k ⇔ (i-j)-k
- i*j/k ⇔ (i*j)/k

Right Associativity
- a=b=c ⇔ a=(b=c)
- ex: 3+b- ++c ⇔ (3*b) -(++c)
- a+=b+=c ⇔ a+=(b+=c)

Logical Expressions
in C: false = 0, true = non-zero
- relational operators: <,>,>=,<=
- equality operators: ==, !=
- logical operators: !, &&, ||
- && and || use short-circuited evaluation, evaluate the left operand and only evaluates the right operand if needed

operator  |  precedence         |   associativity
---- | ----- | ----
!     |   same as unary     |   right
relational |    lower than arithmetic |   left
equality  |  lower than relational   | left
&&, \|\|  |  less than equality  |  left

## Assertions
An assertion is assumed to be true at any given point in a program.
```
#include <assert.h>

bool leap(int year){
    assert(year>1573); //if true, continues. if false, terminates program
                 //with a message stating file name, line #, function 
 //name and expression. Mostly for debugging.
    if(year % 400 ==0)
}
```

## Separate Compilation
e.g.  power.c
```C
int square(int num) {return num*num;}

main.c
#include <stdio.h>
int square(int num); //function declaration, with no definition

void testSquare(int num){
    printf(“%d^4 = %d\n”, num, square(num));
}
int main(){
    testSquare(4);
}
```
`$ gcc -o powers main.c power.c`

order doesn’t matter. Links files together.

### Header Files
- declare functions
- contains include guards 
e.g.  powers.h
```C
    #ifndef POWERS_H //if not defined    
                //That prevent double declaration of any identifiers 
such as types, enums and static variables
    #define POWERS_H
    int square(int num);
    #endif
    
    main.c
    #include <stdio.h>
    #include “power.h” // convention for non-standard libraries
```

## Sieve of Erotosthenes
- calculate all primes up to n (upper bound)
- create a table from 2 to n
```
while i <= sqrt(n)
i is the first number not removed
remove all multiples of number
```

## SORTING!
#### Insertion Sort
```
  for 2..n 
    move element left into sorted section until the the left is smaller
```
- Good when almost sorted

#### Selection Sort
```
  for 1..n
    iterate through all remaining elements for smallest and swap with current
```

Always quadratic, but minimizes swaps    

#### Bubblesort
```
  for i=1..n
    for j=n..(i+1)
      if a[j] < a[j-1] swap
    if no swaps, finished
```
Best case O(n) linear

#### Naive Quicksort
- choose random pivot, swap with start
- partition array, [<p | p | >p]
- recurse until sorted
```
# choose pivot
swap a[1,rand(1,n)]

# 2-way partition
k = 1
for i = 2:n, if a[i] < a[1], swap a[++k,i]
swap a[1,k]
→ invariant: a[1..k-1] < a[k] <= a[k+1..n]

# recursive sorts
sort a[1..k-1]
sort a[k+1,n]
```

