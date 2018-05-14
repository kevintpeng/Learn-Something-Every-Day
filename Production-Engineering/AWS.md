# AWS
**Auto-scaling groups** is a collection of EC2 instances *(kinda like kubernetes controllers)*
- provides mechanism for replication
- provides auto-healing via http endpoints or using an ELB

**Launch Configuration** is a template for ASG's to use 
- uses AMI (Amazon Machine Image) as snapshot to build off of

**Elastic Load Balancer (ELB)** is a proxy that can be used as a network load balancer
- can be used for health checks 
- health checks typically used to deterimine which EC2 instance to route to
- can be used for single endpoint health checks too, with customizable parameters 
- ASG can rely on ELB health checks to determine when to recreate an instance
