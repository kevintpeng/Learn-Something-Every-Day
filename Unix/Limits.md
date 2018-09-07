# Limits
Unix systems put various sensible limits on the use of different resources. Open files, number of processes, locked files, cpu usage, etc can be limited.
- soft limits are the enforced limitation during the session, can be self-configured
- hard limits are the ceiling for the soft limit, set by admin
- processes inherit the limit of their parent process, so daemonized processes will likely inherit from pid 1

### `/proc/*/limits`
shows the current limits set for a running process. These limits are set based on a number of possible configuration locations.

### `ulimit`
Utility for setting limits at a user-level for system-wide resource usage, which is useful for shared systems. These are limits for the sum of all processes owned by a user.

### `/etc/security/limits.conf`
Part of linux's `pam_limits`, the persistent ulimits configuration file. Sets for logged in users, not for system processes
- config file for the `pam_module`, pluggable authentication module
- acts as adapter for multiple low level auth protocols (facade design pattern?)
- `/etc/security/limits.d/*` are other configurations loaded after `limits.conf`

pam_limits are enforced when a session is opened. They **do not** affect daemon processes

### `/etc/sysctl.conf`
Contains system-wide configurations, kernel-level configurations
- less graceful to hit limits here

[source](https://underyx.me/2015/05/18/raising-the-maximum-number-of-file-descriptors) for file descriptors limit
