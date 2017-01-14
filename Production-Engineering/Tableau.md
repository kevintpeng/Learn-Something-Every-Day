# Tableau
Data visualization 

### Tableau Extracts
Saved subsets of data sources for performance optimization
- can add functionality to data filtering
- extracts can perform full refreshes or incremental refreshes that add rows that are new since the previous refresh

### Optimization
- network speeds between machines are a bottleneck
- server hosted extracts will be faster
- Individual row pull speed may still be an issue, depending on the query setup (Subqueries in the SELECT items, for example). Try landing the data to a table temporarily (or permanently, reloaded with an sproc)  to see the speed difference.
- Bringing down the number of columns, **especially text columns** will definitely speed up the query significantly.
