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
  - Denoising: for some corrupted example y, and clean example x, find the conditional probability distribution p(x|y)
  - Density estimation (PMF estimation): determine general clustering in a probability mass function
- **performance measure** is a quantitative measure for an algorithm for success of task T
  - generally test how well it performs on data it hasn't seen, so the test set
