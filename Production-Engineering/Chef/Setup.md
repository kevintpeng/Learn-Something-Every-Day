# Setup Walkthrough
- `knife node edit mynode` 
  - modify `chef_environment`, `roles`, `run_list`
- [Cookbooks help organize recipes.](./Cookbooks.md) Create one, add the recipe to the run-list
- configure chef server, setup SSH.
  - chef server holds your public SSH key, you hold private (RSA scheme)

### Make a basic web server
- under `metadata.rb`, write `depends "apache2"`
- under `recipes/default.rb` add:
```ruby
include_recipe "apache2"

apache_site "default" do
  enable true
end
```
