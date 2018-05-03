# [Bigtable 2006](https://static.googleusercontent.com/media/research.google.com/en//archive/bigtable-osdi06.pdf)
A Google data storage system, who's purpose was to scale well as a sorted map. 
- map is indexed by row key, column key and timestamp
- each value stores binary data, uninterpreted by the system
