### nc
Netcat is a computer networking utility for reading and writing to network connections using TCP or UDP
- used as a dependable backend 
- nc -l 9292

### ssh
For logging into remote machines. `ssh hostname`
- connects and logs into the specified *hostname* 

### man
Manual pages for any command line tool. `man some-command` pulls up help info about a command.

### `touch a b c`
Creates or updates last write date of files a,b and c.

### echo
Echo is a print cmd to standard output. Takes arguments and prints them delimited by spaces. alternatively, can take a literal string using quotes.
```
$ echo Some      Test
Some Test
$ echo "Some      Test"
Some      Test
```

### source
Evaluates the file (could be a shell script for example) following the command, as a list of commands, executed in current context.

### builtin
builtin commands are contained within the shell itself. Does not invoke another program.

### Find
For finding files. Allows user to execute other commands on them. In the following cmd, `pattern` describes a glob pattern for finding files:
```sh
find . -name "pattern" -print
```
