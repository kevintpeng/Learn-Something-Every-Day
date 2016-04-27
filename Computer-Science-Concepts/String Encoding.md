# String Encoding
String encoding has a messy history. 8-bit encoding only provided a sound system for english speakers.

## Unicode
Unicode is a 16-bit code, but it doesn't just map bits to characters. A letter maps to a **code point**. `U+0639` is a code point, U means unicode plus a hex value. This information needs to be stored in bits still.
#### Encoding
This code point could be stored in say two bits. The order of the bits is declared in the *unicode byte order mark* (`FF FF` or `FF FE`).
