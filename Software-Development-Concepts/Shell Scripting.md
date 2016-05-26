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
A short named space in memory for data retrieval and storage.  There three types of parameters, Strings, Integers and Arrays.
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
    - `local` defines a variable only accesible in the scope of definition (within a function)

#### Variable Types
Strings are most common, default type for most things
- Integers can be assigned
- Arrays are indexed list of strings 
    - `names=([0]="Bob" [1]="Paul")` defines array. Notice it maps integers to strings 
    - array expansion: `cp "${myfiles[@]}" /backups/` as list of elements
    - An IFS (Internal Field Separator) can be used to specify character delimeter 
        - `( IFS=,; echo "Today's contestants are: ${names[*]}" )`
        - in subshell so default IFS isn't overwritten

### Quoting
Quoting removes special meaning of characters and words. 
- `\` escapes a single character
- `''` single quotes preserve literal value of each char enclosed
- `""` double quotes preserve literal values except `$`, `\` and \`\` backticks

### Shell Expansion
A command is first tokenized, then one of 8 expansions is performed on each token, followed by quote removal.
- **brace expansion** generates a set of strings (first expansion)
    - `sp{el, il, al}l` => `spell spill spall` (prefixes and postfixes to each option)
- **tilde expansion** is

### Patterns
Patterns are important for selecting filenames. Three kinds of pattern matching. [Glob Patterns](../Glob Patterns.md) is good for file matching. Regex are used for specific pattern matching, not file matching. `=~` operator inside `[[` keyword lets you compare `[[ string =~ regex ]]` that returns `0` if true, `1` if false, `2` if pattern is invalid. 

## Tests and Conditionals
### Exit Status
Every command has an exit code whenever it terminates. Exit code is used by whatever application started it to evaluate whether everything is OK. It's like a return value for every function (int between 0-255). **0 is success** and anything else is some sort of failure (hints at what went wrong). Should always return an exit code using `exit` builtin.

### Control Operators && and ||
easiest way of performing actions depending on success is using cointroler operators `&&` and `||`. **Conditional execution** is using the `AND` and `OR` operators to determine whether the second command should be run. Works as you'd expect, second cmd runs if 
- `&&`, first is successful
- `||`, first is not successful

*cleaner and more idomatic running code with simple control flow*.

### Grouping Statements
Important for complex condition execution statements. `{}` are used to group statements. `grep && grep && {rm || {echo error 2>&1; exit 1}}` will only print error for rm errors and not grep errors, groups the whole error handling together too.

### Conditional Blocks `if` `test` and `[[`
`if; then; fi` structure for if statements. `test` or `[` is used to test things and return exit statuses. `[` is the same as `test`, which is a normal command that reads its arguments and evaluates it as a boolean expression. `[` expands variables like `n="my name"` to multiple arguments, `[ $n = "my name" ]` has too many arguemnts since it expands to `[ my name = "my name" ]`. Correct way is `[ "$n" = "my name" ]`.

More advanced version is `[[`, which includes pattern patching: `[[ $filename = *.png ]] && echo "$filename looks like a PNG file"`. `[[` is not a normal command, it's a **shell keyword** with magical powers. 

Subtlety with `=` operator; right hand is always evaluated as a pattern unless quoted:
```
$ foo=[a-z]* name=lhunath
$ [[ $name = $foo   ]] && echo "Name $name matches pattern $foo"
Name lhunath matches pattern [a-z]*
$ [[ $name = "$foo" ]] || echo "Name $name is not equal to the string $foo"
Name lhunath is not equal to the string [a-z]*
```

### Looping
```
for file in $(ls *.jpg)
do echo $file
done
```
This parses the results of the command space delimited, so files with spaces will be parsed as separate arguments. 

To fix, use quotations around the subshell to properly delimit arguments:
```
for file in "$(ls *.jpg)"
do echo $file
done
```

## [Arrays](http://mywiki.wooledge.org/BashGuide/Arrays)

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
