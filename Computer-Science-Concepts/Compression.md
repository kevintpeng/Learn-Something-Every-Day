# Compression
Encoding information using fewer bits than the original representation.

### Lossless
- **lossless** compression reduces bits by identifying and reducing statistical redundancy
  - redundancy measures the fractional difference. It is reduced by compression, or increased for checksums
  - lossless is revertable
  - *run length encoding* takes advantages of consecutive data elements
  - LZ77 & LZ78 -- [TODO](https://www.cs.duke.edu/courses/spring03/cps296.5/papers/ziv_lempel_1977_universal_algorithm.pdf)
- **lossy** compression reduces bits by removing unnecessary information
