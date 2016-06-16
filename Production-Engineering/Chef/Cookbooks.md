# Cookbooks

### Debugging
If debugging `node['stenographer']['user']`:
```ruby
require 'pp'
pp node.debug_value('stenographer', 'user')
```
