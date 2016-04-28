# `sed`
Sed is a **s**tream **ed**itor. It is it's own Domain Specific Language.

### `s` for substitution
Uses regex, changes "day" to "night" from file "old" into file "new":
```sh
sed s/day/night/ < old >new
```

sed is *line oriented*:
```
# file
one two three, one two three
four three two one
one hundred

sed 's/one/ONE' <file

ONE two three, one two three
four three two ONE
ONE hundred
```

- `s` substitute command
- /../../ Delimiter
- one Regular Expression
- ONE replacement string
- ' ' quoting will take meta-characters, good practice

### Slash Delimiter
Slash is convention. Say you need to search with slashes for file directories. It is advantageous to use another character, say `_`. Any character works, as long as it's 3 delimiters.

### & as matched string
Say you want to put brackets around a word. `&` is a special character for the string that you matched. `sed s/[a-z]*/(&)/ <old >new`

### `-r` for extended Regular Expression
For more advanced regex, like `+` meta-character. `sed -r 's/../../'`


[source](http://www.grymoire.com/Unix/Sed.html)
