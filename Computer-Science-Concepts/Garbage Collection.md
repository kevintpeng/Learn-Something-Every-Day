# Garbage Collection
Garbage collection is the process of freeing unused memory from the heap. Many programming languages have an implemented garbage collector. Interpreted languages assign most objects to the heap, and thus need garbage collection.

## Reference Counter
Garbage collector keeps a reference counter to each allocated object. If the counter hits zero, the program has no access to the memory anymore so it frees the object. Adds a constant time overhead to each reference operation. 

Memory leaks happen in circular referencing (such as two way linked-lists) where the program has no reference to a set of nodes, but the nodes are still referencing each other so the memory is never freed.

## Mark and Sweep
Unreferenced objects are not reclaimed immediately. Instead, garbage accumulates until GC detects high memory usage. Then it marks all objects that have references, then sweeps through the entire heap, deleting unreferenced objects.

This method can cause programs to use a lot of memory. Also the sweeping algorithm is blocking, which can be disadvantageous for asynchronous programs.

## Generations
Garbage collector uses segments called generations for objects. New objects go in generation 0. Mark and sweep is applied, and surviving objects get promoted to the next generation. Older generations are not swept as often, as it is presumed that the objects are less likely to need freeing.

## Incremental 
Incremental GC algorithm is used in Ruby 2.2. It splits the sweeping process into several fine-grained processes, reducing the one long pause into smaller pauses over time. 

Total time of garbage collection is not reduced using incremental garbage collection, but rather it aims from consistent performance from programs and is better for programs with concurrency. 
