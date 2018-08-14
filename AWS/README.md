# AWS

### Overview
Amazon's cloud computing platform, allows faster turn around time on ideation to execution for server infrastructure and eliminates a large capital expense of setting up one's own hardware
- provided in many regions worldwide, each broken down by availability zones

#### Compute and Networking Services
- [**Elastic Cloud Compute (EC2)**](./EC2.md) provides resizable virtual computer that pull from a massive pool of compute resources
- **AWS Lambda** is a back-end compute platform that runs on EC2, that is administrated by Amazon
- [**Auto scaling**](./Scaling%20Up.md) allows EC2 capacity to be automatically increased or decreased based on logic defined by the owner
- **Elastic Load Balancer (ELB)** offers traffic distribution over a set of EC2 instances
- **Elastic Beanstalk** is a full feature platform for running web applications in AWS, without needing to deal with the infrastructure
- [**Amazon Virtual Private Cloud (Amazon VPC)**](./VPC.md) allows you to provision a logically isolated section of AWS cloud, with configurable subnets and route tables
- **Amazon Direct Connect** provides a network path to connect on-premise hardware directly to the VPC through a VPN which may reduce latency compared to an over-the-internet solution
- [**Route 53**](./Route%2053.md) is a DNS web service allowing you to purchase and manage domains

#### Storage and Content Delivery
- [**Amazon Simple Storage Service (S3)**](./S3.md) is a cost effective object storage system
- **Amazon Glacier** is an *extremely* low cost storage system, optimized for infrequent access
- **Elastic Block Storage (EBS)** offers persistent storage volumes to be mounted on EC2 instances
- **AWS Storage Gateway** facilitates connections between on-premise applications and AWS storage infrastructure and provides a cache
  - three configurations: gateway-cached volumes, gateway-stored volumes and gateway-virtual tape libraries
  - gateway-cache volumes allow you to expand local storage capacity using S3 for up to 1 PB of data/gateway
  - gateway-stored volumes allow you to back up local storage onto S3
  - gateway virtual tape libraries are for archiving data
- **Amazon Cloudfront** is a CDN service
  - useful for globally distributed consumers of some AWS resource, uses geo-location to route users to the closest cache; edge location
  - cache eviction can be forced, otherwise it depends on the TTL for objects
    - caches can be configured to invalidate certain old records (based on Time To Live), but asset versioning at the API level is best practice
  - not for single location users
  - optimized to work with S3 objects and EC2 or ELB
  - can be used for dynamic content, with multiple origins, and can be configured for different cache behavior as needed
- **AWS Direct Connect** establishes a direct private connection between a datacenter and AWS, without going over the internet

#### Database Services
- **Amazon Relational Database Service (RDS)**
- **Amazon DynamoDB** NoSQL offering, document and key value storage
- **Redshift** is a data warehousing offering, columnar storage (like tableau) with SQL interface
- [**ElastiCache**](./ElastiCache.md) provides managed deployments of Memcached or Redis

#### Data Services
- **Amazon Kinesis Analytics** consumes and processes stream data with SQL
- **Amazon Kinesis Stream** is made up of shards, each of which can consume up to 1000 PUTS/s and scales linearly
  - manually provisioned capacity
  - data is loaded using HTTPS, Kinesis Client Library, Kinesis Producer Library and the Kinesis Agent
  - by default, available in a stream for 24 hours, configurable up to 7 days
- **Amazon Kinesis Firehose** captures and loads streaming data into S3 and Redshift
  - automatically meets load demands

#### Management Services
- **CloudWatch** is a general monitoring service which collects metrics, log files, and sets alarms
- **CloudFormation** is a tool for provisioning hardware, as declared through a json interface
- **CloudTrail** is a service that tracks AWS API calls and ties them to users (API callers)
- **AWS Config** is useful for compliance and asserting that configurations are in place to meet regulations (as defined by config rules)
- **AWS Trusted Advisor** automatically makes recommendations on cost, security, and performance on your whole AWS environment
- **EC2 Systems Manager** is for applying OS patches, OS configurations and running commands across many machines
- **Amazon Inspector** looks at EC2 instances for common issues and security vulnerabilities

#### [Identity Management](./IAM.md)
- **Amazon Identity Access Management (Amazon IAM)** controls permissions for AWS
  - **Amazon KMS (key management system)** can create and manage keys
  - can rotate keys

### [Security](./Security.md)
- **AWS Directory Services** is a managed offering of Microsoft AD, Simple AD and AD connector
  - AD uses LDAP (Lightweight Directory Access Protocol), which handles authentication and identity management
- **Key Management Service (KMS)**

### Deploying on Compute Services
**Auto-scaling groups** is a collection of EC2 instances *(kinda like kubernetes controllers)*
- provides mechanism for replication
- provides auto-healing via http endpoints or using an ELB

**Launch Configuration** is a template for ASG's to use
- uses AMI (Amazon Machine Image) as snapshot to build off of

**Elastic Load Balancer (ELB)** is a proxy that can be used as a network load balancer
- can be used for health checks
- health checks typically used to determine which EC2 instance to route to
- can be used for single endpoint health checks too, with customizable parameters
- ASG can rely on ELB health checks to determine when to recreate an instance
