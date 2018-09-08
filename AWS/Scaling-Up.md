# Scaling Up deployments through ELB, CloudWatch, Auto Scaling
### Elastic Load Balancer
**Elastic Load Balancer** is a managed service that automatically scales based on traffic metrics
- supports routing all HTTP, HTTPS, TCP and SSL traffic
- balances traffic across availability zones, generally for homogeneous instances
- can be used for health checks on a set of instances
- **internet facing** load balancers receive dns record
- **internal** routes traffic to ec2 instances within a VPC
- **HTTPS** load balancer encrypts data between the client and the load balancer, while the load balancers connection to the back end instances need not necessarily be encrypted
  - SNI is not supported by ELB
  - Custom **subject alternative names** must be added to the cert if the ELB wants to server multiple applications
- ELB has one or more listeners, each configured to accept traffic over some protocol HTTPS/HTTP at OSI layer 7, or TCP/SSL at layer 4
- healthchecks are important for ELB's to be able to monitor the EC2 instances behind them, to determine if it is appropriate to route traffic to the instance

ELB's are highly configurable
- idle connection timeouts let the ELB kill connections (either to clients or backend instances)
- cross-zone load balancing routes evenly based on zone, allowing you to worry less about rightsizing each zone for distribution
- connection draining allows an ELB to temporarily stop routing new requests to an unhealthy or unresponsive instance while maintaining current connections (in flight requests)
- proxy protocol adds human-readable header fields to the request as it proxies to the backend, containing information about source/dest IP and port number
- sticky sessions enable affinity (similar to caching algorithms) for users to statefully connect to the same backend instance across multiple requests
- health checks are supported by ELB, through pings, connection attempts, or page loads with configurable thresholds for marking instances as unhealthy

### Amazon CloudWatch
Service for monitoring AWS resources and applications in real time
- provides hypervisor visible metrics about an EC2 instance

### Auto Scaling
Auto scaling in AWS is composed of three components:
- **Launch configs** specify a template of EC2 resources to consume when launching an instance, including instance type, AMI, security groups
  - required are name, AMI, and instance type
  - can also specify key pair, security groups, block device mapping for EBS/ephemeral
- **auto scaling groups (ASG)** consume a launch config to provision a managed set of EC2 instances
- **auto scaling policy** is an optional component that let's administrators define the criterion for creating and destroying instances in the ASG based on workload metrics
  - four plans are used to maintain the current size of an ASG: maintain current, manual scaling, scheduled scaling, dynamic scaling
