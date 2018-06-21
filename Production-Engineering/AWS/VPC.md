# Amazon Virtual Private Cloud
On EC2, you can deploy to the EC2 classic network or a custom VPC.

**A VPC** is a logically isolated section of AWS with its own IP address range. It consists of subnets, route tables, security groups
- subnets are segments of the VPC's address range (written as CIDR) that live entirely in a single availability zone
- a **route table** is a logical construct within the VPC, which direct outbound traffic from ec2 instances
  - VPN's have a default one to modify
  - each subnets must be associated with a route table, defaulting to the main route table
- **internet gateways** enable communication between instances in a VPC and the internet
  - by pointing a subnet's route table to an attached internet gateway, 
  - a subnet is considered public if it has a route to the internet
  - the internet gateway logically provides 1-to-1 mapping from some public IP address to the instances VPC-internal private IP address using NAT
- **DHCP** (Dynamic Host Configuration Protocol) is a standard for passing configuration over TCP/IP networks
  - each VPC has an **option set** of values that can be configured for a VPC like domain-name-servers, domain-name, ntp-servers
  - enables DNS for instances that need to communicate over the VPC's IGW
- **elastic IP addresses (EIP)** are a pool of static public IP addresses in each region that are available to pull from and assign to resources
  - EIPs are acquired and assigned to a VPC
- **elastic network interfaces (EINs)** is a virtual network interface
- **endpoints** in VPCs allow direct connections to other AWS services without going over the internet
  - basic route table setups will route AWS service traffic through an IGW
  - with endpoints, you can specify a VPC-endpoint as a target for S3 destined requests
- **peering** connections allow traffic to flow between two VPCs
  - peering is 1-to-1 and non-transitive
  - peering must happen within the same region (US oregon for example)
- **security groups** 
- **access control lists (ACLs)**
