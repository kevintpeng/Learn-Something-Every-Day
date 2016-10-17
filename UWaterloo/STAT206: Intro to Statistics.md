# Intro to Statistics
### Central Tendency
the degree of clustering of values of a statistical distribution
- arithmetic mean is `(1/n)∑(yi)` for 1 ≤ i ≤ n
- median or geometric mean is `(y1•y2•...•yn)^(1/n)`
- harmonic mean is the reciprocal of the arithmetic mean of the reciprocals
- For any two #s, AM ≥ GM ≥ HM
- median is the middle element of a set
- Quartiles is splitting data into four equal parts
- Percentiles break data in to 100 parts
- Mode is the element of maximum frequency

### Measure of Dispersion
- Range = Max - min
- Inter-Quartile Range (IQR) = Q3 - Q1 (where Q1=25%, Q2=50%, Q3=75%)
- Variance = `σ^2`, the average of the squared deviations from the mean
  - for mean ȳ, `σ^2 = (1/(n-1)) ∑ (yi - ȳ)^2`
- Standard deviation `σ` = positive square root of the variance
- for some transformation of the form `yi = a + bxi`, variance = `b^2 • var(x)`, sd(y) = `|b|•sd(x)`

### Measure of Skewness
```
SKEWNESS = Mean - Median
         = (1/n) ∑ (yi - ȳ)^3
         = (1/n) [∑ (yi - ȳ)^2]^(3/2)
```

- **Kurtosis** is the measure of frequency of extreme observations, compared to a normal distribution
- `K = some nast formula`, the fourth standardized moment
  - ASIDE, a standardized moment of a probability distribution is a measure of the shape of a set of points
  - the n-th moment of a continuous function ƒ(x) about a value `c` is `µn = ∫(x-c)^n • ƒ(x) dx`

### Measure of Association
- bivariate data is data that is dependent on two variables
- sample correlation coefficient quantifies the degree at which two variables are correlated
  - r ~= 0 shows no linear relationship, while |r| ~= 1 shows strong linear relationship

### Graphical Summaries of Data Sets
identifies distribution from which your sample is drawn, so you apply the right model
- Relative Frequency Histogram 
- Density Histogram, the height is chosen s.t. the relative freqency of the bin = area of the corresponding rectangle in the histogram (accounts well for variable bin widths)
  - relative freqency is `frequency of each bin/total sample size` 
- Empirical cumulative distribution function, ƒ(y) = `# of observations ≤ y/Total # of observations`
  - plots an upwards staircase
- Box and Whiser Plot plots quaritles 

### Statistical Inference
- Descriptive Statistics describe the properties of the data
- Statistical inference is analyzing the properties 
- Three major types of inference problems
  - Estimation: using sample of a population to estimate unknowns
  - Hypothesis Testing: drawing samples from a population to test if a hypothesis is reasonable
  - Prediction Problems: predicting future value based on past data (time series analysis)
- statistical modelling is the identification of the distribution from which your data set and unknown are related

### Theory of Probability
- Random experiment, whose outcomes are uncertain
  - S or Omega = Sample Space, the set of all possible outcomes (equally likely)
  - event A is a subset of S
- simple event is one with only one outcome

Rules of Probability:
- Fi is the empty set, P(omega) = 1, P(Fi) = 0
- if A is a subset of B, P(A) <= P(B)
- A and B are mutually exclusive if both events cannot occur simultaneously (intersection of A and B = Fi)
- A and B are EXHAUSTIVE events if at least one of them have to happen (P(A union B) = P(Omega))
- complement of P(Ac) = 1 - P(A)
- `P(A u B) = P(A) + P(B) - P(A intersection B)`
- Bayes Theorem: `P(Bi|A) = P(A|Bi)*P(Bi)/∑(P(A|Bj)*P(Bj))`
  - denominator is the sum of intersections of A with all events in the event space. This works because B1...Bk are exhaustive AND mutually exclusive

### Counting Rules
- Addition/OR: p or q -> p + q # of outcomes
- Multiplication/AND Rule: p and q -> p * q ways
- Permutation Rule: arrange r objects from n objects without repetition, `nPr = n!/(n-r)!`
- Combination Rule: permutations, without order, `nCr = n!/r!/(n-r)!`

