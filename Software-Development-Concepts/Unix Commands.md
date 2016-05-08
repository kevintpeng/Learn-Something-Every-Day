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

### Find
For finding files. Allows user to execute other commands on them. In the following cmd, `pattern` describes a glob pattern for finding files:
```sh
find . -name "pattern" -print
```
