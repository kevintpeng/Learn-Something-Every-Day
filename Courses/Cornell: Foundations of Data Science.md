# [Foundations of Data Science](https://www.cs.cornell.edu/jeh/book2016June9.pdf)

### Background
- Truncated Taylor series: if the Taylor series exists, then you can truncate it at any n-th derivative term, and there exists some real value z as input to the derivative to complete it, f(x) = f(0) + f'(z)x
- `1+x ≤ e^x` forall real x. Proving inequalities a ≤ b is usually done by showing that b -a is non-negative
- Gamma function, for a > 0, &Gamma;(a) = 0∫∞(x^(a-1)•e^(-x)dx)
- Indicator Variable is either 0 or 1 to indicate the presence of some quantity
- Variance is the average squared deviation from the expected value
- covariance between xi and xj is the average product their deviations
- bounds on tail probability, for non-negative random variables: `P(x > a) ≤ E(x)/a`
- for symmetric matrix A, the number of eigenvalues including multiplicity equals dimension(A)
- m x n matrix A<sup>T</sup> is the transpose of the n x m matrix A (columns become rows)
- conjugate transpose of a matrix, A * is the transpose of A and then taking the complex conjugate of all entries 
- Real Spectral Theorem: let A be a real symmetric matrix, then
  - the `n` eigenvalues are real, as are the components of the corresponding `n` eigenvectors
  - (spectral decomposition) A is orthogonally diagonalizable; A = VDV<sup>T</sup> where V is the matrix with columns |vi| = 1 and D is a diagonal matrix

### High-Dimensional Space
Starting off with some simple high-dimensional intuition:
- for X ~ N(0,1), X is a coordinate of some d-dimensional vector, then as d -> infinity, the volume of the unit ball (all vectors **x** s.t. |**x**| ≤ 1) -> 0
  - this is intuitive because for |**x**| to be ≤ 1, the sum of its squared components must be ≤ 1, and since they are normally distributed, we know that for large d, the sum of squared x coordinates will almost surely exceed 1
- for a set of n points in d-dimensions, also with normally distributed coordinates, as d -> infinity, the distance between each of the points approaches the same value
  - this is essentially saying that the sum of d independent squared differences approaches a uniform value as d approaches infinity
  - and the *law of large numbers* states that: P(|(x1 + ... + xn)/n - E(x)| ≥ &epsilon;) ≤ Var(x)/n•&epsilon;<sup>2</sup>
  - this is a bound of sample mean, for set of X ~ N(&mu;, &sigma;^2), where we think of &epsilon; to be error
    - law of large numbers inequality is proved by Markov's inequality and Chebyshev's inequality
- **Markov's inequality:** P( X ≥ &alpha;) ≤ E(X)/&alpha;
- **Chebyshev's inequality:** P(|Y-E(Y)| ≥ &alpha;) ≤ Var(Y)/&alpha;^2

#### Properties of the Unit Ball
for a unit ball of d-dimensions, volume -> 0 as d -> infinity.
- most of the volume is concentrated near the outer annulus width of 1/d
- by shrinking some d-dimensional ball radius by factor f, we reduce the volume by a factor of f^d

#### Random Projection and Johnson Lindenstrauss Lemma
The nearest Neighbour Problem is an example of a problem that benefits from dimension reduction with projection `f: R^d -> R^k` k << d
- basis of random projection: take k random d-dimensional vectors, u1, ..., uk, then f(v) = (u1 • v, ..., uk • v)
  - show that |f(v)| ~= k^(1/2) * |v| with high probability
  - f(v1 - v2) = f(v1) - f(v2), allowing us to approximate distance between d-dimension points in k-dimensions
  - note that ui's are not orthogonal, and not necessarily unit length
- then Random Projection Theorem bounds the probability that the random projection deviates from the expected value by a factor of &epsilon;
  - it follows that the probability that the projection length differs substantially is exponentially small with respect to k
- Johnson Lindenstrauss Lemma bounds the distance between f(vi) and f(vj) is between 0 and k^(1/2) with high probability

### Eigendecomposition of a Matrix
Recall an Eigenvector of a linear mapping is a non-zero vector that does not change direction after the mapping is applied
- v is an eigenvector of T if T(v) = &lambda;v (scalar multiple)
- &lambda; is the eigenvalue

