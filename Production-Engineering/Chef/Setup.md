# Setup Walkthrough
- `knife node edit mynode` 
  - modify `chef_environment`, `roles`, `run_list`

### Resources
A chef resource describes some piece of infrastructure (file, template or package). A recipe is a file taht groups related resources.
- resources describe the what, not the how
- resources have actions, like `:create`
- recipes can live in the chef-repo, or in cookbooks
- chef provides resources, for ex: `apt_update` is a resource to automate `apt-get update`
- recipes can include **packages**: `package 'apache2'` (no do block, since `:install` is default action)
```ruby
package 'apache2'
# enable the Apache service when the server boots, then start
service 'apache2' do
  supports :status => true
  action [:enable, :start]
end
```
