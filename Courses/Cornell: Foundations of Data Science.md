# [Foundations of Data Science](https://www.cs.cornell.edu/jeh/book2016June9.pdf)
### High-Dimensional Space
Starting off with some simple high-dimensional intuition:
- for X ~ N(0,1), X is a coordinate of some d-dimensional vector, then as d -> infinity, the volume of the unit ball (all vectors **x** s.t. |**x**| ≤ 1) -> 0
  - this is intuitive because for |**x**| to be ≤ 1, the sum of its squared components must be ≤ 1, and since they are normally distributed, we know that for large d, the sum of squared x coordinates will almost surely exceed 1
- for a set of n points in d-dimensions, also with normally distributed coordinates, as d -> infinity, the distance between each of the points approaches the same value
  - this is essentially saying that the sum of d independent squared differences approaches a uniform value as d approaches infinity
  - and the *law of large numbers* states that: P(|(x1 + ... + xn)/n - E(x)| ≥ &epsilon;) ≤ Var(x)/n•&epsilon;<sup>2</sup>
  - this is a bound of sample mean, for set of X ~ N(&mu;, &sigma;^2), where we think of &epsilon; to be error
    - law of large numbers inequality is proved by Markov's inequality and Chebyshev's inequality
