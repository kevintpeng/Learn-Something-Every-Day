# Unix Environment
The environment is defined by **environment variables**.
```bash
TEST="Hello World"
echo $TEST
# Hello World
```
The terminal reads variables from `/etc/profile` and `profile` on initialization.

### Setting the PATH
PATH defines a list of locations where the terminal should look for commands. Each path is separated by a `:` colon character. The following command defines a `PATH`:
```bash
PATH=/bin:/usr/bin
```
