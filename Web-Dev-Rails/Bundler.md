# Bundler
Ruby dependency manager. Uses Gemfiles. `gem install bundler`. Example of Gemfile:
```ruby
source 'https://rubygems.org
gem 'nokogiri'
gem 'rack', '~>1.1'
gem 'rspec', :require => 'spec'
```

Then inside app, `require 'rubygems'` and `require 'bundler/setup'`

`bundle exec` runs an executable that comes with a gem in your bundle

### Gemstash
a cache for remote servers (including rubygems.org) and a private gem source
- if bundler is being run across multiple servers, could it could improve speed
- especially if same set of gems are used across multiple machines

Tell Bundler that you want Gemstash to find gems:
```
$ bundle config mirror.https://rubygems.org http://localhost:9292
```
