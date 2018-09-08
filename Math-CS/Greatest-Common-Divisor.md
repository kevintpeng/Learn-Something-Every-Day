# Greatest Common Divisor 
Integer d > 0 is the **Greatest common divisor** of a and b, d = gcd(a,b), iff

1. `d|a and d|b` (divisor)
2. `for c|a and c|b, then c ≤ d` (greatest)

### GCD With Remainder
For a = bq + r, then gcd(a,b) = gcd(b,r)

*Very useful for calculating GCDs, and proving values of GCDs. Repeated use becomes Euclidean Algorithm.* 

1. show that for d = gcd(a,b), d|b and d|r
  - d|b by definition, r = qb - a. By DIC, d|(qb-a) => d|r
2. show that for all c|b, c|r, c ≤ d.
  - by DIC, c | b(q) + r(1), a = bq+r so c|a
  - now c|a and c|b, since gcd(a,b)=d, by definition, c ≤ d

### GCD Characterization Theorem (GCD CT)
If d is a common divisor of a and b and ax + by = d has an integer solution, then d=gcd(a,b)

*This shows that any combination of a and b can only be equal to multiples of the gcd.*
### Extended Euclidean Algorithm (EEA)
If d = gcd(a,b), then there exist x,y s.t. ax + by = d

*Useful for rewriting gcds in equations*

#### Coprimeness and Divisibility (CAD)
a and b are coprime if gcd(a,b)=1. If c|(a•b), then c|a or c|b

#### Primes and Divisibility (PAD)
If p is prime, and p|ab, then p|a or p|b

#### GCD of One
gcd(a,b)=1 iff there exists x and y with ax + by = 1

*GCD CT for d = 1*. 

#### Division by GCD
if d = gcd(a,b) then gcd(a/d, b/d) = 1

*If this wasn't the case, then there would be a larger common divisor than d*

### Primes
An integer p > 1 is *prime* iff its only divisors are 1 and p.

#### Infinitely Many Primes
By induction, there are infinitely many primes.

#### Fundamental Theorem of Arithmetic (UFT)
Every integer can be uniquely expressed as a product of primes.

#### 
