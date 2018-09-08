# [Deep Learning](https://github.com/HFTrader/DeepLearningBook/blob/master/DeepLearningBook.pdf)
See [prerequisite math](./Foundational%20Math.md) and [foundational machine learning](Foundations%20of%20Machine%20Learning.md) and [neural networks](Neural%20Network.md)

Deep Learning models that support inferences and are robustly applicable to many problems
- speech 
- computer vision
- language understanding

A model can be seen as a computation graph (DAG), whose nodes represent operations, leaves are the input and root is the output
- the depth of a model is the longest distance in the graph
- the depth of the model can be less than the depth of the problem, meaning the model has a more limited understanding of the problem
- is a kind of *representation learning* or feature learning

### Optimization and Training techniques -- [source](https://blog.acolyer.org/2017/03/01/optimisation-and-training-techniques-for-deep-learning/)
Hyper-parameters are picked constants that largely influence the effectiveness of an algorithm
- tuning hyper-parameters is time consuming because benchmarking effectiveness requires a full trial run
- in 2012, most hyper-parameters were picked from human intuition
- random search turns out to work well, since: 
  - the parameter space usually has a low effective dimensionality
  - importance of some parameters vary with datasets
- grid search might miss information if one axis of the grid is independent to the result (thus we have lots of wasted trials)
- graphing box and whisker plots for expected best trial (in accuracy) for given number of random trials
<img src='https://adriancolyer.files.wordpress.com/2017/02/random-search-fig-2.jpeg?w=960'>
- deep networks have LOTS of hyper-parameters (many per layer) 

**Improving neural networks by preventing co-adaptation of feature detectors**
- simple technique for reducing overfitting: randomly drop (50% change) a hidden unit, called dropout
- co-adaptation in biology is the process by which two or more species undergo adaptation as a pair or group
  - undergoing natural selection together, through evolutionary pressure
  - better isolates neurons as feature detectors, more independent contributions
- as a mental model, a neural network with n units can be seen as a collection of 2<sup>n</sup> possible thinned networks, with shared weighting and each individual thinned network is tested rarely

**Regularization** in deep learning is used to add an extra term to the cost function (weight decay, L2 regularization)

**max-norm** regularization works well in conjunction with dropout. Bounds the norm of the weight vector at each hidden unit by `c`, clipping constant.

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
