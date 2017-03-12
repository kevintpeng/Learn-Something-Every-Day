# Rake 
Rake is a utility for build automation, based on unix utility make. It is a part of the rails command line. `Rakefile` can be used to set up a suite of automation commands (as in Rails).

`Rakefile` and `.rake` files to build lists of tasks. 

## Writing Rake Tasks
In rails, `rails g task` generates rake files.

```ruby
namespace :db do # not required
  desc "some description for task"
  task task_name: [:prerequisite_tasks, :other_tasks_run_before] do
    # Any ruby code
  end
end
```
Creates a rake task that can be called with `$ bin/rake db:task_name`

```ruby 
task :task_name, [:arg_1, :arg_2] => [:pre_1, :pre_2] do |t, args|
  # code
end
```
Creates a rake task called by `$ bin/rake task_name[1, 'x']` which passes 1 and x as parameters. (zsh you need to escape square brackets)

## In Rails
- `rake routes` lists all defined routes.
- `rake test` runs tests
- `rake db:migrate`, `rake db:version`, reset, up, down, redo are tasks that automate migration management.

### Rakefile
Rakefile describes a set of rake tasks that are available. 
```ruby
task :name
task :name => [:prereq1]
task :name do |t|
    # actions
end
```
[Read More](http://ruby-doc.org/core-1.9.3/doc/rake/rakefile_rdoc.html)

### Rake Task Design
- namespace related tasks
- write descriptions
- avoid `puts` statements
- use `ActiveSupport::Logger.new('log/myRakeTaskName.log')`, with `log.info` as print statement, `log.close`
```ruby
# lib/tasks/migrate/topics.rake
  # should have namespaced tasks in their own rake file, folder per namespace
namespace :migrate do
  desc 'Migrate topics from legacy database to new database'
  task topics: :environment do
     ...
  end
end
```
