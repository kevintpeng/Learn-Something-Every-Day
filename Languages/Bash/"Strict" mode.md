tl;dr, a safe way to program, for script, by adding these lines of code at the top of bash scripts for reliability.
```
#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
```

### `set`
A builtin that changes shell options. See [manual](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html).
- `set +e` disables option `e`, `set -e` enables
- `set -e` causes bash to exit if any command has a non-zero exit status
  - makes silent errors exit loudly, if last cmd of script succeeds, then script exits with 0, potentially hiding errors
- `set -u` exits bash if a variable that does not exist is referenced
- `set -o pipefail` makes exit code of pipelines that of a failing command instead of last command:
```bash
$ grep some-string /non/existent/file | sort
grep: /non/existent/file: No such file or directory # grep returns exit 2, sort has nothing to sort, returns exit 0
$ echo $?
0
``` 

### IFS
The Internal Field Separator controls *word splitting* (or tokenization). 
- When set to a string, each char in the string is considered by Bash to separate words
- changes how bash iterates through sequences
- kind of niche change, but makes iterating through lists more intuitive:
```bash
names=(
  "Wayne Gretzky"
  "David Beckham"
)

IFS='\n' # parse each line instead of each word
for name in ${names[@]}; do
  echo $name
done
# Wayne Gretzky
# David Beckham
```

[source](http://redsymbol.net/articles/unofficial-bash-strict-mode/)
