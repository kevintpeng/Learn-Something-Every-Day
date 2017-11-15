# Container Networking 
### Docker Model
Uses host-private networking, using bridges to connect private network segments.
- virtual bridge `docker0` 
  - subnet allocation from the private address block for that bridge
- `vethXXX` device for each container is created and attached to the bridge
- using linux namespaces, `vethXXX` from the host is mapped to look like `eth0` from within the container
  - linux namespaces are a kernel feature that isolated (and virtualizes) system resources 
  - limits what you can see (and therefore use)
  - bunch of different types of namespaces for different linux resources, that boil down in practice to mapping idomatic uses (pid 1, uid 0 etc...) to other resource ranges on the host (like UID 10000-11000 on host maps to 0-1000 on container)
- docker containers can only talk to other containers on the same host (the same virtual bridge)
- inter-node communication can only be achieved through port forwarding, which implies that ports need to be coordinated as a resource

### Kubernetes Model
For container orchestration to work, 4 problems need to be solved:

1. highly coupled container to container communication (pods with localhost)
2. pod to pod communication
3. pod to service 
4. external to service

*Notice that service is used to cover more dynamic cases of networking where endpoints may need to be discovered or externally exposed.*

Pods are an abstraction layer which help to simplify networking from the end user's perspective. Each pod has its own IP address (effectively like a host) and has multiple containers (much like local processes) which can easily connect to one another
- notice that this simplifies things like port allocation, service discovery, load balancing, configuration

#### Flannel
Simple way to configure layer 3 (IP, ICMP) handling how traffic is transported between hosts
