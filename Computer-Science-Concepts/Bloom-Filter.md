# [Bloom Filter](https://en.wikipedia.org/wiki/Bloom_filter)
Probabilistic data structure for estimating set membership
- returns "probably in set" or "definitely not in set" (no false negatives)
- *Empty Bloom Filter* is a bit array of size `m`, with `k` hash functions of uniform distribution, `k` << `m`, but based on the intended false positive rate
- to add, pass element through each hash function and set bits to 1
- to query, an element is passed through each k hash functions, and if mapped to any 0s, it is definitely not in the set
- if all bits are 1, then it is either in the set (since it would have been added) or it is a false positive (all k bits are by chance set to 1)
