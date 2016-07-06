# Gems
Have a name, version, platform. Platform describes CPU architecture, OS or os versions. 
- `lib/` contains code for the gem
- `test/`
- `Rakefile` uses rake to automate tests, perform tasks
- `bin/` collection of executable files
- `.gemspec` file contains information about the gem, test info, platform, version number, author's name + email

## RubyGems
Package management framework for Ruby, `gem` is the cli.
- `gem fetch gemname && gem unpack gemname` allows you to audit a gem's content without installation.
- `gem build mygem.gemspec` builds a gem that you create or modify into a `.gem` file, which can be installed locally 
- `gem install mygem` installs a gem from rubygems server or locally
- `gem push mygem-1.0.0.gem` pushes to rubygems.org

RubyGems modifies Ruby load path, controlling how Ruby code is found by the `require` statement.
- adds lib's directory to Ruby `$LOAD_PATH`

### Under the Hood
- `gem install`
