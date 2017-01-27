# [Learning to learn to gradient descent by gradient descent 2016](https://arxiv.org/pdf/1606.04474v2.pdf)
Optimization algorithms are still designed by hand. This paper casts optimization problem design as a learning problem
- Hessian Matrix corrects naive gradient descent by accounting for second order information
- convex optimization is a subfield of optimization, minimizing convex functions over convex sets
- deep learning has seen a proliferation of optimization methods for high dimensional, non convex optimization problems
- optimizers are designed by communities addressing localized subproblems and exploiting inherent structure of the problems
- roughly, optimizer g has parameters &phi;, then the optimizee f is of the form &theta;t+1 = &theta;t + gt(&nabla;f(&theta;t), &phi;)
- deep learning is good for generalizing a specialized optimization to other new sub-structures

### Learning to learn with recurrent neural network
By applying meta-learning, we are essentially recursively applying a learning algorithm on itself. This process is a recurrent neural network (RNN), formed by a directed, cyclic graph

In this work, they directly parameterize the optimizer, define a good optimizer as one with low expected loss, given a distribution of functions f
