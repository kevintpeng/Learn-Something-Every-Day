# Route 53
See [DNS Overview notes](../Networking/DNS.md) first.
- provides domain name registration
- provides hosted name servers, with configurable routing
- health checking automatically to ensure that your application is reachable
  - not triggered by requests, instead run periodically by AWS
- **hosted zones** are sets of resources kept by route 53
  - private allows records to route internal traffic within a VPC
  - public allows records to route internet traffic
- **routing policies** determine how Amazon Route 53 responds to queries
  - simple is for a single resource
  - weighted associates multiple resources with a single DNS name, each receiving a proportional amount of traffic to its relative weight
  - latency-based
  - failover
  - geolocation
