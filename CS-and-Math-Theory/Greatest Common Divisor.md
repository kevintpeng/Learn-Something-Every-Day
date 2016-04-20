# Greatest Common Divisor 
Integer d > 0 is the **Greatest common divisor** of a and b, d = gcd(a,b), iff

1. `d|a and d|b` (divisor)
2. `for c|a and c|b, then c ≤ d` (greatest)

#### GCD With Remainder
For a = bq + r, then gcd(a,b) = gcd(b,r)

#### GCD Characterization Theorem (GCD CT)
If d is a common divisor of a and b and ax + by = d has an integer solution, then d=gcd(a,b)

#### Extended Euclidean Algorithm (EEA)
If d = gcd(a,b), then d can be computed and there exist x,y s.t. ax + by = d

#### Coprimeness and Divisibility (CAD)
a and b are coprime if gcd(a,b)=1. If c|(a•b), then c|a or c|b

#### Primes and Divisibility (PAD)
If p is prime, and p|ab, then p|a or p|b
