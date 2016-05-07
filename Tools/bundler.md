# Bundler
Ruby dependency manager. Uses Gemfiles. Example of Gemfile:
```ruby
source 'https://rubygems.org
gem 'nokogiri'
gem 'rack', '~>1.1'
gem 'rspec', :require => 'spec'
```

Then inside app, `require 'rubygems'` and `require 'bundler/setup'`
