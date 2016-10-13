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
- the distribution function of x: f(x) = P(X=x), probability that r.v. X takes on the value of x
- a distribution table for the random variable x is the set of all possible values of x, with their probabilities (charting the distribution function)
  - `E(x) = μ`, mean. `Var(x) = σ^2` variance
  - variance is the average of the squared deviations from the mean, or `E(Y - E(Y))^2 = sumof (yi - mean)^2 * f(yi)`
- a discrete random variable can take infinite values (flip a coin until heads)
- linearity of expectation is the property that the expected value of the sum of random variables is equal to the sum of individual expected values, regardless of whether they are independent (think weighted average)
  - Y = a + b * X, then E(Y) = a + b * E(X) and V(Y) = b^2 * Var(X)

### Cumulative Distribution Function
- let Y be a r.v. The C.D.F of Y is given by `F(y) = P(Y <= y) forall y`
  - remember CDF is the step graph, a piecewise definied function
  
