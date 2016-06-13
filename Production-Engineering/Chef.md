# Chef
A configuration management tool in Ruby and Erlang. 
- uses a ruby-based DSL for writing system configuration "recipes"
- streamlines the task of configuring and maintaining a company's servers 
- automates how applications are configured, deployed, managed
- integrates with cloud-based platforms (Amazon EC2, Google Cloud, OpenStack, Microsoft Azure)
  - used to automatically provision new machines 
- provides abstraction to make reasoning about infrastructure easier

### Setup
[source](https://docs.chef.io/quick_start.html)
- 

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

#### Knife
A command-line tool for interfacing between a local chef-repo and the chef server
- manages nodes, cookbooks, recipes, roles, environments, cloud resources including provisioning



