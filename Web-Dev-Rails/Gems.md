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

### Basics
RubyGems modifies your Ruby load path, controlling how code is found by the `require` statement
- `require` a gem, places the gem's `lib` directory onto your `$LOAD_PATH`
- structuring of gems needs some sort of [file inclusion -- source](http://stackoverflow.com/questions/804297/when-to-use-require-load-or-autoload-in-ruby)
  - `require` is preferred in almost all cases. `load` will re-load code every time, inefficient
  - `autoload` is deprecated, some dependencies monkeypatch classes, meaning code behaviour can differ depending on what dependencies are loaded at the time (terrible to debug), however it makes sense for speed purposes with files in a gem
  - `require_relative` indicates a file path that is relative to the current file offering a good solution to loading project code
  - `require` is more for loading installed code, accessible by the whole system

### When to use Gems -- [source](https://robots.thoughtbot.com/to-gem-or-not-to-gem)
- examine code quality, structure, tests, code coverage, maintainence 
- adding gems to a project adds liabilities
- adds complexity, especially with DSLs
- Beneficially add knowledge, quicker integration, edge case handling
