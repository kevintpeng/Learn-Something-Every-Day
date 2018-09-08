# String Encoding
Strings have no use without knowing encoding. String encoding has a messy history. 8-bit encoding only provided a sound system for english speakers.

## ASCII (American Standard Code for Informaiton Interchange)
Old standard for string encoding. Maps each character to a bit sequence. Now incorperated into Unicode.

## Unicode
Unicode is a 16-bit code, but it doesn't just map bits to characters. A letter maps to a **code point**. `U+0639` is a code point, U means unicode plus a hex value. This information needs to be stored in bits still.

#### Encoding
This code point could be stored in say two bits. The order of the bits is declared in the *unicode byte order mark* (`FF FF` or `FF FE`). 

#### UTF-8
Another system for storing string of Unicode code points in 8-bits. This solves issue of wasted storage for english, and code points are encoded in just two hex values, exactly like **ASCII** and **ANSI**.

## Ruby Strings
Strings use UTF-8
