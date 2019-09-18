# [Vulkan](https://vulkan-tutorial.com)

### [Intro to GPU](https://www.cs.cmu.edu/afs/cs/academic/class/15462-f11/www/lec_slides/lec19.pdf)
- **Framebufer** is a hardware component, portion of RAM, containing a bitmap for video display
- graphics pipeline abstractly handles vertices, resterization, fragment processing (shading) and outputs an image
- fundamentally, the shader programming model uses independent fragment, which can be executed in parallel and out of order (think distributed systems/functional)
- Arithmetic Logic Unit (ALU) in every GPU core
- amortize instruction management overhead by sharing instruction stream between all ALUs
  - **SIMD** (Single Instruction Multiple Data) processing
- since we have more fragments than ALUs, interleave processing to avoid stalls (dependencies on CPU or load times of textures)

### Intro to Vulkan
- GLFW is an open source library for creating windows, contexts and surfaces (for OpenGL and Vulkan)

### 1. Instance and Physical Devices
- specify what physical device/GPU
- query for VRAM and other properties

### 2. Logical Device
- logical device is where declare what physical device features you'll be using
- declare which queue families will be used
  - a `VkQueue` takes a sequence of commands to execute possibly asynchronously with other VkQueues
  - queue families are subsets of commands which allow certain kinds of optimization 

### 3. Window Surface and swap chain
- necessary for on-screen rendering
- abstraction between vulkan and the native windowing system
- swap chain allows for incremental rendering, so that only completely rendered images are ever shown
  - the frame is eventually shown depending on present mode (such as double buffering vsync)
  - synchronizes the presentation of images to the refresh rate of the screen

### 4. Frame buffers

### 5. Render passes

### 6. Graphics pipeline

### 7. Command pools and buffers

### 8. main loop

### [Vulkan Layers](https://renderdoc.org/vulkan-layer-guide.html)
- the application talks to the loader, which deals with enumerating & validating layers requested
