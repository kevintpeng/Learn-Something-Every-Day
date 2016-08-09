## Congruence
Definition: Let a,b be integers, n is a Natural number. Then a is congruent to b modulo n iff n | (a-b).

*Or "b is the remainder when you do integer division of a % n".*

*Then if a ≡ 0 (mod m) then n divides a.*

#### Congruence is an Equivalence Relation (CER)
Let n be Natural. Let a,b,c be Integers. Then
- a ≡ a (mod n)
- a ≡ b (mod n) => b ≡ a (mod n)
- (Transitivity) a ≡ b (mod n) and b ≡ c (mod n) => a ≡ c (mod n)

#### Properties of Congruence (PC)
If a ≡ a' (mod m) and b ≡ b' (mod m) then

1. a + b ≡ a' + b' (mod m)
2. a - b ≡ a' - b' (mod m)
3. ab ≡ a'b' (mod m)
4. If a ≡ b (mod m) then a^k ≡ b^k (mod m)

*The past two theorems basically state that a ≡ b is a "kind of" equality between a and b in modulus m.*

#### Congruence and Division (CD)
If ac ≡  bc (mod m) and gcd(m,c) = 1, then a ≡ b (mod m)

*This is stating that if gcd(m,c)=1, then c is unique in modulus m.*

#### Congruent iff Same Remainder (CISR)
a ≡ b (mod m) iff a and b have the same remainder when divided by m.

*States the property of the modulus operator `%`*

## Linear Congruences
*Solving linear equations in modulo m. Some linear congruences have no solution, dependent on their gcd.*

#### Linear Congruence Theorem 1 (LCT 1)
Let gcd(a,m) = d ≥ 1. The equation ax ≡ c (mod m) has a solution iff d | c.
If x0 is a solution, the complete solution is x ≡ x0 (mod m/d)

*If the coefficient of x divides m, then x is multiplied by 0 and has no solution when c is not congruent to 0.*

*There are d solutions modulo m. When gcd(a,m)≠1, then the range (set of possible values of ax) is restricted (less than m).*

## Relating Everything
(GCD CT) If `ax + by = d` has a soltuion, and d is a positive common divisor of a and b, then `gcd(a,b)=d`. 

Reversing, we know that if (EEA) `gcd(a,b)=d`, then there is a solution to `ax + by = d` that can be computed with EEA. `ax + by = d` is a linear diophantine equation. Extending this, `ax + by = c` has a solution iff `d|c`. This can be expanded to describe a class of solutions: `x0 + (b/d)n, y0 - (a/d)n`.

*gcd is a restricting factor in solutions to LDE.* This extends to linear congruences, since linear congruences are another way to express LDEs. LCT1 and 2 show the number of possible solutions to any linear congruence equation.

#### Fermat's Little Theorem
If p is prime, p doesn't divide a, then `a^(p-1) ≡ 1 (mod p)`

*Integral for reducing complex exponential expressions in a prime modulus*

For remainder of 3141^2001 divided by 17, 3141 ≡ 13 (mod 17). By FlT, `a^16 ≡ 1 (mod 17)`. 
- 3141^2001 ≡ 13^2001 (mod 17)
- 13^2001 = (13^125)^16 • 13
- 13^2001 ≡ (1)^16•13 (mod 17)

#### Chinese Remainder Theorem
*For solving simultaneous congruences.*

If gcd(m1,m2) = 1, then for any a1, a2, there exists a solution to the simultaneous congruences
- n ≡ a1 (mod m1)
- n ≡ a2 (mod m2)

If n = n0 is one solution, the complete solution is n ≡ n0 (mod m1•m2)

To solve, show hypothesis first. Then expand one congruence using definition. Sub into the other congruence equation to get a linear congruence. 

#### Splitting Modulus
*Special case of simultaneous congruences where n is congruent to the same thing in different moduluses.*

*Can also be used to simplify polynomial congruences, by splitting the mod and applying FlT.* 

If p and q are coprime, then (`x ≡ a (mod p)` and `x ≡ a (mod q)` ) iff `x ≡ a (mod pq)`
