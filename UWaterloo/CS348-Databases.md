# CS348: Databases
### [Introduction](https://cs.uwaterloo.ca/~gweddell/cs348/lect-INTRODUCTION.pdf)
- DBMS supports an underlying data model, and authorize users
  - offer durability and concurrency control
- a schema instance is a collection of data


### [Relational Model](http://db.uwaterloo.ca/~gweddell/cs348/lect-RELATIONAL.pdf)
- set notation can describe subsets of data, this is a query
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

