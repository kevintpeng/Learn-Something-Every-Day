# Deep Learning
Deep Learning models that support inferences and are robustly applicable to many problems
- speech 
- computer vision
- language understanding

### Deep Generative Models
- Vision and speech comes down to finding representations of features
  - utilize clustering of supervised learning
- Restricted Boltzmann Machines (RBM)
  - stochastic model 
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
