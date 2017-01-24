# PageRank 1998
An algorithm, the basis of Google, that ranks relative importance of web pages based on traffic and connectivity on the graph
- we represent the internet as a graph of nodes (pages) and directed edges (links)
- forward links are known for a given page, but total number of backlinks cannot be guaranteed
- total backlinks in a good estimator of importance in academia but not as reliable for the web
- PageRank *weighs the rank of its backlinks* 

Rank `R(u) = c • ∑ R(v)/Nv`, v in Bu where
- c is a constant (bounds the sum of all ranks)
- Nu = |Fu|
- Bu is the backlinks for `u` and Fu is the forward links for `u`
