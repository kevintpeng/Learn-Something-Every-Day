# Bundler
Ruby dependency manager. Uses Gemfiles. `gem install bundler`. Example of Gemfile:
```ruby
source 'https://rubygems.org
gem 'nokogiri'
gem 'rack', '~>1.1'
gem 'rspec', :require => 'spec'
```

Then inside app, `require 'rubygems'` and `require 'bundler/setup'`
- `bundle exec` runs an executable that comes with a gem in your bundle
- bundler stores gems (in development) in the default location of the machine
- in `--deployment`, it installs unique to the app (defaults to `vender/cache`)
  - `bundle show <gemname>`

### Gemfile + Gemfile.lock
`source 'https://rubygems.org'` defines which upstream to pull gems from. 
- `Gemfile.lock` makes your application a single package of both your own and third-party code
  - snapshot of last time everything worked

### Gemstash
a cache for remote servers (including rubygems.org) and a private gem source. By default, it is a local cache.
- if bundler is being run across multiple servers, could it could improve speed
- especially if same set of gems are used across multiple machines

```bash 
# Tell Bundler that you want Gemstash to find gems:
bundle config mirror.https://rubygems.org http://localhost:9292

# set Bundler to fallback to rubygems.org
bundle config mirror.https://rubygems.org.fallback_timeout true
bundle config mirror.https://rubygems.org.fallback_timeout 3
```

Gemstash live is `~/.gemstash`, stores cached & private gems
- by default, uses SQLite to store details 

### Gem in a box
Another gem caching solution, older than gemstash, more of a gem server than a cache. Uses [gemirro](https://github.com/PierreRambaud/gemirro), as a dependency for creating a RubyGems mirror.
