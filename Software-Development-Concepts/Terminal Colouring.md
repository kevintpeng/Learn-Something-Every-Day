Output messages can be styled in terminal.
- `\x1b[` is the escape character, followed by the list of numbers delimited by `;`, then `m` 
  - example: `\x1b[35;43mSome Text` sets purple text, orange background
  - 30-37 selects foreground colour
  - 40-47 selects background colour
  - 1 bold, 4 underline
- `\1xb[0m` resets style
