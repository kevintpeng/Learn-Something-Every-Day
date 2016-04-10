

## Introduction

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

## Matching Specific Characters
You have a test string SS.
Your task is to write a regex that will match SS with following conditions:

    SS must be of length: 6
    First character: 1, 2 or 3
    Second character: 1, 2 or 0
    Third character: x, s or 0
    Fourth character: 3, 0 , A or a
    Fifth character: x, s or u
    Sixth character: . or ,

```
^[123][120][xs0][30Aa][xsu][,\.]$
```

You have a test string SS.
Your task is to write a regex that will match SS with the following conditions:

    SS must be of length 6.
    First character should not be a digit ( 1,2,3,4,5,6,7,8,91,2,3,4,5,6,7,8,9 or 00 ).
    Second character should not be a lowercase vowel ( a,e,i,oa,e,i,o or uu ).
    Third character should not be b, c, D or F.
    Fourth character should not be a whitespace character ( \r, \n, \t, \f or <space> ).
    Fifth character should not be a uppercase vowel ( A,E,I,OA,E,I,O or UU ).
    Sixth character should not be a . or , symbol.

```
^\D[^aeiou][^bcDF]\S[^AEIOU][^,\.]$
```

You have a test string SS.
Your task is to write a regex that will match SS using the following conditions:

    SS must be of length, greater than or equal to 5.
    First character should be a lowercase alphabet.
    Second character should be a positive digit.
    Third character should not be a lowercase alphabet.
    Fourth character should not be a uppercase alphabet.
    Fifth character should be an uppercase alphabet.

```
^[a-z][1-9][^a-z][^A-Z][A-Z]
```
