### Generalized Linear Model
for p-dimensional fector function `y-hat(w,x) = w0 + w1x1 + ... + wpxp`, w = (w1,...,wp) are coefficients and w0 is the intercept
- linear regression fits a line (linear model) to minimize the sum of squares between observations
- computes using SVD of X, then for `n` p-dimensional vectors (n x p matrix), ordinary least squares is O(np^2)

### k-means clustering
Partitioning `n` observations into `k` clusters, in which each observation belongs to the cluster with the nearest mean
- NP-hard
- exist heuristic algorithms, that provide quicker computation, for an approximation
- tends to form clusters of comparable spatial extent
- expectation-maximization mechanism allows for different shapes
- aim to minimize the sum of square in each cluster

Start with a set of k means m1 ... mk. 
1. Assign observation to the cluster whose mean point is nearest
2. Update new means to be the centroids of the observations in the new cluster

### [Least Angle Regression](../Research-Papers/2003 Least Angle Regression.md)
Regression algorithm for high-dimensional data
- numerically efficient when p >> n, for n x p matrix or n p-dimensional vectors
