# Capistrano
A remote server automation and deployment tool that extends Rake, using the *Rake DSL*. Supports scripting and execution of arbitrary tasks. Used for automating prepartion for starting Ruby app in its application server:
- Uploading Ruby app's code and files to server machine
- installing libraries, gems, dependencies
- setting up/migrating database
- starting and stopping daemons that app might reply on

Useful in combination with application servers, as it automates many tasks.
```
$ cd my-capistrano-enabled-project
$ cap production deploy
```

### Features
- other deployment tools are `rsync` bash scripts, or complex containerized toolchains
- Capistrano automates manual SSH tasks, it simply runs SSH commands on a remote server
- it has well defined conventions
- highly concurrent

### Installation
Requires ruby >=2.0, git, Bundler, provisioned server (with SCM binaries, `git`). Then in Gemfile:
```ruby
group :development do
  gem "capistrano", "~> 3.4"
end
```
