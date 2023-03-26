# Android Runtime

https://source.android.com/docs/core/runtime 
- Android Runtime (ART): managed runtime used by apps and some system services.
- “Dalvik” is the predecessor of ART
- Both run DEX bytecode 
- ART uses AOT.

https://source.android.com/docs/core/runtime/configure 
- ART comprises the dex2oat comipler, libart.so runtime
- Dex2oat compiler takes APK files, generates one or many compilation artifacts: 
- .vdex uncompressed DEX code. Metadata to help verification
- .odex contains AOT code for methods
- Should learn about APKs
- Should learn about JVM vs ART

https://medium.com/programming-lite/android-core-jvm-dvm-art-jit-aot-855039a9a8fa 
- JVM enables bytecode to run on any machine, independent of hardware
- .java (src) -> compiled (at runtime for JIT) -> .class (bytecode) -> JVM -> machine code
- DVM (Dalvik Virtual Machine) was created with mobile device power constraints in mind
- Same as JVM but: .class files are converted again to .dex 
- JVM is stack-based, DVM is register based (designed for low mem)
- JVMs are usually shared across apps. DVMs are created one-to-one with apps.
- JVMs run JAR files. DVMs run APKs.

### Hareware Abstraction Layer
- https://source.android.com/docs/core/architecture/hal
  - where Android framework ends and vendor code begins
  - interface written in HIDL provided to vendors to implement for their specific hardware.
- https://source.android.com/docs/core/architecture/hal/framework-testing
  - HIDL HALs guarantee Android core system is backward compatible. Vendor Test Suite VTS ensures that all vendor's HALs work as expected

