# Cluster Analysis
Set of many algorithms for completing the task of grouping objects with similiar properties
- popular notion of a cluster is a group with a small distance among the members, dense areas of the data space, or particular distributions
- can be phrased as a multi-objective optimization problem
- not an automated task, it's iterative knowledge discovery
- cluster is ambiguous in definition, and thus there are many algorithms for the various models of clustering
- clustering can be classified as hard clustering (all objects belong to a cluster) or soft (may not belong to a cluster)

Classifications:
- in strict partitioning, each object belongs to exactly one cluster. With outliers, some objects can belong to none
- overlapping clustering, objects may belong to more than one cluster
- hierarchical clustering, objects belong to nested sub-clusters, based on variable distance (often euclidean)
- subspace clustering is a type of overlapping clustering, with strict clustering for a uniquely defined subspace

### Algorithms
Dependent on the cluster model.

#### Connectivity-Based Clustering (Hierarchical)
Based on the assumption that objects in the set that are near each other in terms of distance are more related than those that are far
- single clusters can be described by the distance between the furthest two points in the set
- provides multiple clusters based on the distance function
- choice of linkage clustering affects how clusters are chosen
  - linkage function describes the distance between clusters
- **Dendrograms** are used to represent cluster hierarchies
  - shows how clusters form as you adjust distance
  
<img height=500 placeholder="Dendrogram" src="https://upload.wikimedia.org/wikipedia/commons/1/12/Iris_dendrogram.png">

- **agglomerative clustering** is a computational process for determining clusters
