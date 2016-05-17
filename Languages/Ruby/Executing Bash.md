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
