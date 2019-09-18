# [Vulkan](https://vulkan-tutorial.com)

### [Intro to GPU](https://www.cs.cmu.edu/afs/cs/academic/class/15462-f11/www/lec_slides/lec19.pdf)
- graphics pipeline abstractly handles vertices, resterization, fragment processing (shading) and outputs an image
- fundamentally, the shader programming model uses independent fragment, which can be executed in parallel and out of order (think distributed systems/functional)
- Arithmetic Logic Unit (ALU) in every GPU core
- amortize instruction management overhead by sharing instruction stream between all ALUs
  - **SIMD** (Single Instruction Multiple Data) processing
- since we have more fragments than ALUs, interleave processing to avoid stalls (dependencies on CPU or load times of textures)

### 1 Setup 
#### Instance and Physical Devices
- specify what physical device/GPU
- query for VRAM and other properties

#### Logical Device
- logical device is where declare what physical device features you'll be using
- declare which queue families will be used
  - a `VkQueue` takes a sequence of commands to execute possibly asynchronously with other VkQueues
  - queue families are subsets of commands which allow certain kinds of optimization 

### 2 Rendering and Presentation
#### Window Surface
- GLFW is an open source library for creating windows, contexts and surfaces (for OpenGL and Vulkan)
- necessary for on-screen rendering
- abstraction between vulkan and the native windowing system

#### Swap Chain
- swap chain allows for incremental rendering, so that only completely rendered images are ever shown
  - the frame is eventually shown depending on present mode (such as double buffering vsync)
  - synchronizes the presentation of images to the refresh rate of the screen
  - three key configurations: surface format (colours), presentation mode (present condition), extent (resolution)
- image view objects are stored in the swap chain, and expose the interface for modifying images

### 3 Graphics Pipeline
- performs sequence of operations that take vertices and textures and produces pixels in the render targets
- vertex shaders, tessellation, rasterization, fragment shaders
- all shader code in Vulkan is specified in SPIR-V bytecode (compiled from GLSL or HLSL)
  - makes it easier to write compilers from intermediate format bytecode to GPU instruction sets
- a [VkShaderModule](https://www.khronos.org/registry/vulkan/specs/1.1-extensions/man/html/VkShaderModule.html) contains shader code
  - assigned a shader stage in the graphics pipeline
- input assembly describes what kind of geometry (think surfaces/lines) to interpret from the vertices given
- viewports describe the portion of the image to shown
- scissor cuts/crops the image
- Render Passes specifies the type of image we want to draw
  - attachments are resources like input data, VkImageView objects represent attachments

### 4 Drawing
- framebuffers, one for each swap chain image
- commands are drawing ops and memory transfers, and are recorded into a command buffer
  - command pool manages memory used by command buffers
  - each framebuffer (corresponding to a swap chain image) gets a command buffer too
- we begin render pass, bind the pipeline, vkCmdDraw, end render pass, end command buffer
- semaphores are used to count the number of ready-to-display images

### [Vulkan Layers](https://renderdoc.org/vulkan-layer-guide.html)
- the application talks to the loader, which deals with enumerating & validating layers requested
- validation layers can be added for simple error handling, acting as interceptors between the application and driver
