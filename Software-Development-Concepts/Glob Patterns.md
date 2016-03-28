# glob
Specifies sets of filenames using wildcard characters. Used in unix terminal for specifying groups of files. Notably used in `.gitignore`.

**Wildcard**    | **Description**   | **Example**
----------------|-------------------|-------------
`*`             | matches anything  | *.txt => [README.txt, anytextfile.txt ...]
`?`             | matches a single character | ?at => [cat, bat, sat...]
`[abc]`         | matches one of given characters | [CB]at => [Cat, Bat]
`[a-z]`         | matches one char in range | 
`[!abc]`        | matches one char not in given |
[!a-z]`         |                               |

- in some cases (gitignore) you can start patterns with a foward slash `/` to avoid recursivity
- end a pattern with `/` to match directories

Example of gitignore:
```
# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory
doc/**/*.pdf
```
