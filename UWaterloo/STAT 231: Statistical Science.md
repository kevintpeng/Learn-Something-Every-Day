# Introduction to Statistical Science
Discipline dealing with collections, analysis and interpretation of data with uncertainty
- surveys, studies and experiements are used to collect data

### Summaries
Data Summaries:
- mean, sample variance, sample standard deviation
- p'th percentile is the value s.t. p% of values are less than it
- five num summary = {min, Q1, Q2, Q3, max}

Graphical Summaries:
- histogram, box plot, CDF

### Probability Distributions
Model random processes. For a discrete random variable, the probability function f(y) = P(Y=y) for y in our discrete range R.
- for continuous random variables, use the **probability density function** `P(a ≤ y ≤ b) = ∫f(y)dy from a to b`

Binomial Distribution models random selection problem with replacement, modelling the number of "successes" over multiple trial.s

Poisson Distribution

Exponential Distribution is used to model discrete or continuous random variables, for the number of failures before a success.

Normal Distribution

# Model Fitting, Maximum Likelihood Estimation and Model Checking
Statistical models incorperate probability, for uncertainty problems. Different families of probability distributions better model certain scenarios. To

For applying a model to a set of data, say for random variable Y, `P(Y=y) = f(y;Θ) for y in R`, R is a countable set of real numbers (range of Y). The model selects a value for Θ, Θ-hat by estimating value / fitting the model. 

### Estimation of parameters (Model Fitting)
Suppose a probability distribution models a random process with unknown parameter Θ. The mean for example can be estimated using a sample. A better approach to estimation is the **Maximum Likelihood**
