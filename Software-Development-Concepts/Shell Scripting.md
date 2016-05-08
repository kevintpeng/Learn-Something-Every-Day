Shells are command interpreters. They are applications that provide users with the ability to give commands or execute batches of commands quickly. Shell scripts are sequences of shell commands

1. Write script
2. Execute `chmod permission script-name` setting execution permissions, (permission is 3-digit octal value)
3. Execute using `sh`, `bash`, `./`

#Shell Scripting
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
##Special variables
```
$?     # special character for error message after cmd, called Exit Status
$0 is the file name, $1 is first argument, $2 2nd … (all are const vars)
$# is number of arguments
```
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
expressions [ $i -le 10 ] less, [ $i -eq 5] equal
-eq equal, -ne not equal, -lt less than, le less-equal, -gt, -ge

for i in 1 2 3 4 5 6 7     # loop from 1-7
for((i=1;i<=7;i++)) 
do    # equivalent syntax

Exit if no args
if [ $# -eq 0 ]
then
echo "Error - Number missing form command line argument"
echo "Syntax : $0 number"
echo "Use to print multiplication table for given number"
exit 1
fi
```


## Cron (using crontab)
```
min hour day-of-month month d-o-week cmd
59 12 * * *     # at 12:59 in afternoon, run cmd
```


- [new source](http://guide.bash.academy/)
- [source](http://mywiki.wooledge.org/)
