### Object
#### `inspect`
displays an object in some defined, human-readable form, showing instance variables.

### Regex
- `/asdf/`
- `%r{asdf}`
- `=~` for finding index of matches
- `Regexp.quote(foo)` escapes all special characters in the the string foo
- To interpolate a string into a regex, `foo = "asdf"`, `if "asdfsdf" =~ /#{Regexp.quote(foo)}/`

### Running bash from ruby
#### `exec`
By using `Kernal#exec`, the ruby process is replaced by a process invoked by `exec`. By using exec, the command is subject to shell expansion. 
```ruby
exec "echo hello world" # will print hello world
exec {"myvar"=>"value"}, "echo $myvar" # passes myvar as an environment variable
```

??? Behind the scenes, process tree: some ruby process with `PID=3` will call `exec`, branches into two ruby processes (PID 3 and 4). In process 3, returns 4, in process 4 returns 0. Process 4 will turn into a bash process and process 3, still ruby, will wait for the output of process 4.

#### `system`
`system` method calls a system program, parsing the passed string as a command. returns true or false depending on system program exit code. Uses `STDIN`, `STDOUT`, and `STDERR` objects of the Ruby program to automatically print. Has another side effect of changing the global var `$?` which is set to a `Process:Status` object (includes PID and exit status). 

#### backticks
call a system program and **return its output**. 

### File
- `File.join(args)` joins the arguements to make a file path based on File::SEPARATOR

### Modules
Modules group together methods, classes, constants.
- Provide a namespace to prevent name clashes
- implement the mixin facility, eliminating the need for multiple inheritance
  - you can `include` a module in a class definition, then all module's instance methods are mixed in. So, mix-in modules effectively behave as superclasses.
  - Module methods can be defined like class methods.

#### `include`
`include` has nothing to do with files. It references a named module currently accessible. Does not copy functions into a class, creates a reference to them. With multiple classes including, they all point to the same thing.

For some class, you can use ruby's built in `Comparable` mixin, and `def <=>(other)` to define how to compare two objects.

#### Iterators and Enumerable Module
- need to `def each`: then include `Enumerable` module, which defines `map`, `include?`, `find_all?`
- need to `def <=>(other)`: then `max`, `min`, `sort` are available

### AutoLoad
`autoload :MyLibrary, 'mylibrary'` works like `require 'mylibrary'` but it only loads dependencies on the first time they're used rather than during the call itself. Symbol is the classname assigned, ruby file to be loaded is found using the relative file directory location.


### Useful Array Methods
- `Array#Permutation`
- `Array#Combination`
