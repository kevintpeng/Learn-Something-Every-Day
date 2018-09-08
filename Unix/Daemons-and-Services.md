
## SysV
Runs scripts in `/etc/init.d`


### runlevels
Part of SystemV, in `/etc/rc.d/`, based on the distro you have folders or files defining each runlevel
- `rc` for "run commands" defines what is run at each runlevel
- a runlevel is the point at which the system is entered, or the level at which the user begins accessing the computer
- 1 is low-level, 5 is high-level for GUIs

### Systemd 
`systemd` is a suite of basic building blocks for service management.
- runs as PID 1 and starts the rest of the system
- `/usr/lib/systemd` holds configurations

![systemd diagram](http://core0.staticworld.net/images/article/2014/10/systemd-diagram-100528171-orig.png)

### Upstart
Used on Ubuntu by default

### Launchd
Used on macOS

[TODO](http://www.tuicool.com/articles/qy2EJz3)

### runit -- [TODO](http://rubyists.github.io/2011/05/02/runit-for-ruby-and-everything-else.html)
is an init scheme for unix-like operating systems.
- initializes and supervises processes throughout the os
- features parallelization of the start up of system services
- is an init daemon, it is the acestor of all other processes (since it is the first process started during booting

# Daemon
- a program that runs as a background process, not under direct control of an interactive user
- usually, parent process of a daemon is the `init` process
  - created by forking a child process and immediately exiting, causing init to adopt it as a child process
  - also created directly by init
  
### systemd Unit Files -- [source](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
`.service` files, in `/usr/lib/systemd/system/` have unit types:
- `simple` does not block on start process, becoming "active" immediately after forking off the first process
  - hard to debug errors
- `oneshot` blocks on start operation until the first process exits. The status is reported as "activating"
  - once start process completes, "activating" transitions straight to "inactive"
- `forking`, process configured with `ExecStart=` will call `fork()` as part of its startup. `PIDFile=` is used so that systemd can identify the main process of the daemon
- `Environment=` specifies variables accessible by `Exec` commands
- `ExecStart=` specifies exactly one command with arguments that is run when the service is started

Basic service:
```
[Unit]
Description=Foo

[Service]
ExecStart=/usr/sbin/foo-daemon
```
