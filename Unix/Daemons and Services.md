# Daemon
- a program that runs as a background process, not under direct control of an interactive user
- usually, parent process of a daemon is the `init` process
  - created by forking a child process and immediately exiting, causing init to adopt it as a child process
  - also created directly by init

### `service`
- command runs a System V init script 
