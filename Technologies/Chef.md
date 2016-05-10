# Chef
Chef is used to manage servers, with its DSL. Chef is a DSL built on top of Ruby. Chef is an automation platform, tranforms complex infrastructure to code. This lets you build a stack with other services like Buildkite as a CI, where Chef manages each of the nodes.
- provides abstraction to make reasoning about infrastructure easier
- automates how applications are configured, deployed, managed

### Components
![component infographic](https://docs.chef.io/_images/chef_overview.svg)
#### Workstations and Cookbooks
- One or more workstations are configured to allow users to create and test *cookbooks*.
  - cookbooks are uploaded to the *Chef server* from the workstation
  - cookbooks are custom to the organization
- Cookbooks are written in Ruby.

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
