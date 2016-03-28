# glob
Specifies sets of filenames using wildcard characters.

**Wildcard**    | **Description**   | **Example**
----------------|-------------------|-------------
`*`             | matches anything  | *.txt => [README.txt, anytextfile.txt ...]
`?`             | matches a single character | ?at => [cat, bat, sat...]
`[abc]`         | matches one of given characters | [CB]at => [Cat, Bat]
`[a-z]          | matches one char in range | 
`[!abc]`        | matches one char not in given |
[!a-z]          |                               |
