# Regular Expressions
### Theory
A regular expression is a series of characters that define a search pattern.
- a **formal language** is a set of strings of symbols that may be constrained by rules 
  - the alphabet of a formal language is the (often finite) set of symbols and letters that can form strings
  - in complexity theory, decision problems are formal languages and complexity classes are sets of formal languages
- a **regular language** is a formal language that can be expressed with regular expressions
  - many formal languages cannot be expressed as regular expressions

### In Practice
- Start with ^ and end with $ to match the whole string to the regex.
- Since usually trying to match for a string S, not find substring R in S, we use the /^*regex*$/ method to apply it to the *whole* string
- *regex*{3,} will match three or more times
- `\b` is a word boundary (before first \w in matched string, between a \w and \W, after last \w)
    - `/\bis\b/` would match "This **is** cool", not "Th**is** is cool" because it needs to start at a word boundary
- `?` after any quantifier (`*?`, `{1,5}?` etc...) is *Lazy* quantifier (no ? is called greedy). Lazy matches as few as possible
- `()` capturing and `(?: )` non-capturing used to group part of the regex and apply quantifiers.
- `\1`, `\2` match the first and second capturing groups again (references). `(\w)(\w)\w\2\1` will match any 5 letter palindrome
- backreferencing to a capturing group that matches nothing is different from backreferencing to a capturing group that did not participate in the match.
    - Matches nothing: `(b?)o\1` matches "o" where b? matches nothing so \1 doesn't either
    - Doesn't participate: `(b)?o\1` fails to match "o" for most flavors (except JavaScript). (b) is optional, o matches, \1 references a group that did not participate so backreference fails (\1 has nothing to reference).
- Fowardreferencing is using backreferences before grouping, and it is evaluated after the group is matched.
- Branch reset groups `(?|regex)` is used to choose on from multiple possible capturing groups and assigns it to one given group number
  - `(x)(?|(a)|(bc)|(def))\2` matches `xaa`, `xbcbc`, or `xdefdef`, each assigned to number `2`

[source](http://www.regular-expressions.info/refadv.html)
