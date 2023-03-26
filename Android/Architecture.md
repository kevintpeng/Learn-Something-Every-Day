# Architecture 

![image](https://user-images.githubusercontent.com/7998752/227795943-08466d7a-4fd6-4490-8a18-fa21b81847b6.png)

Apps: regular, privileged, OEM. regular can’t access System APIs, but can be installed/updated whenever.
Android framework: interfaces, classes, precompiled binaries.

System services: this is XR Sys UI goal to become a system service?

ART: android runtime contains the JVM, capable of translating bytecode to ISA.

HAL: hardware abstraction layer, *i think of this as a bunch of hw drivers*

Native daemons (storaged), native libs (libc)

Linux Kernel
