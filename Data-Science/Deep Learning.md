# [Deep Learning](https://github.com/HFTrader/DeepLearningBook/blob/master/DeepLearningBook.pdf)
Deep Learning models that support inferences and are robustly applicable to many problems
- speech 
- computer vision
- language understanding

A model can be seen as a computation graph (DAG), whose nodes represent operations, leaves are the input and root is the output
- the depth of a model is the longest distance in the graph
- the depth of the model can be less than the depth of the problem, meaning the model has a more limited understanding of the problem
- is a kind of *representation learning* or feature learning

### Linear Algebra Review
- Matrix multiplcation AB = C, is every column of A, dotted with every row of B
- Identity Matrix is related to the inverse Matrix: if Ax = b then Ix = A<sup>-1</sup>b, so A is invertible iff exists 
  - AA<sup>-1</sup> = I
- A is invertible iff it has exactly one solution for every value of b
- span of a set of vectors is the set of all points obtainable by linear combinations of the original vectors
- linear dependence occurs when a vector in a set can be described as a linear combination of other vectors in the set
- norms are used to measure the size of vectors; norms are functions that:
  - f(x) = 0 => x = 0
  - f(x + y) ≤ f(x) + f(y)
  - forall a . f(ax) = |a|f(x)
- L<sup>p</sup> norm = (∑|xi|<sup>p</sup>)<sup>1/p</sup>
  - notice that for p = 2, we get euclidean distance. So L<sup>2</sup> is the euclidean norm
- L<sup>1</sup> norm is better for machine learning, since it grows linearly near the origin (good to discriminate between c exactly zero and close to)
- Symmetric Matrices: A = A<sup>T</sup>
- Orthogonal Matrices: AA<sup>T</sup> = I
- decomposition is useful in math, like prime factorization
- eigendecomposition is breaking a matrix into eigenvectors and eigenvalues
  - eigenvector is defined by Av = &lambda;v, so the vector's direction is unchanged through matrix multiplication
  - eigenvectors can be rescaled to any vector sv for s ≠ 0, so we look for unit eigenvectors
- let V be the concatenation of eigenvectors for A as columns. Then A = Vdiag(&lambda)V<sup>-1</sup>
- determinant of a matrix can be thought of as the expansive multiplicative factor
  - equal to the product of all the eigenvalues

### Probability & Information Theory
- Marginal Probability is the distribution over a subset of variables (summation of individual probabilities)
- for continuous probabilities, we use an integral
- Chain Rule: P(a,b,c) = P(A|b,c)P(b,c) = P(A|b,c)P(b|c)P(c)
- x,y are conditionally independent if conditional probabilities given z P(x,y|z) = P(x|z)P(y|z)
- Bernoulli Distribution &phi; &isin; [0,1], the probability a variable is equal to 1
- important sometimes to have a sharp point at x = 0, with exponential distribution or adjusted to some point &mu; using laplace distribution
- Structured Probabilistic Model plots multiple variables on the same graph
  - factorization of distribution into smaller distributions, dependent on less variables
- KL Divergence or information difference is asymmetric difference between two distributions P and Q; q * = argmin<sub>q</sub>D<sub>KL</sub>(q||p)
  - KL Divergence from P to Q, D<sub>KL</sub>(P||Q) is the amount of information lost when Q is used to approximate P
- can draw an undirected graph over random variables, showing how the probability distributions can be factored

Information Theory revolves around quantifying how much information is in a signal

### Logistic Regression
Regression model where the dependent variable is categorical
- includes binary dependent variables
- multinomial logistic regression if more than two categories
- ordinal logistical regression
- logistic functions take real input and output a result between 0 and 1 (interpreted as probability)
- standard logistic function S(t) = &sigma;(t) = `1/(1 + e^-t)` &isin; (0,1), a type of *sigmoid function*

### Recurrent Neural Network (RNN)
Class of Neural Networks, that is a directed cyclic graph

### Deep Generative Models
- Vision and speech comes down to finding representations of features
  - utilize clustering of supervised learning
- Restricted Boltzmann Machines (RBM)
  - generative stochastic artificial neural network, that can learn a probability distribution 
  - visible variables (pixel intensity)
  - hidden variables (features)
  - "tell me the features, and it will generate a semantic response"
  - images and composed of learned features 
  - every text document can be represented as  a linear combination of topics
    - recommendation system uses collaborative filtering
    - in a neueral network:
    - multinomial visible: user ratings
    - binary hidden: user preference
  - closed form to compute output of the models very quickly
- product of experts:
  - use combination of topics to determine conditional probabilities of semantics
- unlabelled -> edges -> combination of edges (higher level)
  - scale models up with higher level features
- model formulation
  - bottom up inference
  - top down feedback

### Multimodal Learning & Learning with Structured Outputs 
- Images are dense, text (descriptions) are sparce
- we want to 
- heiarchical model (abstract them separately at low level features) and combine the modals at a high level feature
- encoder: convolutional Neural Network
- decoder: neural language model
  - image -> semantic feature space -> description
- visual attention models (features as focal points of images)
  - important for caption generation
  - looks at the proper spots in the image
  - Helmholtz Machines / Variational Autoencoders (heiretical models)
- Holistic Scene Understanding -- finding features, with structured prediction
  - important to learn with constraints and priors
  
- unsupervised
- reasoning and natural language understanding
  - semantic relatedness
- sequence to sequence learning
  - neural machine translation (language) 

Reasoning
- Forward RNN and backwards RNN
- Gated Attention Mechanism with element-wise multiplication
- recurrent Neural Network

- deep reinforcement
  - policy regression
