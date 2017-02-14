# [MapReduce 2004](https://static.googleusercontent.com/media/research.google.com/en//archive/mapreduce-osdi04.pdf)
Computation model, takes a set of key/values and produces a set of key/values
```scala
List(1,2,3,4,5).map(x => x * x) // List(1,4,9,16,25)
List(1,2,3,4,5).reduce(_+_) // 15
```
