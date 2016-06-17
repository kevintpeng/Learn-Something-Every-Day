# Librarian-chef
A bundler for chef-repo, helping to manage and vendor upstream cookbooks.
- Librarian creates a `Cheffile`, where you specifiy which third-party cookbooks you depend on:
```ruby
# default source 
site "https://supermarket.getchef.com/api/v1"

cookbook "ntp" # newest version, from default source
cookbook "timezone", "0.0.1"

cookbook "rvm",
  :git => "https://github.com/fnichol/chef-rvm", # specific git repo
  :ref => "v0.7.1" # branch, unspecified will be master

cookbook "cloudera",
  :path => "vendor/cookbooks/cloudera-cookbook" 
  # any git source can use :path to find the cookbook subdirectory in the source repo
```

