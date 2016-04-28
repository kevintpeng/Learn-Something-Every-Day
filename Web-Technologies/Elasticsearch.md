# Elasticsearch
- Allows real-time searching on data on large scale and analyze data. 
- Provides a RESTful API for programs to interface on it. 
- Elasticsearch is scalable horizontally, with the addition of multiple nodes and let's the cluster automatically take advantage of extra hardware. 
- automatic error detection with rebalancing
- stores data in json
- schema free, index a JSON document and it will detect the data structure and types, create index, and make data searchable
- 

### Installation
Requires at least java 7. In console, 
```
java -version
echo $JAVA_HOME
```

If not downloaded, [get the java SE Development Kit 8u91.](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

Download elasticsearch.
```
# download to current directory
curl -L -O https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.2/elasticsearch-2.3.2.tar.gz 
tar -xvf elasticsearch-2.3.2.tar.gz # this extracts the download to the current directory

# open folder, run batch file
cd elasticsearch-2.3.2/bin
./elasticsearch
```

This will pull up an elasticsearch node as the *master* in a single cluster on port `9200`.

```
# Shutdown local node
curl -XPOST 'http://localhost:9200/_cluster/nodes/_local/_shutdown'
```
### Elasticsearch Query DSL
[webinar](https://www.elastic.co/webinars/elasticsearch-query-dsl)
