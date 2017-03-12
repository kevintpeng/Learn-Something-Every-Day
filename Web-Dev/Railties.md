# Railties
Railties is responsible for gluing all frameworks together. Handles bootstrapping of application and provides `rails` command line interface.
- provides several hooks to extend Rails, or modify initialization process
- every major component of rails (action mailer, action controller, active record) implements a railtie
  - each responsible for their own initialization, so rails is absent of any component hooks 
- railties are only needed if an extension interacts with Rails during or after boot
  - creating initializers
  - configuring rails, generators, adding a config key
  - adding a rake task

### Design
Railties is abstract, cannot be instantiated and is meant to be inherited.
- defines a base api for other classes to use
- has four main methods, `rake_tasks`, `console`, `runner` and `generators`
- railties provides a way to configure anything which subclasses `Rails::Railtie`

**Class Based Design** 

## Command Line Basics
`rails console`, `rails server`, `rails generate`, `rails new`

`rails dbconsole` opens the respective database console

`rails runner "Model.method` runs ruby code in the context of Rails.
