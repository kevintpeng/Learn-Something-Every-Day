# Intro to Statistics
## Summary:
**Counting Rules:**
- Permutations: `nPr = n!/(n-r)!`
- Combinations: `nCr = nPr/r!`; *like permutation formula without the r! permutations for each set of r values*

**Random Distributions:**
- Binomial: P of r successes in n bernouli trials: `P(X = r) = nCr • p^r • (1-p)^(n-r)`; *there are nCr combinations of exactly r successes in n trials*
- Hyper-Geometric: P of r successes without replacement: P(X = r) = <sup>n</sup>C<sub>r</sub> • <sup>N-n</sup>C<sub>n-r</sub> / <sup>N</sup>C<sub>r</sub>; *we calculate what percent of all outcomes have r successes and n-r failures, for n*
- Geometric: probability of k-1 failures before a success, for bernouli trials: `P(X = k) = (1-p)^(k-1)•p`
- Negative Binomial: P of k failures before x successes
- Poisson: models number of event occurences in a time interval: `P(X=k) = &lambda;^k•e^-&lambda;/k!`; &lambda; is E(X) and Var(X)
- Exponential: the time before an occurence of an event (time between events in poisson)
- Chi Square:

**Maximal Likelihood Estimate**:
- purpose is to estimate &theta; for an instance of a distribution
- take a sample of population for a known probability distribution
- construct a likelihood function: L(&theta;) = &Pi;f(yi)
- use the log likelihood function and find its max for &theta;-hat

By extension, Invariance Property states for &theta;-hat as the MLE of &theta;, under mild conditions g(&theta;-hat) is the MLE of g(&theta;) forall cont. function g

**Interval Estimation**:
- using relative likelihood, the 100p% likelihood interval for &theta; says that for 0 ≤ p ≤ 1, the 10% likelihood nterval (p = 0.1•100 = 10%) says that any &theta; in this interval is at least 10% of L(&theta;-hat)


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
- five num summary = {min, Q1, Q2, Q3, max}
- quartiles are calculated with `(n+1) * percentile`, averaging its neighbours for non integer values
- outliers are numbers outside of `Q3 + 1.5 * IQR` and `Q1 - 1.5 * IQR`
- left skewed if distribution function has a left slope (right vise versa)

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

Some applications:
1. given mew, sigma and a value A, find the probabilities P(x ≤ A) = ?
2. given mew, sigma and probability, find the value: P(x≤A) = 0.9 find A
3. Given probabilities and values, we are asked to find mew and sigma (using standardization)

### Distribution of the Sample Mean
Theorem: If x1, x2, ..., xn are independent normally distributed random variables with mean mew and variance sigma squared, then mean of x = ( x1 + x2 + ... + xn ) / n

Theorem: If X ~ N(µ1, sig1^2) and Y ~ N(µ2, sig2^2), then aX + bY ~ N(a•µ1 + b•µ2, a^2•sig1^2 + b^2•sig2^2)

x ~ N(80, 64) weight of canadians. 20 canadians get on an elevators, whats the probability it will break:
- Find P((x1 + x2 + ... + x20)/n ≥ 1000/20) = P(x bar ≥ 50)
- x bar ~ N(80, 64/20)

Central Limit Theorem: Suppose x1 ... xn have a mean µ and variance sig^2 (not necessarily normal). For x bar = the mean of any independent random variables, then if n is large, x bar ~apprx. N(µ, sig^2/n)
- if we have a large enough sample size, the sample means are normally distributed regardless of the original distribution
- arbitrarily, we'll call n ≥ 30 LARGE

### Exponential
X is said to follow an exponential distribution with mean µ, `X ~ Exp(µ)` if X takes values between 0 and infinity and the density function of X `f(x) = (1/µ)•e^(-X/µ)`, X > 0
- looks right skewed
- CDF of the exponential `F(x) = Pr(X≤x) = 1 - e^(-x/µ)`
  - since CDF is integral of density function, from min to infinity, and integral from min to infinity is 1 forall f(x)

