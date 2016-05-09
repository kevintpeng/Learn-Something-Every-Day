# Bash
Shells are command interpreters. They are applications that provide users with the ability to give commands or execute batches of commands quickly. 

Almost everything in bash is a **string**. Command names, variable names, contents of variables, filename ...

### Types of Commands
#### Aliases
Shortened command (only in interactive shells, not in scripts). An alias is a *word* mapped to a *string*. `alias nmapp="nmap -Pn -A --osscan-limit"` then allows you to write:
```bash
$ nmap -Pn -A --osscan-limit 192.168.0.1
$ nmapp 192.168.0.1 # is entirely equivalent
```

#### Functions
More powerful aliases. Unlike aliases, they can be used in scripts. Function contains shell commands and can take arguments and create local variables. 

#### Builtins
Bash's basic commands like `cd`, `echo` ...

#### Keywords
Like builtins, with special parsing rules. For example, `[` is a bash builtin, while `[[` is a bash keyword. They both test expressions. `[ a < b ]` evaluates as a redirect of `b` into `[ a ]`. `[[ a < b ]]` tests `a < b` as a boolean function, `<` doesn't have its typical meaning when it's used with the extended test `[[` keyword.

#### Executables
aka *External commands* or *applications*. Often invoked by typing its file path or its name if its location is in the `PATH` variable (write file paths as `/opt/somedir/myprog` or `./myprog` for relative path). `PATH` is a list of directories. Bash searches through `PATH` if the name isn't used as a keyword, builtin, or function. 


### Shell Scripting

Shell scripts are sequences of shell commands.

1. Write script, begin with `#!/bin/bash` 
    - this header is called an **interpreter directive** (the `#!` is a shebang), specifying which shell to use as the interpreter.
2. Execute `chmod permission script-name` setting execution permissions, (permission is 3-digit octal value)
3. Execute using `sh`, `bash`, `./`

```
myvar=5
echo $myvar
echo “hello \c”; whoami    # prints the output of cmd
expr 1 + 3     # evaluates arithmetic
` execute cmd, ' express literal string, " allows escape 
read varname     # takes user input, stores in varname
ls a*.c     # all c files start with letter a
ls fo?     # all 3 letter files starting with fo
```
### Special Characters
- `" "` whitespace delimits arguments
- `$` expansion, introduces various types of expansion (it substitutes an expression with its return value)
- `''` single quotes, literal strings with no special characters, no split strings by spaces 
- `""` double quotes, preserves spaces, keeps as one string, **allows special characters**.
- `[[ ]]` Test, an evaluation of a conditional expression
- `!` Negate
- `><` Redirection
- `|` Pipe, output of initial cmd as input to second cmd
- `;` newline, command separator
- `{}` inline group, commands inside braces are treated as if they were one command. (convenient oneline functions)
- `()` subshell group, acts like inline group, but creates a sandbox (executes in a subshell), cannot mutate any data in current shell
- `(( ))` arithmetic epxression, characters such as `+`,`-`,`*`,`/` are treated as math operators for calculations.
- `$(( ))` arithmetic expansion, similar to arithmetic expression, but the epxression is replaced with the result of the evaluation.
- `~` home directory

### Parameters
A short named space in memory for data retrieval and storage. 
- **special parameters** are read-only pre-set by BASH. All special parameters need to be **expanded** with `$`:
    - `0`, contains the name or path of script
    - `1` is a **Positional Parameter**, contains first argument passed to script (continues 2,3...)
    - `*`, expands to all words of all positional parameters. In double quotes, expands to a single string.
    - `@`, expands to all words of all positional parameters. In double quotes, expands to a list of them as individual words.
    - `#`, expands to number of parameters
    - `?`, expands to exit code of most recently completed command
    - `$` expands to the PID (process ID) of the current shell.
    - `!` expands to most recent command executed in background
    - `_` expands to the last argument of the last command executed
- **variables** can be assigned a value with `varname=value`. Some given variables:
    - `BASH_VERSION`, `HOSTNAME`, `PPID` (parent process of this shell), `PWD`, `RANDOM` (between 0 and 32767 for every expansion), `UID`, `HOME`, `PATH` (colon separated list of paths for finding commands)


## Redirection of std I/O + Pipes
```
ls > filename     # outputs to filename
date >> myfile     # outputs to the end of myfile
cat < myfile     # cat displays myfile
sort < sname > sorted_names # first sorts sname, then outputs to sorted_names
ls | less         # output of ls displays in less
order of operations: reads left to right, cmd take < input before running
Filter: If cmd accepts input from standard input and produces standard output
```
## Commands
```
tail        displays end of file, -20, -25 display -x number of lines
head        displays start of file
ps        show processes, `ps aux` shows all
```

## Structuring Logic
```
`bc` opens bash cmd line
if condition
then
    cmd # indentation not required
else
    cmd
fi
conditions: [ bool expression ]
# expressions [ $i -le 10 ] less, [ $i -eq 5] equal
-eq equal, -ne not equal, -lt less than, le less-equal, -gt, -ge

for i in 1 2 3 4 5 6 7     # loop from 1-7
for((i=1;i<=7;i++)) 
do    # equivalent syntax

# Exit if no args
if [ $# -eq 0 ]
then
echo "Error - Number missing form command line argument"
echo "Syntax : $0 number"
echo "Use to print multiplication table for given number"
exit 1
fi
```
#### Case
```bash
case word in
  pattern1)
     Statement(s) to be executed if pattern1 matches
     ;;
  pattern2)
     Statement(s) to be executed if pattern2 matches
     ;;
  pattern3)
     Statement(s) to be executed if pattern3 matches
     ;;
esac
```
## Cron (using crontab)
```
min hour day-of-month month d-o-week cmd
59 12 * * *     # at 12:59 in afternoon, run cmd
```


- [new source](http://guide.bash.academy/)
- [source](http://mywiki.wooledge.org/)
