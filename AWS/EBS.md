# EBS
Block storage, mountable and persistent.
- Network attached to EC2 instances.
- EC2 instance can be EBS-optimized, by having dedicated network throughput for volumes.

Can snapshot volume state.
- snapshots work iteratively, saving any blocks on the disk that have changed since the last snapshot
- S3 is usually the backend storage service for storing snapshots
- data transfer across regions has cost associated with the one-time operation
