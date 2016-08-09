# RSA
1. Choose two large, distinct primes p and q, and  let n = pq.
2. Select an integer e so that gcd(e, (p-1)(q-1)) = 1, 1 < e < (p-1)(q-1)
3. Solve ed ≡ 1 ( mod (p-1)(q-1) ) for d.

Public key = (e, n) Private key = (d, n)

For message M < n,
```
C ≡ M^e (mod n)       C is the cyphertext
R ≡ C^d (mod n)       R is the original message
```
