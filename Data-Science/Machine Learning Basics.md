
# Machine Learning Basics
Machine learning is a form of applied statistics, with a lesser emphasis on confidence and greater on statistical estimates.
- Formally, learning is improving a performance measure P, by learning from experience E with respect to some class of tasks T
- in a formal sense, learning is not a task, it is our means of attaining the ability to perform a task
- **tasks** describe how we should process examples, vectors of quantitative features
  - Classification: specifying one of `k` categories some input belongs to
  - Classification with missing input: for n inputs, we will need 2^n functions to be learned, for every combination of inputs
  - Regression: based on numeric input, learn a function that can predict outputs outside of the examples
  - Transcription: observe realtively unstructured data, and transcribe it into discrete textual form
  - Machine Translation: language translation (like English to French)
  - Structured Output: any task with vector output (superset of transcription and machine translation)
  - Anomaly Detection: program sifts through a set of events and flags them as being unusual
  - Synthesis: generating new examples, based on the training set
  - Imputation of Missing Values: fill in missing inputs
  - Denoising: for some corrupted example x, and clean example y, find the conditional probability distribution p(y|x)
  - Density estimation (PMF estimation): determine general clustering in a probability mass function
- **performance measure** is a quantitative measure for an algorithm for success of task T
  - generally test how well it performs on data it hasn't seen, so the test set
- **experience** is often the dataset, containing features, and in the case of supervised learning it contains annotations with labels or targets

### Linear Regression Example
Simple algorithm for solving a regression problem, to predict some scaler y from input vector x in Rn: y = w<sup>T</sup>x, w is a vector n parameters 
- w is simply the weights of each xi feature
- set aside a design matrix X<sup>(test)</sup> of m examples with a corresponding target vector y<sup>(test)</sup> containing correct values of y, not used for training but as performance measure P
  - common performance measure is based on the sum of squared deviation 
  - this is minimized when the sum of squared differences function's gradient is 0
  - Mean Square Error is a function of the sum of square differences
  - MSE<sub>test</sub> =. 1/m • ∑(&ycirc;<sup>(test)</sup> - y<sup>(test)</sup>)<sup>2</sup> from 1 to i

### Capacity, Overfitting and Underfitting
In machine learning, we want to perform new tasks unseen before, this is called generalization
- one goal is to minimize generalization error, or test error
- generalization error is the expected value of the error for inputs, based on a distribution similar to what real inputs will be
- estimate generaliation error with a test set
- in linear regression, training error is minimized, but we actually care about test error, however you cannot use the test error to affect the result of training since the test error is not part of the training set
- in theory, arbitrary collection of examples doesn't allow us to make any adjustments, but assuming data is collected over some probability distribution (data generating process)
