# [Dynamo: Amazon's Highly Available Key-value Store](http://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf)
#distributedsystems

Distributed data store, used to optimize for some sets of data, where relational patterns would not scale
- simple user preferences, session management, product lists...
- partitioned and replicated data using consistent hashing and object versioning

The setup is designed to be masterless, and is done through hashing part of the key, the partition key.
- hash value is 128 bits, and all possible hash values form a ring where each node is responsible for a range of these values in the ring
  - this is the token ring
