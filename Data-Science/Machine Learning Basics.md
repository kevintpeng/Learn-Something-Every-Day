
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
- we want improve weights w to minimize MSE<sub>test</sub>, by minimizing MSE<sub>train</sub>
- solve for &nabla;<sub>w</sub>MSE<sub>train</sub> = 0 the **normal equations**

Normal Equation is an analytical solution to the linear regression problem, using a least-squares cost function
- starting with: MSE<sub>test</sub> =. 1/m • ∑(&ycirc;<sup>(test)</sup> - y<sup>(test)</sup>)<sup>2</sup> from 1 to i
- &nabla;<sub>w</sub>MSE<sub>train</sub> = 0
- &nabla;<sub>w</sub> 1/m • ∑(&ycirc;<sup>(test)</sup> - y<sup>(test)</sup>)<sup>2</sup> = 0
- &nabla;<sub>w</sub> ∑(&ycirc;<sup>(test)</sup> - y<sup>(test)</sup>)<sup>2</sup> = 0
- y<sup>(test)</sup> = w<sup>T</sup>x is our prediction or hypothesis function for x
- &nabla;<sub>w</sub> ∑(w<sup>T</sup>x - y<sup>(test)</sup>)<sup>2</sup> = 0

  - X, the design matrix replaces our summation term, since it represents the m rows of n+1 features, +1 for the intercept
  - use transposed matrix multiplaction (essentially squaring each

### Capacity, Overfitting and Underfitting
In machine learning, we want to perform new tasks unseen before, this is called generalization
- one goal is to minimize generalization error, or test error
- generalization error is the expected value of the error for inputs, based on a distribution similar to what real inputs will be
- estimate generaliation error with a test set
- in linear regression, training error is minimized, but we actually care about test error, however you cannot use the test error to affect the result of training since the test error is not part of the training set
- in statistical learning theory, arbitrary collection of examples doesn't allow us to make any adjustments, but assuming data is collected over some probability distribution (data generating process)
  - theoretically, we can follow the i.i.d assumption: independent identically distributed draws
- therefore the test and the train examples are from the same data generating distribution, p<sub>data</sub>
  - expected train error = expected test error
- in practice, splitting the sets and minimizing the training error almost certainly means that expected test error ≥ expected train error
  - we want to reduce training error and reduce the gap between training and test error
  - correspond to underfitting and overfitting, and can be mitigated with **capacity**
- a models capacity is generally it's ability to fit many functions
- high capacity corresponds to overfitting, low to underfitting
- one way to control capacity is to restrict the **hypothesis space**
  - linear regression models are restricted to the set of linear functions
  - by introducing an `x^2` term into the linear regression equation &ycirc; = b + w1x + w2x<sup>2</sup> increases the model capacity (increased using more features, x^2, and their corresponding parameters w2)
  - machine learning algorithms work best when they correspond to the appropriate capacity for the true complexity of the task
- in statistical learning theory, model capacity is quantified by the Vapnik-Chervonenkis (VC) dimension
  - measure capacity of binary classifiers
- VC dimension is the largest possible value of `m` for which there exists a training set of m different x points that the classifier can label arbitrarily 
