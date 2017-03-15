# [PageRank 1998](http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf)
#datascience

An algorithm, the basis of Google, that ranks relative importance of web pages based on traffic and connectivity on the graph
- we represent the internet as a graph of nodes (pages) and directed edges (links)
- forward links are known for a given page, but total number of backlinks cannot be guaranteed
- total backlinks in a good estimator of importance in academia but not as reliable for the web
- PageRank *weighs the rank of its backlinks* 

Simplified PageRank: Rank `R(u) = c • ∑ R(v)/Nv`, v in Bu where
- c is a constant < 1 (bounds the sum of all ranks)
- Nu = |Fu|
- Bu is the backlinks for `u` and Fu is the forward links for `u`

Recall Matrix multiplication of A•x, x in R<sup>n</sup> and A is `m x n` is defined as the dot product of x with each m rows of A.

Another formalization in Linear Algebra: let A be a square matrix of dimensionality = to number of pages
- A<sub>u,v</sub> = { 1/Nu if edge from u to v, else 0 }
