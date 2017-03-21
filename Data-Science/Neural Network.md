# Artificial neural network
Uses a connectionism model, based on modelling mental phenomena using interconnected units. Neural Networks are a computational approach based on a collection of neural units connected by axons.
- each neural unit holds a function of all of it's inputs, whose output is propagated to other neural units
- typically consist of multiple layers or a cube design where signal path traverses from front to back
- in connectionist models, networks change over time

[source](https://ujjwalkarn.me/2016/08/09/quick-intro-neural-networks/)

A single neuron takes input from other nodes and computes an output
- inputs have associated weights for relative importance
- the node applies a function f to the weighted sums + b (bias)
- f is a non-linear Activation Function
  - purpose is to introduce non-linearity into the output of a neuron
  - most real world data is non-linear, so this is needed for representation
- Sigmoid: takes real-valued input and squashes into a range between 0 and 1
- tanh: real -> [-1,1]
- ReLU: Rectified Linear Unit is f(x) = max(0,x), threshold at 0

[Bias](http://stackoverflow.com/questions/2480650/role-of-bias-in-neural-networks) lets you shift the activation function left or right, which may be critical for success
- without bias, an activation function can only change in steepness, while bias lets you represent more real world trends in data

<img src="http://natekohl.net/media/sigmoid-scale.png" height=200 alt="adjusting weighting"> vs. <img src="http://natekohl.net/media/sigmoid-shift.png" height=200 alt="adjusting bias">

### Models
Artificial neural networks (ANNs) are simple mathematical models defining `f: X -> Y` or a distribution over X or both X and Y

# Convolutional Neural Networks
[source](https://ujjwalkarn.me/2016/08/11/intuitive-explanation-convnets/)

A category of Neural Networks, effective in image recognition and classification
- tagging scene recognition, object recognition, NLP sentence classification


Feed-forward neural network: connections between units are acyclic, and is unidirectional
- individual neurons respond to stimuli in a restricted region of space known as the receptive field
- overlap between receptive fields of neruons are the visual field
- convolution is the operation on two first class functions `f` and `g` to produce a third function
  - modified version of one of the original functions, giving the integral of pointwise multiplication of the two functions

### [ImageNet classification with deep convolutional neural networks](http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf)
