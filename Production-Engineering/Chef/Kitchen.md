# Test Kitchen
A test tool to execute configured code is isolation.
- Serverspec, framework for writing server 'audits' describing behaviors of the server, run in docker made by test kitchen
- [kitchen.yml](https://docs.chef.io/config_yml_kitchen.html) defines what is required to run Kitchen
- implements a series of Rspec expectations, for integration and behaviour-base testing
- serverspec uses a full-blown chef client run and needs a chef server to talk to
- create a new suite in the `.kitchen.yml` file for the given service
- `kitchen version`
- `kitchen list`, choose the right instance to create
- `kitchen create <suite>-ubuntu-1404` to spin up an instance
- `kitchen converge <suitename>` will build a docker container based on the suite
- `kitchen login <suitename>` to "ssh" into the container, for manual verification
