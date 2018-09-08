# Graph Theory
The study of mathematic structures called graphs. Part of discrete mathematics (study of fundamentally discrete structures, non continuous). Graphs represent a set of objects, where some objects are connected by links. Objects are verticies and links are edges.

Edges may be directed or undirected (graph of people who met vs. graph of people who know of other people).

Definition: graph G = (V,E), a set of V vertices or nodes, with a set of E edges, where any given edge is an unordered 2-element subset of V (or a pair of verticies).

## Properties of Graphs
**Adjancency**: Two eges of a graph are adjacent if they share a common vertex.

## Depth First Traversals
- **in-order** follows the recursive strategy (left, node, right).
- **post-order** follows (left subtree, right subtree, then node).

## Self Balancing Binary Search Trees
Node based BST that automatically keeps its height small, on insert/delete. Desirable since trees take operation time proportional to their height (optimally log(n)).

### Red-Black Trees
Self-balancing binary search tree. Balance is preserved by "painting" each node red or black (extra bit for each node). These nodes must satisfy properties that collectively constrain how unbalanced a tree can become in worst case.
![Red-black tree](https://upload.wikimedia.org/wikipedia/commons/6/66/Red-black_tree_example.svg)

1. A node is either red or black.
2. The root is always black. (property for consistency)
3. All leaves (NIL) are black. (consistency)
4. If a node is red, both children are black. (constraining property)
5. Any path from any node to any of its descendant NIL nodes must contain the same number of black nodes. (this is the property that constrains the tree from being unbalanced)
  - the number of black nodes from the root to a node is the node's **black depth**  
  - the uniform number of black nodes in all paths from the root to the leaves is the **black height**

These imply an important property: **The path from the root to the farthest leaf is no more than twice as long as the path from the root to the nearest leaf.**
  
## Binary Expression Tree
Learned this in an interview at startup Drop Loyalty! Specific application of a binary tree used to represent mathematical expressions. The nodes are all binary or unary operations except for the leaves which are values that are operated on. The whole tree represents and expression, or a result if there are no variable values in the expression tree.
![binary expression tree](https://upload.wikimedia.org/wikipedia/commons/9/98/Exp-tree-ex-11.svg)

Scheme like representation of the expression tree: (+ (* (+ a b) c) 7) using in-order traversal.
