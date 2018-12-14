# [CS348: Databases](https://cs.uwaterloo.ca/~gweddell/cs348/)
### [Introduction](https://cs.uwaterloo.ca/~gweddell/cs348/lect-INTRODUCTION.pdf)
- DBMS supports an underlying data model, and authorize users
  - offer durability and concurrency control
- a schema instance is a collection of data


### [Relational Model](http://db.uwaterloo.ca/~gweddell/cs348/lect-RELATIONAL.pdf)
- set notation can describe subsets of data, this is a query: $\{ (x_1, x_2, \dots, x_k) | \phi \}$, find some tuple given a logical equation $\phi$
- **answer** to the query above over **DB** is the **relation** $\{ (\theta(x_1), \dots, \theta(x_k)) \ | \ DB, \theta \models\phi \}$
  - so the relation is a set of results that satisfy our logical conditions $\phi$ for tuples being mapped over our valuation $\theta$
- example forgets about finite constraint, and models a three column table to compute addition
- $\{(x,y) | PLUS(x,y,5)\}$ is a query for all pairs that sum to 5
- apply predicate logic	for more expressive queries


**relational model** organizes information in a finite number of relations
- **universe** is a set of values D with equality
- **relation**, canonically a table 
  - has a predicate name R, and arity k of R (number of arguments, in this case number of columns)
  - **relation instance** is $R \subseteq D^k$
- **database** has a signature defining a finite set $\rho = (R_1, \dots, R_n)$ of predicate names
  - **instance** is a relation **Ri** for each $R_i$, bold means relation for each predicate name
  - notation: $DB = (D, =, R_1, \dots, R_n)$, for example $DB = (Z, =, PLUS, TIMES)$
  - `AUTHOR` might be some $R_i$, the label, its relation instance **Ri** might have arity of 2, id and name, part of the universe of tuples $Z \times Names$
- on truthiness, when a relationship between objects (tuples) is present, it is true, and false if relationship is absent
- a **valuation** is a function $\theta$ that maps variable names to values in the universe D: $\theta : \{x_1, x_2, \dots\} \rightarrow D$
  - $\theta[x \mapsto v]$ defines x to map to v in our function
- the truth of a formula $\phi$ (truth being existence of a relation) depends of a database instance and valuation

**integrity constraints** are laws, that must be true in every valid database instance
- addition is commutative
  - is a binary function
  - is a total function
  - is monotone

example:
- every boss manages a unique department: $\forall x_1,y_1, x_2, y_2 ,z.EMP(x_1,y_1,z) \land .EMP(x_2,y_2,z) \rightarrow y_1 = y_2$

### [SQL](https://cs.uwaterloo.ca/~gweddell/cs348/lect-SQL-handout.pdf)
builds on the relational calculus
- SQL is a standard, has many implementations
- has three parts: Data Manipulation, Data Definition, Data Control

#### First Order SQL
Summary:
- captures all of relational calculus
- polynomial runtime (PTIME)
- shortcomings: no aggregation (counting) or recursion (path in graph)

Details:
- simple $\exists, \land$ queries use `SELECT, FROM, WHERE` to declare
- `R AS p` defines a tuple variable (correlation) p, with **attribute names** $a_1, a_2, \dots a_n$, similar to relational calculus where we would say $R(p.a_1, p.a_2, \dots, p.a_n)$
  - `AS` keyword is optional: `SELECT r.publication FROM wrote r`
  - this is even still equivalent to `SELECT publication FROM wrote`
- for $\lnot, \lor$ we need set operators `UNION, EXCEPT, INTERSECT`
  - we can use this to connect queries together, but both queries must return the same signature (be **union-compatible**)
  - `OR` in the `WHERE` clause looks like `UNION`, but often doesn't cover the empty set case
  - of course with $\lnot, \exists$ we can form $\forall$ queries now
- for nested queries (something like $(A \lor B) \land C$) can use the keyword `WITH` to name the results of a child query for use in another query
  - `WITH` can be omitted by inlining queries `SELECT book.title FROM (SELECT * FROM books) book`
- `WHERE` subqueries are syntactic sugar that allow you to inline queries that look like predicates, with keywords `IN, SOME, ALL, EXISTS, NOT`
  - `SELECT title FROM publication WHERE pubid in (SELECT pubid FROM article)`
- **parametric subqueries** allow queries to depend on (attributes from) the main query 
  - semantically, subqueries let us say "All x in R s.t. part of x doesn't appear in S"

Example: List all authors who always publish with someone else
```SQL
SELECT DISTINCT a1.name 
FROM author a1, a2 
WHERE NOT EXISTS (
  SELECT * FROM publications p, wrote w 
  WHERE p.pubid == w.publication
    AND a1.aid = w.author
    AND a2.aid NOT IN (
      SELECT author
      FROM wrote
      WHERE publication = p.pubid
        AND author <> a1.aid
    )
)
```

#### Modifying Database
More SQL syntax for actually modifying state based on first order logic

#### Aggregation
Extension of first order SQL
- finding a number of tuples (counting), min/max, mapping values over a column

### Data Modeling and Entity-Relationship Model

### [Normalization Theory](https://cs.uwaterloo.ca/~gweddell/cs348/lect-FD-handout.pdf)
- anomalies in schema design lead to violations of transactional consistency
- functional dependencies let us reason about ways to perform schema decomposition, thereby avoiding anomalies
- **computeX+(X, F)** is an algorithm for determining which columns can be determined from the key + functional dependency set pair (by continuously adding any attributes to the set of X+ that are determined by elements in X+ currently)
- a decomposition is dependency preserving if we get some equivalent F' and none of the functional dependencies are interrelational (requires a join)
- Normalization is the process of decomposing a schema (set of relation schemas), so that it is in some standard form
- BCNF is the most desirable form, followed by 3NF
- multivalued dependencies capture anomalies/redundancies not captured by functional dependencies (when X ->> Y, means a set of values for Y is determined instead of a single unique value)
- a **dependency basis** is a way to partition a relation schema so that we can further decompose schemas with multivalued dependencies, since splitting right-hand sides of dependencies (as in minimal cover) doesn't work for multivalued (because it uniquely defines a large set, the cartesian product of all right-side attributes' values)
  - breaking down the example for Course-Teacher-Hour-Room-Student-Grade relation, "dependency basis for X = C is R-X = [Y1 = T, Y2 = HR, Y3 = SG] s.t. F |= C ->> Z iff Z - C is a union of some of the partitions of R-X"
- 5NF is even stronger, using join dependencies, but has no axioms

### Query Execution
We use relational algebra for implementing query execution
- all relational calculus queries are representable in relational algebra
- naive implementations of each operator are intuitive, but slow
- one optimization is to use indexes
- calculating the cost of different physical plans can be done using the simple cost model for I/O, using several parameters to estimate relative cost of operations, based on assumptions of uniformity and independence

### Transaction Execution
