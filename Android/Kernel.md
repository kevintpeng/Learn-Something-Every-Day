# Kernel

https://source.android.com/docs/core/architecture/kernel 
- Based on Linux LTS. At Google, LTS kernels are combined with Android patches Android Common Kernels (ACKs). New ACKs are known as  Generic Kernel Image (GKI) Kernels.

https://source.android.com/docs/core/architecture/kernel/generic-kernel-image 
- A device kernel made by some vendor is comprised of:
- Upstream linux kernel
- AOSP: android patch making it an ACK
- Vendor: System on a chip (SoCs) and peripheral support
- OEM/device: device drivers and customizations
- Nearly every device has its own kernel. This is kernel fragmentation
- Cost: security updates, backporting changes, LTS releases hard to merge in, android features requiring kernel changes are slow to add, 
- GKI tries to solve this by moving SoC and board support out of core kernel and into loadable vendor modules.
- So GKI is the kernel stuff, vendor modules plug-in and handle SoC/board specific code
- Kernel Module Interface (KMI) enables vendor modules to exist

https://source.android.com/docs/core/architecture/kernel/releases 
- Linux LTS are min 2 year support.
