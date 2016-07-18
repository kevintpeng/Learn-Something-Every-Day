# Docker
Docker packages an application with its dependencies to create standard development environments. Wraps the application in a complete filesystem (called containers), so code will run EXACTLY the same regardless of environment.
- lighter weight runtimes than VMs
- cloud portability, using multiple cloud providers without locking into specific architecture

- provides a layer of abstraction and automation of OS level virtualization
- uses resource isolation features of linux kernel like cgroups (control groups) and kernel namespaces
- offers state management through images
- `docker run hello-world` creates and runs a given image

### Images
In Docker, an image is a snapshot of the filesystem. It stores
- a linux distribution
- application's source code 
- applictaion's system library dependencies (third party code, imagemagick)
- application's library dependencies (gems, npm packages)

### Building an image
Write a `Dockerfile`, based on the whalesay image:
```
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
```
- `RUN` install software onto the image
- `CMD` instructs software to run when image is loaded
- `docker build -t <image-name>` takes the `Dockerfile` in the current directory and builds an image

### Using Docker for testing
1. Install docker for mac.
2. `docker run -p 26389:80 --name testing nginx`
3. `docker exec -i -t <container-id> /bin/bash`

#### Difference from Virtual Machines
Containers serve similar purpose of resource isolation but with different architecture, aimed at portability and efficiency.

Virtual Machines include the application, dependencies and entire guest OS, which could be tens of GBs. 

Containers include application and dependencies, but share kernal with other containers. They are not tied to any OS infrastructure.

#### Comparison to Vagrant
Docker is more specific, less flexible than Vagrant. Vagrant is catered to managing independent machines, while Docker is for building and running application environments.