### Statistical Inference
Toss coin 100 times
- P(X ≥ 60) = 1000C60•0.5^60•(1-0.5)^40
- statistical inference is using a sample to predict population values
- Target population theta = unknown attribute of population (mean, proportion, variance, etc...)
- a statistical model is the identification of the random variables from which your sample is drawn from; {y1, ..., yn} subset of population
  - before using a model for analysis, check the model to see if it looks normal (check skewness and kurtosis)
- Y ~ Geom(theta): yi = 1 if true with probabily theta, 0 if false with probability 1-theta
- so P(Yi = yi) = theta^(y1-1)•(1-theta)
- Likelihood Estimation: plug in two values that we're comparing into the density functions, take the greater of the two
- the maximum Likelihood Estimate (MLE) is that value of theta that maximizes L(theta). we call this theta-hat

- def: A Q-Q plot is a graph (z(α), y(α)) where z(α) = αth quartile of z ~ N(0,1)
- theta-hat = "most likely" value of theta that generated your sample
- def: let Y1, ... Yn are independent random variables with distribution function f(y, theta) 
- def: theta-hat is the Maximum Likelihood Estimate of theta if theta-hat maximizes L(theta)
- if theta-hat maximizes L(theta), it must maximize l(theta) = log L(theta)
- the log-likelihood function l(theta) = log L(theta)

There are two general methods of interval estimation:
- relative likelihood function R(theta) (Likelihood interval)
  - R(theta) = L(theta)/L(theta-hat) , theta-hat is the MLE
  - LOG RELATIVE LIKELIHOOD FUNCTION: gamma(theta) = log R(theta) = log L(theta) - log L(theta-hat)
- sampling distributions (confidence interval)

&theta; is unknown parameter of interest for a population.
- `{y1, ..., yn}` is independently drawn sample from this population
- &theta;-hat is most likely value of theta that generated the sample
- def: let Y1, ... Yn are independent random variables with distribution function f(y, theta) 
  - L(&theta;) = product of the distribution function evaluated at all sample points &Pi; f(yi, &theta;) for 1 ≤ i ≤ n
- the MLE (maximal likelihood estimate) is simply the max of the likelihood function L
  - *we can use the loglikelihood for computational convenience. The log of a product becomes a summation.*
  - recall for two-var functions, the first-order condition for extrema is when `∂ℓ/∂x = 0 and ∂ℓ/∂y = 0` 
  
For finding the MLE of &theta; for a Uniform Distribution, for Y from [0, &theta;], *intuitively it is double the mean of the sample.*
- density function f = 1/(b-a) = 1/&theta;
- distribution function f(y) = 1/&theta; if 0 ≤ y ≤ &theta; else 0
- we define L(&theta;) to be the product of f(yi) at each sample point, so L(&theta;) = 1/&theta;^n, if all yi [0, &theta;]

*We can think of the likelihood function simply as the probability that a given sample happens, plotted as a function of some unknown parameter, &theta; which the distribution function depends on. It tells us how likely a sample is for a given distribution.* 

Invariance Property Theorem: If &theta;-hat is the MLE for &theta;, then for non-extreme values, g(&theta;-hat) is the MLE for g(&theta;) for any continuous function g

### Interval Estimation (What values of &theta; are reasonable?)
Same problem setup as finding the MLE, given a sample from a large population, find an interval [l, u] which contains &theta; with "high probability"

For the MLE, find one # which represents our best guess &theta;-hat. We can create an interval near &theta;-hat of values that we deem plausible in some sense.

For interval estimation, we can use relative likelihood function R(&theta;) or Likelihood interval through sampling distribution
- def:  R(&theta;) = L(&theta;)/L(&theta;-hat)
- def: Log relative likelihood function &gamma;(&theta;) = log R(&theta;) = log L(&theta;) - log L(&theta;-hat)
- def: 100•p% likelihood interval for &theta; = {&theta; : R(&theta;) ≥ p }, p on interval (0,1)
  - *the higher the value, the narrower the interval because 100% likelihood is essentially a point*
- by our convention, &theta; in 50% = very plausible. &theta in 10% - 50% = plausible, &theta in 1% - 10% = implausible, &theta; not in 1% = very implausible

*By extension, we can use a continuous region to find &theta; for a specified percent certainty (since the likelihood function is a probability density function)*

