# Terraform
Infrastructure as code. Orchestration tool for building, changing, versioning infrastructure. Works declaratively *(similar to Ansible in that you don't necessarily tell it how to get to the specified state)*
- *differs from Ansible in that it has a focus on the orchestration part of instances compared to configuration*
- **infrastructure as code** is a main goal, much like many of these dev-ops tools
- **execution plan**, generates steps of how to get to desired state
- **resource graph** is a DAG of dependencies, allows parallelization *(looks like spark)*
- **user data** is a configuration that allows shell execution after hardware is provisioned
  - useful for configurations that need to be dynamic
- terraform provisions resources, defined in `.tf` files, from possibly multiple providers like digital ocean and aws
