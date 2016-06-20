# rbenv
One option for Ruby dev environment manager (RVM is the other). rbenv works with Bundler to manage dependency versions and versions for Ruby AND Rails.
- rbenv is lighter than rvm
- does not include mechanisms to install ruby implementations
- manages multiple Ruby environments, allowing quick switches between implementations, locally or system-wide

### How It Works
Uses shim executables injected into your `PATH`, to determine which ruby installation to pass commands to
- `~/.rbenv/shims` is added in front of the `PATH`
- through **rehashing** rbenv maintains shims in that directory to match every Ruby command across every installation of Ruby
  - (commands like `irb`, `gem`, `rake`, `rails`, `ruby`)
- **Shims** are executables that pass commands to rbenv
  - Searches `PATH` for executable (like `rake`)
  - Finds rbenv shim named `rake` at the beginning of `PATH` (in shims directory)
  - Run the shim named `rake` which passes the command along to rbenv
