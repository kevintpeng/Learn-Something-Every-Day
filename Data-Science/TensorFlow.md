# TensorFlow
MNIST is a computer vision dataset, and a simple task is to use a simple model called softmax regression -- [source](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/mnist/mnist_softmax.py)
- one-hot vectors are 0 in most dimensions, and 1 in a single dimension
  - for MNIST digits, [0,0,0,1,0,0,0,0,0,0] represents the literal number 3
- goal is to assign a probability to each possible output (0..9), given an image input
- softmax regression is used to assign probabilities to each output, acting as a simple model itself or a final layer in a more complex system
