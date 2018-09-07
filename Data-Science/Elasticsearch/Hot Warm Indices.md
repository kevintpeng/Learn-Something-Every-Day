### [Hot Warm Architecture](https://www.elastic.co/blog/hot-warm-architecture-in-elasticsearch-5-x)
Hot-warm architecture is a concept of having two types of data nodes conceptually *(where the hot nodes would probably have better specs)*
- `discovery.zen.minimum_master_nodes = 2` stops split-brain
  - from an architecture perspective, master nodes do not handle search or indexing operations so less frequent garbage collection and less required resources
- Hot nodes perform all indexing within the cluster
  - hold the most recent indices, assumed to be more frequently queried  
  - indexing is high I/O and CPU, so requires SSD
- Warm nodes will be designed to handle large amounts of read-only indices
  - read-only implies less computing, typically we need much larger disks (maybe HDD or some ELB)
- this should all be transparent to users of the elasticsearch cluster

How do we configure indices to route data to the correct node?
- `node.attr` is the interface exposed by ES for doing this
- they suggest the arbitrary attribute `box_type` or something similar
- then, under the index templates' settings, we can specify `index.routing.allocation.require.box_type`

How do old indices get shuffled from hot to warm? How expensive is this operation?
- by updating the routing allocation setting for the index template
- elasticsearch handles the implementation of shuffling
