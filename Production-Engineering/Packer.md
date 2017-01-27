# Packer
creates images with anything pre-installed. The config file used to define what image should be built is a JSON file called a *template*. 
- `packer validate example.json` to verify the template is valid
- packer lets you install and configure software into the image, known as **provisioning** 
- supports automated provisioning to install software onto the machines prior to building the image
- can take the result of a builder and turn it into a Vagrant box
