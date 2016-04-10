You have a test string SS. Your task is to match the pattern Xxxxx.Xxxxx.
Here, xx denotes a word character, and XX denotes a digit.
SS must start with a digit XX and end with . symbol.
SS should be 66 characters long only.
```
^\d\w\w\w\w\.$
```

You have a test string SS. Your task is to match the pattern xxxXxxxxxxxxxxXxxxxxxXxxxxxxxxxxXxxx
Here xx denotes any word character and XX denotes any non-word character.
```
\w\w\w\W\w\w\w\w\w\w\w\w\w\w\W\w\w\w
```
Your task is to match the pattern xxx.xxx.xxx.xxx where xx denotes any character (other than the newline).
```
...\....\....\....
```
You have a test string SS. Your task is to match the pattern xxXxxXxxxx
Here xx denotes a digit character, and XX denotes a non-digit character.
```
\d\d\D\d\d\D\d\d\d\d
```

You have a test string SS. Your task is to match the pattern XXxXXxXX
Here, xx denotes whitespace characters, and XX denotes non-white space characters.

```
\S\S\s\S\S\s\S\S
```
