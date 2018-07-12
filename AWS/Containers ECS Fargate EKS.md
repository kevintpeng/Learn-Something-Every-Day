# Containers 
### ECS (Elastic Container Service)
Let's you run, stop and manage docker containers on a serverless infrastructure managed by AWS
- **ECR (Elastic Container Registry** manages custom docker images
- still responsible for the availability, capacity and maintenance of the underlying infrastructure
  - spin up EC2 instances and run tasks on top

### AWS Fargate
Analogous to EC2, but they give you a container instead of a VM
- per-second billing, useful for tasks
- this is the AWS managed solution

### EKS (Elastic Kubernetes Service?)
Is managed kubernetes, with built-in AWS integrations
- multi-AZ control plane
- *looks really easy to provision a cluster and start running pods*
- similar to ECS in that you still ultimately own the infrastructure, in this case the kubernetes cluster
  - AWS manages and deploys the Kubernetes masters and management infrastructure
  - you just add worker nodes and connect them
