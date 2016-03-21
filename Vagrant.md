
# Vagrant 
Command line utility for building and managing virtual machines. Used in conjunction with shell scripts to automatically build consistent and iscol development environments.

## Setup
```
$ vagrant init hashicorp/precise64
$ vagrant up
```
`vagrant init` creates `Vagrantfile` in current directory. Can take one parameter, the `box`.
`vagrant up` installs dependencies, based on box template.

## Vagrant Boxes
Vagrant uses base images, called "boxes", to clone instead of building virtual machines from scratch everytime. [Hashicorp's Box Catelog](https://atlas.hashicorp.com/boxes/search) has many boxes.

## Up and SSH
After `vagrant up`, virtual machine will be running. Run `vagrant ssh` to SSH into the machine. `vagrant destroy` closes the machine.

## Synced Folders
