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
