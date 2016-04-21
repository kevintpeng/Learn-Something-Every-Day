# `sed`
Sed is a **s**tream **ed**itor. It is it's own Domain Specific Language. 

### `s` for substitution
Uses regex, changes "day" to "night" from file "old" into file "new":
```sh
sed s/day/night/ < old >new
```
[source](http://www.grymoire.com/Unix/Sed.html)