- Conditional Probability, the probability of an event given the simultaneous occurrence of another event: `P(A|B) = P(A n B)/P(B)`
- Statistical independence, A and B are independent if `P(A|B) = P(A)`
  - two mutually exclusive events of non-zero probability CANNOT be independent
  - for two independent events, the probability of them simultaneously ocurring is the product of their probabilities
  
### Random Variable Distribution
A random variable Y is a function that assigns a number ot each outcome of a random experiment
- `Y : omega -> Reals` is a map from sample space to real line  
  - two coin flips, {HH, HT, TH, TT} -> {2, 1, 1, 0}
- Random Variables: Y, X. Outcomes: y, x. Then X is said to be a discrete random variable if x takes integer values only, or continuous if the range is Real
- the distribution function of x: `f(x) = P(X=x)`, probability that r.v. X takes on the value of x
  - probability mass function is a function that gives the probability that a discrete random variable is exactly equal to some value
- a distribution table for the random variable x is the set of all possible values of x, with their probabilities (charting the distribution function)
  - `E(x) = μ`, mean. `Var(x) = σ^2` variance
  - variance is the average of the squared deviations from the mean, or `E(Y - E(Y))^2 = sumof (yi - mean)^2 * f(yi)`
- a discrete random variable can take infinite values (flip a coin until heads)
- linearity of expectation is the property that the expected value of the sum of random variables is equal to the sum of individual expected values, regardless of whether they are independent (think weighted average)
  - Y = a + b * X, then E(Y) = a + b * E(X) and V(Y) = b^2 * Var(X)

### Cumulative Distribution Function
- let Y be a r.v. The C.D.F of Y is given by `F(y) = P(Y <= y) forall y`
  - remember CDF is the step function for discrete distributions, a piecewise definied function
  - probability/distribution function and CDF are two ways to represent some distribution of data
  - `f(y) = F(y) - F(y-1)`

### Discrete Distributions
- Uniform Discrete Distribution
  - `Omega = {1,2,...,n}`, `f(y) = P(Y=y) = 1/n forall y`. That is, all yi in Sample Space have the same probabilities
- Hypergeometric Distribution, describes the probability of r successes in n draws without replacement from a finite population size N that contains exactly R successes, where each draw is either a success or failure
  - `P(X=r) = R choose r * (N-R) choose (n-r) / N choose n`
- Binomial Distribution is same, but with replacement. The probability is the same for each trial
- Geometric/Negative Binomial distribution is # of failures before 1st success
- X ~ Poi(mew), Poisson distribution, x follows a Poisson distribution with mean mew if x = 0,1,2,3,....
  - P(X = x) = f(x) = e^(-mew) * mew^x / x!
  - approximation to a binomial probabilities, limit of a binomial distribution, lim n->infinity, lim p -> 0, np = mew
  - Binomial(n,p) -> Poi(mew)
 
### Continuous Distributions
X is said to be a continuous random variable if X takes values in an interval [a,b], a ≠ b
- for any continuous distribution X, P(X=c) = 0 forall c
- F is called the cumulative distribution of x if F(x) = P(X=x) forall x
- probability density function, P(a ≤ x ≤ b) = a∫b f(x)dx (the area under the curve is the probability of the region
  - it's just calculus. Now we're dealing with regions instead of discrete values
  - ∫f(x) = 1, total area is 1
- uniform distribution: X ~ Uni[a,b] if f(x) = { 1/(b-a) if a ≤ x ≤ b else 0 }
  - constant function on the interval [a,b]

### Normal Distribution
A random variable Z is called a standard normal distribution if
1. Z takes values (-infinity, +infinity)
2. f(Z) = bell curve formula
3. Z ~ N(0,1) where (mean, variance); maximum at zero, and symmetric around 0 
  - P(1 ≤ z ≤ 2) = P(-2 ≤ z ≤ -1), property of symmetry
- for normal distribution, F(x) is the z-score for x, the probability of P(z ≤ x) 
- 100th percentile is all data, 1st is lowest 1%

Theorem: Any normal problem, you can convert to a Z-problem; If X ~ Normal with mean µ and variance σ^2, then `X-µ/σ = Z ~ N(0,1)`, where sigma is standard deviation, not variance; These are just transformations on the normal distribution
