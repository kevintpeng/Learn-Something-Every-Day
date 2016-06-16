# Cookbooks
Basic info in [README](./README.md). 

### Create a cookbook
`chef generate cookbook myCookbook` generates default file structure (Berksfile, chefignore, metadata.rb, README, recipes/default.rb, spec directory, test directory)
- cookbooks can have a template directory, for html views 
- adding recipe logic to `default.rb` lets you add `recipe[myCookbook]` to the run-list

### Debugging
If debugging `node['stenographer']['user']`:
```ruby
require 'pp'
pp node.debug_value('stenographer', 'user')
```
