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

### Application Programming
We look at C as a language to embed SQL in.
- declarations allow you to define host variables in order to communicate single values to the programming language
- stored procedures let you write functions in SQL directly, to be executed on the database instead of client
- `SQLCA` is the communication area, allows host variables through declarations

Dynamic SQL allows us to execute a string as a SQL statement
- a statement could return any number of variables, so to handle this we store it in a struct `sqlda`, description area
- `DESCRIBE stmt INTO sqlda` allows a prepared `stmt` to have its description stored in the SQLDA structure

ODBC's are libraries that allow applications to perform queries without needing preproccessing of code
- no precompilation, more restrictive, explicit binding of parameters required
- standardized (but with long specification)

### Data Modeling and Entity-Relationship Model
**E-R Model** is for designing database schemas, visualized by **E-R diagram**
- describes in terms of entity, relationships, attributes
- entities have attributes, and can be related to each other
- a role name can be used to label the function of an entity set in a relationship set (useful when there are multiple relationships)
- **constraints** can be defined in the model
  - existence through primary keys, and dependencies
  - multiplicity through N:M relationships
  - subordinate entities are identified through their depency on another, single entity through a many to one relationship
  - cardinality constraints can be declared, min and max range
- a number of extensions are considered, like structured attributes, aggregation, specialization, generalization, and disjointness

### Translating E-R models to relational tables
They seem to map directly to relational tables, different ways to represent each model component

