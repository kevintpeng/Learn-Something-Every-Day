# CS138 UWaterloo, Introduction to Data Abstraction and Implementation
### Some History

Unix and C developed in 1970s at Bell Labs/AT&T 

Linux 1990s open source

### File Permissions:

Each file/directory has three sets of permissions: userID, unix group, everyone else with r,w,x

First is d (directory) or - (file) 

`chgrp` changes group name, `chmod` changes permissions 

(0--- 1--x 2-w- 3-wx 4r-- 5r-x 6rw- 7rwx)

Timeline: FORTRAN, COBOL, C, C++, Java …

### Memory Model
Run-time Stack: manages the storage needed locally for each function call

Heap: freestore for dynamically allocated objects (new, malloc)

### Data Structures
struct instances: `strctName s;` direct instantiation on run-time stack (doesn’t work for passing around linked structures)

`strctName* sPtr = new strctName;` dynamic instantiation, on the heap until deleted

**Abstract data type (ADT)**: mathematical structure with well defined behavior (operations)
- signature describes params, pre-cond specifies assumptions before operation, post-condition describes effect of operation

**Adapter:** implementing one ADT with another, unifying the API

**Linked List:** nodes to implement a sequence

**Stack:** ordered data container, LIFO

**Queue:** FIFO

**Deque**: double ended queue (combination of stack and queue)

**Priority Queue:** a queue of objects with an integer priority attribute. usually implemented as a list-of-lists (good for lots of elements, few priorities) or a **heap**, its a binary tree, s.t. for each node, its children have lesser value than itself (better for lots of priorities)
  - for N elements, and K distinct priorities
    - heaps have insert of O(log n)
    - heaps delete of O(log n)
    - LOL insert of O(K)

**Binary Tree:** each node has two children

**Binary Search Tree:** each left child is less than the node, each right child is greater

lookup traverses, insert does lookup and adds where it should be

inorder traversal is DFS, print using recursion

deleting, only complex if 2 children: replace node with largest in left or smallest in right

**Sequence:** abstract data type, container of elements indexed by a set of contiguous integers
- known as vectors or lists

**Dictionary:** ADT, collection of ordered pairs of form key => val

`include <map>` gives access to `map<string, int> m`

**Hash Table:** vector of k buckets, `vector<studentRecord> hashTable(k)`

**Hash Function:** takes key value, calculates its index

###[Hashing](../Computer-Science-Concepts/Hashing.md)
### [Object Oriented Programming](../Computer-Science-Concepts/Object Oriented Principles.md)
### [C++](../Languages/C++.md)

### Review
- sequence containers: `vector, deque, list`
- container adapters: `stack, queue, priority queue`
- order associative containers: `sets, maps`
- unordered associative containers: `unordered_set, unordered_map`

- vector<T>: [], at, back, push_back, pop_back
- deque<T>: [], at, back, push_back, pop_back, front, push_front, pop_front
- list<T>: back, push_back, pop_back, front, push_front, pop_front, sort, merge, reverse, splice
- set<T>: find, count
- map<T, T>: [], at, find, count
- Other ADTS: stack, queue, priority queue, bitset
