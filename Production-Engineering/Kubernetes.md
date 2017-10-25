# Kubernetes
### Summary
Kubernetes is made up of different objects, providing abstractions and represent the state of the cluster
- composed of the spec and status fields
  - spec: describes desired state for the object
  - status: actual state of the object 
- use kubectl with a `.yaml` file as the argument

Architecture
- borgmaster is replaced with apiserver, controller-manager and scheduler
- apiserver receives all requests from the cluster
- the apiserver sends to the kublet on each node
- nodes are worker machines, composed of a kublet and kublet-proxy, each can contain multiple pods
  - kublet is an important controller, needed for container execution layer

**Cluster Networking** 
- pods solve the problem of high coupling between containers, communicating through localhost
- kubernetes assumes all pods can talk to one another
- every pod has its own ip address, so they can effectively be treated as VMs 
- in Docker's network model, containers cannot talk to each other across machines without being allocated a port on the host machine and ports need to be coordinated
- in Kubernetes, all containers can talk to all nodes and other containers witout the need for network address translation (mappings between IP spaces)

**Pods** are the simplist unit of deployment
- represents a running process in your cluster
- encapsulates application container, IP address, storage
  - generally uses docker as the container runtime
- pods generally act as an interface to the container, with meta-data
- pods can also encapsulate multiple containers that are tightly coupled
- **Controller** is the high level abstraction that handles the work of dispoing pods
- pods are the basic unit of deploymnet, encapsulating container(s), storage and IP address. Created by a controller using a pod template, and maintains properties of an object, which are spec and status

**Services** are a logical set of Pods, which allow them to be accessed by other Pods
- provides an abstraction so that frontends do not need to track possible backends
  - implemented as Endpoints API (updated when changes occur) or as proxy (virtual IP based bridge)
- service is needed to expose the cluster to traffic
  - different configurations for the service determine what can access each pod (NodePort vs ClusterIP, default)
- services provides benefits like naming and load balancing, tracking connections with pods that match the label selector
- userspace proxy: services can have virtual IPs through the kube-proxy (mapping a port to load balance to some backend pod)
- iptables proxy: for each service, an iptables rules is installed, capturing traffic to the service's virtual clusterIP (which again proxies to one pod in the cluster)
- it is advantageous to use virtual IPs for services rather than a simple round-robin, since it eliminates erroneous behaviour due to caching (or incorrect handling of DNS TTLs). In other words, the service has it's own IP which the DNS resolves to, and abstracts away the final IP of the pod, allow load balancing to be controlled by the service and avoiding imbalances due to caching
- **service discovery** is done through environment variables (must be specified before a pod is created) and DNS 
- iptables is packet processing logic in linux that kubernetes leverages to create virtual IPs 
  - iptables is a program that's part of the linux kernel firewall

**Labels** allow pods to be grouped together, tagging pods by some attributes that are useful for updating multiple pods at once (flexible update semantics for things like versions or the processes running on them)

**Namespaces** let you use kubernetes at scale (multiple teams)

**Volumes** are a storage abstraction for pods, allowing files to persist longer than the lifespan of a container, and is accessible by multiple containers in a pod
- volumes are just directories mounted at a specific path within the docker image
- **persistent volumes** are pieces of storage in the cluster (resources), consumed as resources and whose lifespan is independent of the pod holding it
  - can be mounted on a host, supported by the resource provider
- **PersistentVolumeClaim**s are requests for storage from the user
  - analogous to pods, in that they consume resources
- StorageClass resources provide admins to describe the classes of storage 

**Deployment** is a wrapper around the ReplicaController, which can act as a set of deployed pods, maintaining a certain replica factor.

**Controllers** in kubernetes are control loops that regulate state 
- watches shared state through the APIserver, each trying to bring the cluster to the desired state
