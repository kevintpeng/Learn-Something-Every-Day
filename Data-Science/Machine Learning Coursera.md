[Source](https://www.coursera.org/learn/machine-learning/)

# 1 Classes of Problems in Machine Learning
- Evolved from AI, new capability for computers
- Database mining (web click data, medical records, biology, engineering)
- Robotics, handwriting recognition, self-customizing programs

**Formal Definition**: program learns from experience E with respect to class of tasks T and performance measure P, if performance (P) at tasks in T improve with experience (E)

## Supervised Learning
- Given data set, with intended output, produce right answer
- Regression problem, output of continuous values
- Linear approximation and taylor polynomial
- Classification problem, determine probability of a discrete valued output (0,1) 

## Unsupervised Learning
- Given data set, not necessarily with knowledge of the data, find some structure to data (clustering of data)
- Algorithm will discover conclusive information and structure from data
- Ex: Cocktail party algorithm, takes audio inputs of two speakers, separate to independent files
- Ex: group people with similar genetics together in clusters
- Octave is a language tailored well to Machine Learning.

## Linear Regression One Var
In regression problems, given input variables, try to find a continuous expected result function
- univariate linear regression is used to predict a single output value y from single input x
- supervised learning, we have an idea of what input/output should be
- **Hypothesis function** is of the form of linear approximation: `ŷ = h.theta(x) = theta0 + theta1•x`
  - based on random guesses and iterations, the hypothesis function fits itself to the training data
- **Cost Function** measures the accuracy of our hypothesis function 
  - use squared error function, or *mean squared error* function `J(theta0, theta1) = (1/2)•x̄`, where `x̄` is the mean squared error
  - we define error as `ŷi-yi`, square each difference and take the mean of these
  - since we're calculating the distance from hypothesis to actual values, we want euclidean distance
  - sum of squares has the nice property of punishing overestimation and underestimation equally
  - squaring function can be differentiated, yielding linear forms which can be used for optimization
  - sum of squares is a convex cost function, guaranteeing a global min for convergence
  - absolute value functions are non differentiable, so sum of squares is superior

## Gradient Descent
Recall that the gradient vector ` ∇f = (fx, fy)` is like a derrivative for a field (fx = ∂f/∂x)
- if we graph the hypothesis function based on its fields theta0 and theta1 (graphing the cost function as a function of the parameter estimates)
  - that is, if we tested all possible inputs for theta0 and theta1 in a constrained x-y region, plotting the resulting cost function on the z-axis, we get 3D curve that we can find the local min of using constrained optimization
- **gradient descent** is recursively finding the derivative at some point, following the tangent line's slope down closer to the min
  - *reminds me of applying [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method_in_optimization) for approximating the absolute minimum* 
  - the size of each step is determined by the *learning rate*, related to the parameter α
  - repeat until convergence: `thetaj := thetaj - α•∂J(theta0,theta1)/∂thetaj`
- when applied to linear regression, substitute the cost and hypothesis functions:
