# Structured Query Language (SQL)
A language for communicating with databases. SQL databases organize information in tables, where the rows are the data. SQL is case-insensitive, when displayed in many consoles like the `rails console`, keywords will be capitalized.

### Selecting Data
`SELECT` is used to query the database to retrieve data based on the criteria in the query:
```SQL
SELECT "column1"
  [,"column2",etc] 
  FROM "tablename"
  [WHERE "condition"];
```
- The stuff in square brackets is optional.
- `where` introduces a condition, with standard boolean operators and the `<>` Not equal to operator. 
- Strings are single quotes ''

The `LIKE` pattern matching operator can be used to match groups of string with wildcard operator `%`. `WHERE column1 LIKE '%s';` will match all rows from selected, whose column 1 ends with an 's'. 

### Creating Tables
```SQL
CREATE TABLE "tablename" 
("column1" "data type"
         [constraint],
 "column2" "data type"
         [constraint],
 "column3" "data type"
        [constraint]);
```
#### Data Types
Data types take a size argument.

`char()` (max 255 bytes), `varchar()` (no max), `number()` (size specifies # of digits), `date`, `number(size,d)` (d specifies # of decimal points.

#### Constraints
A rule associated with a column that the data entered must follow. A `UNIQUE` constraint specifies that no two records can share a value. `NOT NULL`, `PRIMARY KEY` defines unique identifier (like `id` fields).

### Inserting into Table
```SQL
INSERT INTO employee
  (first, last, age, address, city, state)
  VALUES ('Luke', 'Duke', 45, '2130 Boars Nest', 
          'Hazard Co', 'Georgia');
```

### Updating Records
Update all records that match a condition.
```SQL
UPDATE "tablename"
SET "columnname" = 
    "newvalue"
 [,"nextcolumn" = 
   "newvalue2"...]
WHERE "columnname" 
  OPERATOR "value" 
 [AND|OR "column" 
  OPERATOR "value"];
```
[ ] = optional

### Deleting Records
```SQL
DELETE FROM "tablename"

WHERE "columnname" 
  OPERATOR "value" 
[and|or "column" 
  OPERATOR "value"];
```
[ ] = optional

```SQL
DROP TABLE "tablename"
```
deletes all records AND the table.

# Advanced Selecting
SQL is powerful for selecting groups of records quickly. `DISTINCT` selects unique records:
```SQL
SELECT DISTINCT column1 FROM tablename
```
### Aggregate Functions
For numeric columns, `MIN`, `MAX`, `SUM`, `AVG`, `COUNT` (returns # of values in column)

Example: Find highest paid employees in each department:
```SQL
SELECT max(salary), dept
FROM employee 
GROUP BY dept;
```

### HAVING clause
`HAVING` follows a `GROUP BY` clause that specifies a condition to filter out rows after *aggregations* (not to be confused with `WHERE` which introduces a condition on *individual rows*).

### ORDER BY clause
`ORDER BY` is optional clause which allows displayed results of query to be sorted.
```SQL
SELECT column1, SUM(column2) 
FROM "list-of-tables" 
ORDER BY "column-list" [ASC | DESC];
```

### In & Between
`IN` is a conditional operator that is a set membership. 
```SQL
SELECT employeeid, lastname, salary
FROM employee_info
WHERE lastname IN ('Hernandez', 'Jones', 'Roberts', 'Ruiz');
```
`BETWEEN` is a conditional operator for a range.
```SQL
SELECT employeeid, age, lastname, salary
FROM employee_info
WHERE age BETWEEN 30 AND 40;
```

### Table Joins
A join is selecting from multiple tables: `FROM table1, table2`. Table joins are an integral part of relational databases. If you have customers making purchases, one table would be wasteful, since customer information would be copied for each purchase.

For tables `customers` and `purchases`, an *inner join* would look like:
```SQL
SELECT customers.first, customers.last, purchases.item
FROM customers, purchases
WHERE customers.customer_id = purchases.customer_id;
```
Or the proper/equivalent syntax (add `INNER JOIN` and replace `WHERE` with `ON`:
```SQL
SELECT customers.first, customers.last, purchases.item
FROM customers INNER JOIN purchases
ON customers.customer_id = purchases.customer_id;
```

[source1](http://www.sqlcourse.com/)

[source2](http://www.sqlcourse2.com/)
