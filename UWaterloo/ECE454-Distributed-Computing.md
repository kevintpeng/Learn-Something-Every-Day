# [Distributed Computing](https://learn.uwaterloo.ca/d2l/le/content/459381/Home)
- Distributed systems are often organized as middleware
  - offers single-system view
- **distribution transparency** is a desirable property for middleware, that hides the fact that processes/resources are physically distributed
- openness arises from interoperability, composability, extensibility, and separation of policy from mechanism (through config files)

### [Architectures](https://learn.uwaterloo.ca/d2l/le/content/459381/viewContent/2553833/View)
- typically for layered architectures we count by the max number of layers passed through
- logical layers can map to multiple **physical tiers**. For three layers two tiers, a couple of odd examples:
  - UI split client and server, like terminals
  - UI and application client, enterprise software
- this is **vertical distribution**, mapping layers to tiers
- **horizontal distribution** is sharding
- object-base architectures like LLDB's API
- delegate responsibility of data storage to one layer, allows other layers to scale easily: **data-centered architecture**
