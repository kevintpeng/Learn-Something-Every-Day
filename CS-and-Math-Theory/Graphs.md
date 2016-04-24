# Graphs
A graph G is an ordered pair (V,E) where V is a set and E is a set of two element subsets of V.
```
E ⊆ { {x,y}: x,y in V, x≠y }

Example, in ruby: { {A, B, C, D}, { {A,B}, {B,C}, {A,D} } }
                     |Verticies|  |Edges connecting nodes|
```

A graph can be **directed** or **undirected**. In a **directed** graph, an edge (v1, v2) is not the same as (v2, v1) since the edge is directed from 1->2.

Graphs are the most pervasive abstraction in CS. They model networks of transportation, the world wide web, PageRank.

### Classifications
##### Cliques
A graph on n vertices where every pair of vertices is connected is called an *n-clique*, denoted by Kn. Kn = (V, E) where V = {1, 2, ..., n} and E = {{i,j}: 1 ≤ i ≤ j ≤ n}. The number of edges in Kn is nC2 (number of two vertex combinations).
##### Paths
Two endpoints with one linear path connecting all vertices. A path on n vertices, denoted by Pn, is the graph Pn = (V, E) where V={1,2...,n} and E = {{i,i+1}: 1 ≤ i ≤ n-1 }. The total number of edges is n-1.
##### Cycles
A path with connected endpoints. A cycle on n ≥ 3 vertices the graph Cn = (V, E) where V = {1, 2, ..., n} and E = {{i,i+1}: 1 ≤ i ≤ n-1} ∪ {{1,n}}. The number of edges in Cn is n.

### Important Concepts
##### Graph isomorphism
Formal concept for classifying graph types. Two graphs G = (V, E) and G' = (V', E') are said to be isomorphic if there exists a bijection f: V -> V' s.t.
  ```
  {x,y} in E iff {f(x), f(y)} in E'
  ```
##### Size
The number of edges in a graph. The size of an n-vertex graph is bounded by nC2 (the n-clique).

##### Degree
The degeree or valency of a vertex v in a graph G = (V, E) denoted by dG(v) is the number of neighbors of v in G:
  ```
  dG(v) = |{u in V: {v,u} in E}|
  ```
A graph where every vertex has degree k is a **k-regular** and a graph is **regular** if it is k-regular for some k.

**The handshake lemma** says the number of people at a cocktail party who shake hands with an odd number of others is even. Formally, *the number of odd-degeree verticies in a graph is even.*

##### Geodesic distance
A **distance** between two vertices in a graph is the number of edges in the shortest path (also called the graph geodesic).

##### Eccentricity 
epsilon(v) of vertex v is the greatest geodesic distance
