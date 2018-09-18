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
