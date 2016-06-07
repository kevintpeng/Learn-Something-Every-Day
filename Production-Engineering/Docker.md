# Docker
Docker packages an application with its dependencies to create standard development environments. Wraps the application in a complete filesystem (called containers), so code will run EXACTLY the same regardless of environment.

### Images
In Docker, an image is a snapshot of the filesystem. It stores
- a linux distribution
- application's source code 
- applictaion's system library dependencies (third party code, imagemagick)
- application's library dependencies (gems, npm packages)

#### Difference from Virtual Machines
Containers serve similar purpose of resource isolation but with different architecture, aimed at portability and efficiency.

Virtual Machines include the application, dependencies and entire guest OS, which could be tens of GBs. 

Containers include applicatio nand dependencies, but share kernal with other containers. They are not tied to any OS infrastructure.

#### Comparison to Vagrant
Docker is more specific, less flexible than Vagrant. Vagrant is catered to managing independent machines, while Docker is for building and running application environments.
