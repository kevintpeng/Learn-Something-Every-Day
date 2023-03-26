# Android API

https://developer.android.com/reference
 
- Android API is Kotlin and Java.
- Jetpack: AndroidX is best-practices for non-standard lib stuff
- Android NDK: toolset enabling native code (C and C++)

https://developer.android.com/ndk 
- OpenGL ES for graphics: link your native module to libGLESv3 e.g.
- Platform libraries:
- Vulkan: https://github.com/googlesamples/android-vulkan-tutorials 
- NDK supports multiple C++ runtime libs: LLVM’s libc++, system
- Android apps define SDK versions in gradle file.
- Android Gradle Plugin (AGP): support for compiling many types of source files, linking together to be run on physical or emulated device

https://developer.android.com/studio/build/building-cmdline 
- Can build outside of android studio with gradle wrapper.
- Android Virtual Device (AVD) through android studio using `emulator` cmd

https://developer.android.com/guide/app-bundle 
- Android App Bundle (AAB) contains compiled src code , defers APK generation and signing to Google Play
- Google Play then generates APK optimized for each device config. Sounds like minimizing
- `Bundletool` can be used to create an app bundle
- Jetpack Compose, AndroidX Constraint Layout, Databinding Lib, all sound like UI tools for creating your app
