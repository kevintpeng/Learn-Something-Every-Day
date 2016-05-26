# Environment
### Shell initialization files
- `/etc/profile` is systemwide bash profile
- `/etc/bashrc` has bash-specific configurations (so does `zshrc`)
- `~/bash_profile` user specific config
- `~/bashrc` read after system wide bashrc, aliases and stuff

### Variables
- Global varaibles are available in all shells, display with `env` command. 
- Local variables are available in the current shell, display with `set` command.
- `MYVAR="Hello"` defines a local variable in the current shell
- `export MYVAR` adds it to *environment* variables which allows child processes to have access 

### Shell Expansion
