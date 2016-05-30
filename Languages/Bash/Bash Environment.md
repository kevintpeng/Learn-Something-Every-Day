# Environment
### Shell initialization files
- `/etc/profile` is systemwide bash profile
- `/etc/bashrc` has bash-specific configurations (so does `zshrc`)
- `~/bash_profile` user specific config
- `~/bashrc` read after system wide bashrc, aliases and stuff

### Variables
- Global/Environment varaibles are available in all shells, display with `env` command. 
- Local/Shell variables are available in the current shell, display with `set` command.
    - `set -e` sets a bash [option](/"Strict"%20mode.md)
- `MYVAR="Hello"` defines a local variable in the current shell
- `export MYVAR` adds it to *environment* variables which allows child processes to have access, using the bash `export` builtin

### Shell Expansion
A command is first tokenized, then one of 8 expansions is performed on each token, followed by quote removal.
- **brace expansion** generates a set of strings (first expansion)
    - `sp{el, il, al}l` => `spell spill spall` (prefixes and postfixes to each option)
- **tilde expansion** expands to the `$HOME` path
- **parameter expansion** with `$` replaces an expression with its value
  - for `${PARAMETER}`, the value of "PARAMETER" is substituted
  - braces are required when PARAMETER is follwed by a char, not part of the var name: `"plural: ${WORD}s"` 
- **command substitution** substitutes the output of a command with `$(command)` or backticks
- **arithmetic expansion** treats expression as double quotes, and after expansions, evaluates numerically: `$(( EXPRESSION ))`
  - `$[ EXPRESSION ]` performs calculation, no expansion?, no tests
- lastly, performs word splitting on expansions, then file name expansion with glob patterns
