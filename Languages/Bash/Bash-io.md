# Input/Output
- `echo` builtin, options `-e` interprets backslash escaped characters, `-n` supresses trailing newline (prints on one line)
- `read [option] [VARNAME1]` builtin, reads user input, assigns to variables
- File descriptors are numbers that correspond to i/o streams: 0, 1, 2 are *stdin, stdout, stderr* respectively. 
  - each process has `/proc/<process_ID>/fd/<0-2>` (not on mac?)
- `M>N` M is a file descriptor, N is a filename
- `M>&N` M is a fd, N is also a fd (M defaults to 1, stdout)

When executing a command, following steps in order are:
  - if stdout of previous command is piped into stdin of current cmd, `/proc/<current_process_ID>/fd/0` targets same anonymous pipe as `/proc/<previous_process_ID>/fd/1`
  - if stdout of current cmd is piped to another, set ps output to another anonymous pipe
  
