### Generalized Linear Model

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
