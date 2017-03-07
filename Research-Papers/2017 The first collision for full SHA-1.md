# [The first collision for full SHA-1 2017](http://shattered.io/static/shattered.pdf)
MD4, MD5, SHA-1, SHA-2 and SHA-256 are all cryptographic hashing algorithms
- a cryptographic hashing function is h: {0,1}<sup>`*`</sup> -> {0,1}<sup>n</sup>, `*` denoting any natural number
  - maps any aribitrarily long bit string to a finite one, deterministically
- a collision between x and y is when h(x) = h(y)
- cryptographic hashing relies on the assumption that it is practically impossible to find collisions, through the birthday paradox
  - (&pi;/2)^1/2 • 2^(n/2) expected attempts to brute force a collision, for a n-bit output hash
  - SHA-1 is 160-bit, which translates to 
- SHA-1 has been deprecated since 2011, this is the first construction of a chosen-prefix collision
  - implications of forgery through HTTPS or SHA-1 checksums for documents
