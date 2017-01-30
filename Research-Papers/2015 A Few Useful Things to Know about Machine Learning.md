# [Useful Things to Know about Machine Learning](http://homes.cs.washington.edu/~pedrod/papers/cacm12.pdf)
The fundamental goal of machine learning is to construct a function that can generalize beyond examples in the training data
- a learning problem can abstractly be broken down into three components: Representation Evaluation Optimization
  - components can be combined in order to find a fit learning algorithm for some use case
- error in learning can be categorized as bias or variance
  - bias is tightly producing the wrong results consistently, this is a result of overfitting
  - variance is producing results that are close to correct, but with low accuracy
  - Overfitting - the learner should perform equally against testing data and new data, otherwise it is overfit 
- every learner must have underlying assumptions and knowledge of the data, because no learner can generalize beyond the training data for random boolean functions
  - *No free lunch theorem* implies that a learning algorithms can't beat random guessing for random vector functions 
- Multi testing problem - so many hypotheses tests that it is statistically probable that there are anomalies 
  - this can be mitigated by applying weighting to account for high volumes of hypothesis tests
