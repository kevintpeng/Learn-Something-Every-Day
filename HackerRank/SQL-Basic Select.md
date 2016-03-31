Query all columns for all American cities in CITY with populations larger than 100,000. The CountryCode for America is USA. 
```SQL
SELECT * FROM CITY 
WHERE POPULATION>100000 AND COUNTRYCODE='USA';
```

Query the names of all American cities in CITY with populations larger than 120,000. The CountryCode for America is USA. 
```SQL
SELECT * FROM CITY 
WHERE POPULATION>120000 AND COUNTRYCODE='USA';
```

Query all columns for every row in the CITY table.
```sql
select * from CITY;
```

