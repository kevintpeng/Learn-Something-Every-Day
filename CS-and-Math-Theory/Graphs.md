# Graphs
A graph G is an ordered pair (V,E) where V is a set and E is a set of two element subsets of V.
```
E ⊆ { {x,y}: x,y in V, x≠y }

Example, in ruby: { {A, B, C, D}, { {A,B}, {B,C}, {A,D} } }
                     |Verticies|  |Edges connecting nodes|
```

A graph can be **directed** or **undirected**. In a **directed** graph, an edge (v1, v2) is not the same as (v2, v1) since the edge is directed from 1->2.
