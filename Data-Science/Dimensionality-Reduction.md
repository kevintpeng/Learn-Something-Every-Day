# Dimensionality Reduction
MNIST is a computer vision dataset, classic example is the set of handwritten digits
- digit can be represented as a point in 784-dimensional space
- MNIST digits intuitively live in a lower dimensional subspace than 784
- goal of dimensionality reduction is to think of other ways to encode information in lower dimensions, losing only irrelevent information -- [source](http://colah.github.io/posts/2014-10-Visualizing-MNIST/)

### Principal Axis Theorem
Motivation:
- x^2/9 + y^2/25 = 1 defines an elipse
- x^2/9 - y^2/25 = 1 is a hyperbola
- with cross terms, 5x^2 + 8xy + 5y^2 = 1, it is not obvious whether it's elipse or hyperbola
- through completing the square, a special case of matrix diagonalization

### PCA, principal component analysis
applying orthogonal tranformations to convert a set of correlated variables into a set of linearly uncorrelated variables, called principle components
- orthogonal transformations preserve euclidean distance between points, so in 2&3-dimensional euclidean space, rotations, reflections or improper rotations (combination)
- number of principle components is less than or equal to number of original variables

Covariance is a measure of joint variability of two random variables
- covariance is positive when there is a positive correlation between variables
- variance is the average squared deviation of one variable
- covariance is the average product of deviations in two variables
- covXY = &sigma;xy = E[(X - &mu;x)(Y - &mu;y)]
- covariance is in units obtained by multiplying the units of X and Y
- correlation is normalized, dimensionless version of covariance
- covariance matrix is holds covariance for every combination of variables
- joint probability distribution describes a composition of multiple random variables, bivariate or multivariate distributions
