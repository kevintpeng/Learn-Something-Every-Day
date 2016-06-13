# Chef
A configuration management tool in Ruby and Erlang. 
- uses a ruby-based DSL for writing system configuration "recipes"
- streamlines the task of configuring and maintaining a company's servers 
- automates how applications are configured, deployed, managed
- integrates with cloud-based platforms (Amazon EC2, Google Cloud, OpenStack, Microsoft Azure)
  - used to automatically provision new machines 
- provides abstraction to make reasoning about infrastructure easier

### Workstations (developer tools)
Chef Development kit bundles all tools together, for setting up a developer environment.
- Knife is a cli that provides an interface between a local chef-repo and the chef server
  - manages nodes, cookbooks, roles, stores of JSON data, environments, cloud resources
- the chef-repo is the repository structure in which cookbooks are created and stored
- `knife.rb` file is used to tspecify the chef-repo-specific (company specific?) configuration details for knife
- `metadata.rb` is in every cookbook, specifies info to the chef server
  - cookbook name, maintainer, semver, description

### chef-repo
Master repo of all cookbooks, roles, data bags, environments, config files for clients, workstations, and servers. `knife` loads data to the chef server from the chef-repo. 

`Cooker` runs on the Chef Server, and modifies this structure, by handling interaction with the chef server (automatic uploading cookbooks, roles and data bags). It creates separate chef environments for each branch.

Sub-directories:
- `.chef/`, hidden directory stores validation key files and `knife.rb`
- `cookbooks/`, contains cookbooks (custom or upstream)
  - upstream cookbooks can be managed with [librarian](https://github.com/applicationsonline/librarian-chef)
  - `Cheffile` contains all upstream cookbooks to be vendored 
- `data_bags/`, stores json data, keys, iv, ciphers

### Components
![component infographic](https://docs.chef.io/_images/chef_overview.svg)


#### Nodes and Chef Clients
- A node is any machine --physical or virtual --that is under management by Chef
- chef-client is installed on every node
  - chef-client performs configuration tasks specified by run-list
  - chef-client will pull configuration data from Chef server while running

#### Chef Server
- Server acts as a hub of information
- cookbooks and policy settings are uploaded by workstations
- chef-client accesses server from the node it's installed on
  - gets config data
  - uploads run data

