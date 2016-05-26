File descriptors are numbers that correspond to i/o streams: 0, 1, 2 are *stdin, stdout, stderr* respectively. When executing a command, following steps in order are:
- if stdout of previous command is piped into stdin of current cmd, ... http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html
