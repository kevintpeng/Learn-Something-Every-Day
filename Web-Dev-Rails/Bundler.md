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

### Gemfile + Gemfile.lock -- [source](http://bundler.io/gemfile.html)
`source 'https://rubygems.org'` defines which upstream to pull gems from. 
- `Gemfile.lock` makes your application a single package of both your own and third-party code
  - snapshot of last time everything worked, important to commit to repos for consistency across multiple machines

### `bundle install` -- [source](http://bundler.io/v1.12/man/bundle-install.1.html)
Installs gems specified in the Gemfile.
- if `Gemfile.lock` does not exist, Bundler will fetch all remotes sources and resolve dependencies, installing needed gems
- if it does exist, and `Gemfile` is unchanged, Bundler fetches all remote sources and uses dependencies specified in `Gemfile.lock`
- If `Gemfile.lock` exists, and `Gemfile` is changed, `Gemfile.lock` is used for all unchanged gems, and will re-resolve the dependencies of gems that you did update
- never `sudo bundle install`, several steps are user dependent

### Conservative Updating
As safety, bundler will not automatically update a gem whose dependency versions conflict with the `Gemfile.lock`. This means if gem A and B depend of C, when A is updated, requiring a new version of C, B will never break from this, at worst failing loudly.
- first `bundle install`, which guarantees unchanged gems will remain untouched by the system
- then `bundle update <gemname>` if `bundle install` cannot update it

### Tracing a `bundle install`
1. [executable `bundle`](https://github.com/bundler/bundler/blob/master/exe/bundle)
2. [requires bundler](https://github.com/bundler/bundler/blob/master/lib/bundler.rb)
3. [requires cli, passed to install command](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/cli/install.rb)
  - [sets options, then calls `#install`](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/cli/install.rb#L102)
4. [Installer.install](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/installer.rb)
  - inherits [environment](https://github.com/bundler/bundler/blob/be5e3b3c9b5c85700c01026843a77bef75fbed6a/lib/bundler/environment.rb)
  - [resolve_if_need](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/installer.rb#L183) decides what dependencies are needed, all calculated locally
  - calls [install](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/installer.rb#L152)
  - [install in parallel](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/installer.rb#L171)
5. [ParallelInstaller.call](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb)
  - creates a [new ParallelInstaller object](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb#L73)
  - [`call` on object](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb#L81)
  - [enqueue specs](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb#L119) selects all gems that don't have dependencies, enqueues each spec
  - [batch installs with process_specs](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb#L103), by dequeuing from worker_pool
6. Builds a [pool of Workers](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/worker.rb)
  - defines [threads](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/worker.rb#L28) as workers, constantly [proccessing the request queue](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/worker.rb#L56)
  - requests are processed by [lambda func](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/worker.rb#L60), to be exact, [this lambda func](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb#L89) defined earlier. We pass it a spec object and worker ID
  - this calls [`install_from_spec`](https://github.com/bundler/bundler/blob/e6be7ee66f06cc60b2952ad6ce698d3302283101/lib/bundler/installer/parallel_installer.rb#L92)
7. [Gem installer is called](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/installer/gem_installer.rb)
  - calls [`install` or `install_with_settings`](https://github.com/bundler/bundler/blob/dfdeb0f89e7e88fcdfd001da089f09af3a77d2b4/lib/bundler/installer/gem_installer.rb#L57)

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

Gemstash lives is `~/.gemstash`, stores cached & private gems
- by default, uses SQLite to store details 

### Gem in a box
Another gem caching solution, older than gemstash, more of a gem server than a cache. Uses [gemirro](https://github.com/PierreRambaud/gemirro), as a dependency for creating a RubyGems mirror.
