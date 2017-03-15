# [A Short Introduction to Boosting](https://cseweb.ucsd.edu/~yfreund/papers/IntroToBoosting.pdf)
#datascience

Boosting is a general method of producing a very accurate prediction rule by combining inaccurate rough rules
- boosting Probably approximately correct learning models (PAC)
  - PAC models find efficient functions, bound to polynomial time/space with respect to the example size
- AdaBoost: takes a set of (xi, yi) ... (xm,ym), xi in domain/instance space X and labels yi in set Y
  - simple case is Y = {-1, 1}, binary categorization
  - weak learner should find a weak hypothesis ht: X -> {-1, 1}, that best fits for weight distribution Dt
  - goodness of a weak hypothesis is measured by error: &epsilon;t = ∑ of i:ht(xi)≠yi Dt(i), or the probability that for some i, ht(xi) ≠ yi
  - initial weight is 1/m (uniform distribution)
  
