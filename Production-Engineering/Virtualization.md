# Virtualization
### Hypervisor
KVM and Xen are two highly relevant hypervisors. A hypervisor is software, firmware or hardware that creates and runs virtual machines as guests on a host machine. The hypervisor manages the execution of the guest OS's and the virtualized hardware exposed. 
- Xen hypervisor is type-1, runs atop the hardware directly
- Virtualbox is a type-2 hypervisorthat runs on an OS as an application
- KVM blurs the lines between type-1 and type-2 b acting as a type-1 with a type-2-like interface for the user

**full virtualization** is where guest operating systems are unaware of each other and hypervisor directly interfaces with hardware resources.
- this offers the best abstraction in terms of isolation and security
- typically slower due to emulation involved

**paravirtualization** is where guest operating systems are aware of each other, allowing guest OS's to communicate with the hypervisor.
- efficient virtualization
- requires the guest os to be configured to interact with the para virtualization interfaces
