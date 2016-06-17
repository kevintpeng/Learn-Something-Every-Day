# Librarian-chef
A bundler for chef-repo, helping to manage and vendor upstream cookbooks.
- Librarian creates a `Cheffile`, where you specifiy which third-party cookbooks you depend on:
```ruby
site "https://supermarket.getchef.com/api/v1"

cookbook "ntp"
cookbook "timezone", "0.0.1"

cookbook "rvm",
  :git => "https://github.com/fnichol/chef-rvm",
  :ref => "v0.7.1"

cookbook "cloudera",
  :path => "vendor/cookbooks/cloudera-cookbook"
```

