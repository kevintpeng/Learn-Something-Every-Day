# [Access Path Selection](http://www.inf.ed.ac.uk/teaching/courses/adbs/AccessPath.pdf)
Introduces the idea of **query optimizers**, which reminds me a lot of C vs assembly. It introduces how *declarative* queries (SQL) can be easier to write and more efficient than procedural data retrieval. 

**System R** is a very influential Relational Database Management System built in 1975. There are four phases of SQL statement processing in system R:

1. Parsing
2. Optimization
3. Code Generation 
4. Execution

This is why it looks a lot like a C compiler to me. Very similar process of converting code to executables, with optimizations along the way that could beat many manually written assembly subroutines at a higher level of abstraction.

This paper was on optimization. **Access path selection** is a step during the optimization phase. An **access path** is a way of accessing some relation (table) in the database, which is a set of tuples (row of data), and the path itself is the lookup operation which is O(n) by performing a full data scan of the database, but can be faster with indexing (some hash map structure probably or binary tree). The cost of taking each of these paths is estimated by the optimizer using statistics tracked by the database system. Different suppliementary data strucutures provide more options for possible access paths an optimizer can select, and more complex queries can further leverage optimizations.

### Intro to Parsing
A **query block** is a basic unit of SQL that operates on tables or the results of other queries (join, group,...)
- a query block has clauses, which are semantically processed in the order, FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY
- notice that the FROM clause is semantically ordered first, to look up the relevant relation/table
- most relevant to this paper are query blocks of the structure `SELECT list FROM relation WHERE some boolean predicate`
- the result of a query block is a **derived table**, some subset of rows of a table or tables whose columns might be different, as is the case in joins
- *so I guess in more complex statements, there are multiple query blocks (i.e. multiple statements in one) and the optimizer chooses which order to execute these in*
- predicates (the WHERE clause) can contain many query blocks because an operand in a boolean predicate can take as input the result of a query block

### Intro to Optimization
if no errors in parsing, then optimzer accumulates the names of tables and columns referenced in the query, looks them up in System R for statistics about the referenced tables, and the available access paths. *Why are there multiple possible access paths?*

Next, the optimizer rescans the select-list (columns) and where-tree (predicate with possibly nested query blocks) and does a sort of type-checking for semantic errors in the query.

Finally, optimizer performs access path selection. Again, this is like finding the fastest lookup path for each table in the FROM clause. It creates an execution plan in the intermediate language called Access Specification Language (ASL). I think of this as assembly. 

### The Research Storage System
Basic model for storage used by System R. Think of it as the component that handles atomicity, consistency, idempotence and durability for the actual storage of data. It uses paging, covered in OS class. What they call segments are logical groupings of pages such that entire tables are in a segment. **Scan** is the operation to access a single row in the table and is used repeatedly to linearly look through a table's rows. Indexes are implemented on a B tree (we learned about this data structure in class, it's purpose is basically to perform optimized binary search, trying to reduce the number of pages loaded into memory). **Index scan** is a second kind of scan operation, basically looking up in the index, presumably with less pages loaded, to find the necessary information about rows that the boolean predicate needs. What's important here is that we can either do a linear search through all table rows, or can sometimes scan the index for less page table loads. Some indexes don't need to scan the entire table because they might be able to take arguments for their lookup. *I'm imagining since it's a BTree that an example might be indexing a numeric column and essentially doing range search or binary search to satisfy arguments which could be `=X` or `>X` or `<X`*

### Costs for single relation access paths
Single relation being single table. `COST = (PAGE FETCHES) + W * (STORAGE API CALLS)`. This cost describes the cost of the I/O operation to fetch the table, and is an estimation based on statics we've kept track of. We're looking for rows that satisfy the boolean predicate. An index can **match** a boolean factor (clause) in the predicate if the index can take arguements and if we can use the boolean factor as those arguments. *if salary is a column, we might use SALARY=200000 as a boolean factor, and the columns index matches this argument if it is a binary tree and we can plugin 200000 to it as an argument to perform O(log n) search instead of O(n)*.
