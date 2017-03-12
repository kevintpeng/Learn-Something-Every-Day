# [Dynamo: Amazon's Highly Available Key-value Store](http://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf)
Distributed data store, used to optimize for some sets of data, where relational patterns would not scale
- simple user preferences, session management, product lists...
- partitioned and replicated data using consistent hashing and object versioning
