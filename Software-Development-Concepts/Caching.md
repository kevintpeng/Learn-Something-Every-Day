# Caching
A **cache** is a component that stores data so future requests for that data can be served faster. 
- caches should be small
- caches are faster if 
  - long computation
  - slow read speed from original location
  
## Operations
Hardware implements cache as a block of memory for temporary storage of data likely to be used again. Uses a heuristic called a **replacement policy**. One replacement policy is the *least recently used*.

### LRU
A class of expensive algorithms, keeps track of last use, through an "age bit". 

### Most Recently Used (MRU)
Discards the most recently used items first. Useful for situations where the older an item is, the more likely it is to be accessed.

