# TensorFlow
Units of data are called tensors. Tensors are a set of primative values (represented by an array/vector)
- rank is the dimensionality of a tensor (array)
- tensorflow is modelled with a computaitonal graph
  - series of operations represented as a graph
- simplist node is a constant, taking zero inputs, and outputting a stored constant 
- this function abstractly represents a constant, but isn't one until it runs in a session
- `tf.Session.run(tensor1)` would return the function output of `tensor1`
- `tf.Variable([...], tf.float32 )` constructs a variable with an initial value and type
- variables are not initalized in a tf program until `tf.global_variables_initializer()` 
- operations are nodes, `tf.add`, used to combine tensors
- `tf.placeholder(tf.float32)` are a promises to accept external input values (for user parameterization)
- `tf.assign(myVar, myVal)` can be passed to the tf session to reassign variable values

MNIST is a computer vision dataset, and a simple task is to use a simple model called softmax regression -- [source](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/examples/tutorials/mnist/mnist_softmax.py)
- one-hot vectors are 0 in most dimensions, and 1 in a single dimension
  - for MNIST digits, [0,0,0,1,0,0,0,0,0,0] represents the literal number 3
- goal is to assign a probability to each possible output (0..9), given an image input
- softmax regression is used to assign probabilities to each output, acting as a simple model itself or a final layer in a more complex system
