- Start with ^ and end with $ to match the whole string to the regex.
- Since usually trying to match for a string S, not find substring R in S, we use the /^*regex*$/ method to apply it to the *whole* string
- *regex*{3,} will match three or more times
- `\b` is a word boundary (before first \w in matched string, between a \w and \W, after last \w)
- `?` after any quantifier (`*?`, `{1,5}?` etc...) is *Lazy* quantifier (no ? is called greedy). Lazy matches as few as possible
- `()` capturing and `(?: )` non-capturing used to group part of the regex and apply quantifiers.

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

## Repetition
You have a test string SS.
Your task is to write a regex that will match SS using the following conditions:

    SS must be of length equal to 45.
    The first 4040 characters should consist of letters(both lowercase and uppercase), or of even digits.
    The last 55 characters should consist of odd digits or whitespace characters.
```
^[A-Za-z24680]{40}[13579\s]{5}$
```

You have a test string SS.
Your task is to write a regex that will match SS using the following conditions:

    SS should begin with 1 or 2 digits.
    After that, SS should have 3 or more letters (both lowercase and uppercase).
    Then SS should end with up to 3 . symbol(s). You can end with 0 to 3 . symbol(s), inclusively.
```
^\d{1,2}[A-Za-z]{3,}\.{0,3}$
```

You have a test string SS.
Your task is to write a regex that will match SS using the following conditions:

    SS should begin with 22 or more digits.
    After that, SS should have 00 or more lowercase letters.
    SS should end with 00 or more uppercase letters

```
^\d{2,}[a-z]*[A-Z]*$
```

You have a test string SS.
Your task is to write a regex that will match SS using the following conditions:

    SS should begin with 11 or more digits.
    After that, SS should have 11 or more uppercase letters.
    SS should end with 11 or more lowercase letters.

```
^\d+[A-Z]+[a-z]+$
```
Write a RegEx to match a test string, SS, under the following conditions:

    SS should consist of only lowercase and uppercase letters (no numbers or symbols).
    SS should end in s.
```
^[A-Za-z]*s$
```

## Grouping and Capturing
You have a test String SS.
Your task is to write a regex which will match word starting with vowel (a,e,i,o, u, A, E, I , O or U).
The matched word can be of any length. The matched word should consist of letters (lowercase and uppercase both) only.
The matched word must start and end with a word boundary.
```
\b[aeiouAEIUO][A-Za-z]*\b
```

You have a test String SS.
Your task is to write a regex which will match SS with the following condition:

    SS should have 33 or more consecutive repetitions of ok.
```
(ok){3,}
```

