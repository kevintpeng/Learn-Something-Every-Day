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

### 2. Logical Device

### 3. Window Surface and swap chain

### 4. Frame buffers

### 5. Render passes

### 6. Graphics pipeline

### 7. Command pools and buffers

### 8. main loop
