# Graphs
A graph G is an ordered pair (V,E) where V is a set and E is a set of two element subsets of V.
```
E ⊆ { {x,y}: x,y in V, x≠y }

Typical data structure: { {A, B, C, D}, { {A,B}, {B,C}, {A,D} } }
                            Vertices      Edges connecting nodes
```

A graph can be **directed** or **undirected**. In a **directed** graph, an edge (v1, v2) is not the same as (v2, v1) since the edge is directed from 1->2.

Graphs are the most pervasive abstraction in CS. They model networks of transportation, the world wide web, PageRank.

### Classifications
##### Cliques
A graph on n vertices where every pair of vertices is connected is called an *n-clique*, denoted by Kn. Kn = (V, E) where V = {1, 2, ..., n} and E = { {i,j}: 1 ≤ i ≤ j ≤ n}. The number of edges in Kn is nC2 (number of two vertex combinations).
##### Paths
Two endpoints with one linear path connecting all vertices. A path on n vertices, denoted by Pn, is the graph Pn = (V, E) where V={1,2...,n} and E = { {i,i+1}: 1 ≤ i ≤ n-1 }. The total number of edges is n-1.
##### Cycles
A path with connected endpoints. A cycle on n ≥ 3 vertices the graph Cn = (V, E) where V = {1, 2, ..., n} and E = { {i,i+1}: 1 ≤ i ≤ n-1} ∪ { {1,n}}. The number of edges in Cn is n.

### Important Concepts
##### Graph isomorphism
Formal concept for classifying graph types. Two graphs G = (V, E) and G' = (V', E') are said to be isomorphic if there exists a bijection f: V -> V' s.t.
  ```
  {x,y} in E iff {f(x), f(y)} in E'
  ```
##### Size
The number of edges in a graph. The size of an n-vertex graph is bounded by nC2 (the n-clique).

##### Degree
The degree or valency of a vertex v in a graph G = (V, E) denoted by dG(v) is the number of neighbors of v in G:
  ```
  dG(v) = |{u in V: {v,u} in E}|
  ```
A graph where every vertex has degree k is a **k-regular** and a graph is **regular** if it is k-regular for some k.

**The handshake lemma** says the number of people at a cocktail party who shake hands with an odd number of others is even. Formally, *the number of odd-degree vertices in a graph is even.*

##### Geodesic distance
A **distance** between two vertices in a graph is the number of edges in the shortest path (also called the graph geodesic).

##### Eccentricity of a vertex
epsilon(v) of vertex v is the greatest geodesic distance between v and its furthest vertex in G.

##### Radius
A radius r of a graph is the minimum eccentricity of any vertex.

##### Diameter
A diameter d of a graph is the maximum eccentricity of any vertex. Algorithm to compute: find shortest path for all vertices, take the max.

### Subgraphs and Connectivity
- A graph G' = (V', E') is a subgraph of G iff V' is a subset of V and E' is a subset of E.
- A graph G' = (V', E') is an induced subgraph of G iff V' is a subset of V and E' = { {u,v} in E: u,v in V'}
  - subset of vertices, different edges

## Kinds of Graphs
#### Directed Graph
A simple, unweighted directed graph G is an ordered pair (V,E) where V is a set and E is a set of **ordered pairs** from V.
```
  E is a subset of {(x,y):x,y in V, x ≠ y}
```
A Directed graph does not have the notion of *degree*. Instead, *indegree* and *outdegree* of a vertex v in G, defined as |{u in V: (u,v) in E}| and |{u in V: (v,u) in E}| respectively.

#### Multi-edges and Self-loops (non simple)
Multiple edges between the same pair of vertices (this makes the collection of edges a **multiset**). A **self-loop** is an edge to and from a single vertex.

#### Weighted
Numerical weights are associated to edges. Good for modeling physical networks.

## Eulerian Graphs
A *tour* of G traces every edge exactly once: walk T = (v1,e1,v2,e2,...,vn,en,vn+1) s.t. ei ≠ ej for all e in T.

A tour is **Eulerian** if vn+1 = v1, V(T)=V and E(T)=E. An Eulerian tour traverses all edges and ends where it started.

A graph is **Eulerian** iff it has a Eulerian tour.

Theorem: A graph is Eulerian iff it is connected and each vertex has an even degree. (Every vertex must have an exiting edge for every entering edge)

Psudo-proof: if graph is eulerian, then every vertex must be entered and exited, therefore even number of edges. if even edges, then prove v1=vn+1 (ends where it starts) and n = |E|

### Graph Colouring
Example: A network requires users that are close to have different wavelengths to prevent interference. Users can be modeled as vertices, connected by an edge if close. A *colouring* of this graph G is an assignment of colours to vertices s.t. no two adjacent vertices have the same colour.

The example is restated as, *what is the minimum number of colours needed for a colouring of G.*

A **k-colouring** of G is a function c:V->{1,2,...,k}, s.t. if {v,u} in E, then c(v) ≠ c(u). The smallest k in Naturals for which a k-colouring of G exists is called the **chromatic number** of G.

If k-colouring of G exists, the graph is **k-colourable**.

Proposition: If the degree of every vertex in a graph G is at most k, then the chromatic number of G is at most k+1.

Proof by induction on number of vertices. For one vertex, one colour is needed. Assume hypothesis. For a graph with n vertices, with chromatic number k. Add one vertex and you get chromatic number of at most k+1.

### Bipartite graphs and matchings
A bipartite graph can be partitioned into two parts s.t. edges of the graph only go between the two parts, but not inside a part (think domain to codomain or red-black tree).

A graph G is said to be **bipartite** iff there exists U ⊆ V s.t. `E ⊆ { {u,u'}:u in U and u' in V \ U}`

The sets U and V \ U are called the **classes** of G.

A **complete bipartite** graph Km,n is a graph with ALL possible edges between the two classes. `Km,n = (V,E) s.t V={1,2,...,m+n} and E={ {i,j}: 1 ≤ i ≤ m, m+1 ≤ j ≤ m+n}`

Another way to state the definition is a bipartite graph is 2-colourable.

Proposition: A graph is bipartite iff it contains no cycle of odd length. (cycle must end on same side)

Given a bipartite graph G=(V,E), a **matching** B in G is a set of disjoint edges.

Theorem: A bipartite graph W=(V,E) wtih classes B and G has a **perfect matching** iff |B|=|G| and
