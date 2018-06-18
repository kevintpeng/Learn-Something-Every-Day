# Redundant Array of Independent Drives
I'll be focusing on RAID 0, which is a configuration for high performance using multiple drives.

RAID is a configuration on a system which can abstractly allows a collection of drives to be treated logically as a single drive. The purpose of this is either to achieve redundancy for hardening a system and/or achieving performance.
- RAID 0 = striping, no fault tolerence but efficient performance 
  - when writing with two physical drives backing a RAID 0 drive, effectively half of the data is written to one and half to the other
- note the raid controller is the interface that handles how RAID is implemented, and can be software or hardware level
- `/dev` in linux is a collection of files representing devices that our system has access to
  - see [aws documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html) on device naming schemes on ec2
  - `sda1` is for root, `sd[b-z]`, `hd[a-z]`, `xvd[a-z]` are possible names for aws mounted drives
- `mdadm` is a linux utility that allow us to monitor and manage software RAID devices
  - `cat /proc/mdstat` shows status of all raids
  - this is the primary entry point for verifying if a raid volume is configured
  - "Personalities" tells you raid level
  - md_123 can be pronounced "multiple devices #123"
    - `active` tells us it's working, `started` is still configuring, `inactive` means broken
    - the next space delimited list is the devices used
- `LVM (Logical Volume Manager)` is a thin software layer atop hard disks which creates an abstraction for partitioning, managing, replacing and backing up hard drives
  - logical volumes can be created to include RAID functionality, where a LV's parts can be striped across multiple physical as in RAID 0
  - on the flip side, many logical volumes can map to a single physical volume, where different paths in a unix filesystem are the multiple logical volumes sitting atop a single physical volume
  