Estimates can be thought of as an outcomes of some r.v. that needs to be identified to construct intervals. We can use a sample {y1...yn} to estimate the interval [L,U] s.t. the interval [L,U] contains &theta; with high probability
- [L,U] with random variables is the **coverage interval**
- [l,u] as functions of the sample is the **confidence interval** (by subbing the mean in place of r.v. in the coverage interval). This gives us an interval for which &theta; has a 95% likelihood of being in (or whatever % you want to calculate)

To calculate the confidence interval, 
- find the pivotal quantity, with the pivotal distribution. 
- Use the pivotal distribution to find end points of the interval.
- construct the coverage interval 
- use the data to construct the confidence interval

### Chi-Squared Distribution
A random variable W follows Chi-Squared Distribution with degrees of freedom `k` where `k` is a positive integer W ~ &Chi;<sub>k</sub>^2 if W = z<sub>1</sub><sup>2</sup> + ... + z<sub>k</sub><sup>2</sup> where z<sub>i</sub> ~ N(0,1) for independent r.v.
- if W ~X<sub>k</sub><sup>2</sup>, it takes values between 0 and &infinity;
- E(W) = k; V(W) = 2k
- For k > 2, Chi-Squared distribution is not symmetric but right skewed
- if W<sub>1</sub> ~ X<sub>k1</sub>^2 and W<sub>2</sub> ~ X<sub>k2</sub>^2 and w1 and w2 are independent, then w1 + w2 ~ X<sub>k1 + k2</sub>^2

### Student's T-Distribution
Can be used to estimate the mean of a normal distribution where the standard deviation is unknown.

Def: Let T be a r.v. T is said to follow a student's T-distribution with k degrees of freedom, T ~ T(k) if T is a ratio of two indep r.v.s T = Z/W
- T-distribution looks like Normal but with more extreme obs

### Prediction Intervals (Constructing Confidence Interval for next element)
Also called time-series analysis/forecasting. n historical observations Y1, ..., Yn from a Normal population with mean &mew; and s.d. &sigma;. We want to find an interval [a,b] based on data sample containing Y<sub>n+1</sub> with a high degree of confidence. *Predict the next element*
- ex: predict the quality of future job candidates
- *we can only do this if yi is independent random variable, only works for complete independence, not for stocks. Forcasting often requires model fitting.*

Model: Y1,...Yn ~ N(&mew;, &sigma;^2). Y<sub>n+1</sub> = ?
- Yn+1 ~ N(&mew;, &sigma;^2)
- Yn-mean ~ N(&mew;, &sigma;^2/n) from properties of normal
  - recall two normal dist can be summed and multiplied
- *anytime you replace &sigma; by its estimator s, replace z distribution with T.*

### Hypothesis Testing (Is &theta; reasonable?)
Def: A statement made about attributes of a population. Null Hypothesis is current belief H<sub>o</sub>. Alternate hypothesis for measuring evidence for/against H<sub>o</sub>
- Setup: Ho = &theta; = &theta;o; two-sided alternate hypothesis H1 ≠
- objective: draw sample from population and calculate if H0 or H1 is "reasonable"

Steps: 
1. construct the discrepancy measure D. D is a random variable that measures how much the data disagrees with H<sub>o</sub>
  - D ≥ 0, where D = 0 is the best evidence to support the null hypothesis H<sub>o</sub>
  - D's distribution is known
2. calculate the value d (outcome from our sample)
3. The p-value: P(D ≥ d); p-value is determining how unusual the sample is, assuming the null hypothesis is true. If p-value is 1%, then only 1% of samples have this outcome, or more likely, the null hypothesis is wrong.

Suppose we want to deterimine if a coin is fair. Ho: &theta; = 0.5, H1: &theta; ≠ 0.5. Then D = |Y - 50| if Y is the number of successes out of 100 trials. d, for some sample, is computed and then we solve for p-value P(D ≥ d).

We are heavily in favour of the null hypothesis. So our conventions state: 
- p-value ≥ 0.1 => no evidence against null hypothesis
- 5% ≤ p-value ≤ 10% => weak evidence against H0
- 1% ≤ p-value < 5% => evidence against H0
- p-value < 1% => strong evidence against H0
