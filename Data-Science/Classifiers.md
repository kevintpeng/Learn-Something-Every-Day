### Naive Bayes
Supervised learning algorithm that applies bayes' theorem with the naive assumption of independence between every pair of features
- recall that Bayes is: `P(y|x1,...,xn) = P(y)P(x1,...,xn|y)/P(x1,...,xn)`
- the naive independence assumption is that P(xi|y,x1,...x<sub>i-1</sub>,x<sub>i+1</sub>,x<sub>n</sub>) = P(xi|y)
- because of independence, probability of y given the feature vector is equal to the product of the individual conditional probabilities of each individual feature
  - P(x1,...,xn|y) = P(x1|y)•...•P(xn|y)
