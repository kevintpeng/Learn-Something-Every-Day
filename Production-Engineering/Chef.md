# Chef
A configuration management tool in Ruby and Erlang. 
- uses a ruby-based DSL for writing system configuration "recipes"
- streamlines the task of configuring and maintaining a company's servers 
- automates how applications are configured, deployed, managed
- integrates with cloud-based platforms (Amazon EC2, Google Cloud, OpenStack, Microsoft Azure)
  - used to automatically provision new machines 
- provides abstraction to make reasoning about infrastructure easier

TL;DR, chef configures and provisions nodes (a network of machines known to the chef server) on a chef-client run, by building a run-list (from roles and recipes, to bring the node to the desired state) and a set of attributes to check the node's state (defined by the node, cookbooks and roles). 

### Background
- virtualization and containers are two technologies that have changed how infrastructure is deployed and managed
  - Containers allow a single machine to host many working configurations.
- both improve scale and ease of deployment (in theory)
- both provide encapsulation as a service, which creates consistent environments across many machines
- with cloud computing and NFV, both enable rapid deployment of services and applications to match demand

#### Provisioning != Configuration
- Provisioning is a set of actions to prepare a server with appropriate systems and software (OS, image)
  - is the creation of machines, or building docker images for containers (Packer builds any infrastructure image type with chef-client as the provisioner)  
- Configuration is setting up application specific dependencies and structure
  - example: a load balancer needs to know which pool of servers to select from, what IP address to use so clients can connect
 
### Workstations (developer tools, `knife`)
Chef Development kit bundles all tools together, for setting up a developer environment.
- Knife is a cli that provides an interface between a local chef-repo and the chef server
  - manages nodes, cookbooks, roles, stores of JSON data, environments, cloud resources
  - interacts with the chef server uning the same REST API as the chef-client
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
- `roles/`, stores files that define the roles that are available to the chef server
  - defines a pattern or process that exists across nodes

### Nodes and Chef Clients
- A node is any machine --physical or virtual --that is under management by Chef
- chef-client is installed on every node
  - chef-client performs configuration tasks specified by run-list, to bring the node to an expected state
  - chef-client will pull configuration data from Chef server while running
- types of nodes include physical servers, cloud-based nodes, virtual machines, containers (virtualization, allowing a single OS to host many working configurations)
- Ohai is a tool that detects attributes on a node (platform details, network usage, memory, CPU, kernel, host names...)

#### chef-client Run
A series of steps taken by the chef-client when it is **configuring** a node.

![chef run diagram](https://docs.chef.io/_images/chef_run.png)

- chef client gets process configuration data from `client.rb` on the node, then gets node config data from Ohai
  - `node_name` attribute is important in client.rb
- Authenticate to the Chef Server using an RSA private key and the chef server api
  - name of node is required for authentication
- Get and rebuild the node object; gets node object from the chef server, if first chef-client run for the node, there will not be a node to pull down from the chef server 
- Expand the run-list; compiles a full list of roles and recipes that will be applied to the node (run-list is stored in each node object's JSON file, grouped under `run_list`
- Sync cookbooks; chef-client asks chef server for list of all cookbook files needed, compares to cached cookbook files currently on the node and updates as necessary
- chef-client identifies each resource (smallest unit of configuration) in the node object

#### Run-list 
The run-list defines all of the info necessary for Chef to configure a node into the desired state
- it is an ordered list of **roles and/or recipes** that need to be run
- always specific to the node which it runs
- stored as a part of the node object on the chef server

#### Node Object
For the chef-client, two important aspects of nodes are groups of attributes and run-lists. 
- the node object consists of the run-list and node attributes
- JSON file stored on the Chef server 
- chef-client gets a copy of the node object from the chef server, on each chef-client run, then places an updated copy back on the server after the run

### Chef Server
- Server acts as a hub of information
- cookbooks and policy settings are uploaded by workstations
- chef-client accesses server from the node it's installed on
  - gets config data
  - uploads run data

### Cookbooks
A fundamental unit of configuration and policy distribution. Defines a scenario (specific application for example) and contains everything required to support it. Cookbooks are combined in the configuration process
- attributes can be defined in a cookbook, used to override default settings on a node
  - when cookbooks are loaded during a chef-client run, these attributes are compared to the attributes present in the node
- recipes are the most fundamental configuration element within the organization
  - a collection of resources
    - **resources** are statements of configuration policy, describing state, declaring steps to reach said state, specifies a resource type (package, template, service), lists additional details
    - grouped into recipes, which describe working configurations
  - must be stored in a cookbook
  - may depend on other recipes 
  - must be added to the run-list before it can be used by the chef-client

### Policy
Policy maps operational requirements, process, and workflow to settings and objects stored on the Chef server:
- **Roles** define server types (web server, database server)
- **Environments** define process (dev, staging, production)
- **Data Bags** can hold passwords, user account data, sensitive items (nodes must authenticate with the correct SSL certificate)
- Cookbooks

### Roles
A role is some set of basic configurations that may be applied to similar servers, playing a similar "role".
- describes what a machine is supposed to do, what responsibilities and settings it has
- roles can be combined on one machine

Roles use the ruby DSL (a bunch of methods with parameters):
```
name "web_server"
description "A role to configure our front-line web servers"
run_list "recipe[apt]", "recipe[nginx]"
```

- base recipes and cookbooks are often used to configure the bare minimum on all nodes
- reference recipes `'recipe[<cookbook>::<recipe>]'`
- references base roles as `'role[base]'` or if nested `/roles/base/packages.rb`, use `'role[base--packages]'`

### Attributes
Used by the chef-client to understand
- the current state of the node
- what state the node was at the end of the previous chef-client run
- what the state of the node should be at the end of the current chef-client run

during every chef-client run, the chef client builds attribute list, defined by:
- the state of the node itself
- cookbooks can define attributes in attribute files or through recipes
- roles and environments define attributes
- data about the node from Ohai
- the node object that was saved to the chef server, on the previous chef-client run
- the rebuilt node object on the current chef-client run

### Environment
Taken care of by Cooker, but in regular setup, found in `/environments`
- also in ruby DSL, defines name, desc, cookbook versions, override attributes ...
- environments are set for a node
