## cgroups
Limits accounts and resource usage for a collection of processes. 

## Linux namespaces
Linux kernel feature that isolates resources of a collection of processes. 
- every process is associated with a namespace 
  - it can only see resources in the namespace
- each process is assigned a symlink per *namespace kind* in `/proc/<pid>/ns/`
  - symlink handled by kernel
  
### Namespace kinds
- mnt, mount namespaces control mount points
- pid, assigns each process a new PID
- net
- ipc, system V IPC identifiers, POSIX message queue filesystem
- uts, hostname, domainname
- user, uids and permissions
