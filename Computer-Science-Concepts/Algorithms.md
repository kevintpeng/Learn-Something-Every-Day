# Dynamic Programming
- in directed acyclic graphs can be *linearized*: ordered in an array
- if we want to minimize distance in a weighted graph, and both A and B point to C, then `dist(C) = min{dist(A) + AC, dist(B) + BC}`
- solving a collection of subproblems, `{dist(u) : u in V}`
