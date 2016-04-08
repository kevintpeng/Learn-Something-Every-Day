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
