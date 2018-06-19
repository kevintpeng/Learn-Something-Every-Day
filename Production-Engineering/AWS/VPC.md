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
