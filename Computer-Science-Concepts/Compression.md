# Compression -- [source](https://en.wikipedia.org/wiki/Data_compression)
Encoding information using fewer bits than the original representation.

## Lossless
- **lossless** compression reduces bits by identifying and reducing statistical redundancy
  - redundancy measures the fractional difference. It is reduced by compression, or increased for checksums
  - lossless is revertable
  - *run length encoding* takes advantages of consecutive data elements
  - LZ77 & LZ78 -- [TODO](https://www.cs.duke.edu/courses/spring03/cps296.5/papers/ziv_lempel_1977_universal_algorithm.pdf)

### Huffman Coding
**Prefix Code** is a system which posesses the *prefix property*, stating that no whole code word in the system is a prefix of any other code word in the system.
- `{9, 55}` and `{5, 95}` both satisfy, `{5, 59}` does not 
- prefix codes can be used to send messages without needing markers to delimit words, since the prefix property allows unambiguous decoding 

## Lossy
- **lossy** compression reduces bits by removing unnecessary information
### Interframe vs. Intraframe
- interframe tracks differences between frames
  - high computation, lots of space optimization
- intraframe compression works on each frame 
  - fast to compute final result, more space needed
