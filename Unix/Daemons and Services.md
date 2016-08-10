# Daemon
- a program that runs as a background process, not under direct control of an interactive user
- usually, parent process of a daemon is the `init` process
  - created by forking a child process and immediately exiting, causing init to adopt it as a child process
  - also created directly by init

# Systemd 
`systemd` is a suite of basic building blocks for service management.
- runs as PID 1 and starts the rest of the system

# runit
is an init scheme for unix-like operating systems.
- initializes and supervises processes throughout the os
- features parallelization of the start up of system services
- is an init daemon, it is the acestor of all other processes (since it is the first process started during booting

# Upstart
