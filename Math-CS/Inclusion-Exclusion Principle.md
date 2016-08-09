# The Inclusion-Exclusion Principle
The [sum principle](Counting.md#sum-principle) holds for disjoint sets. For non disjoint sets, we have the inequality: `|U Ai| ≤ ∑|Ai|` for i from 1 to n, of n sets A (Union of all sets is less than the sum of cardinalities). 

With more information, for sets A and B, `|A ∪ B| = |A|+|B| − |A ∩ B|`

So the general form of the Inclusion-Exclusion Principle is: 
```
|U Ai| = ∑|Ai| - ∑|Ai ∩ Aj| + ∑ |Ai ∩ Aj ∩ Ak| - ... + (-1)^(n-1)|A1 ∩ ... ∩ An|

Also written compactly as:
|U Ai| = ∑(-1)^(k-1) ∑ |Ai1 ∩ Ai2 ∩ ... Aik| 
    k from 1 to n    1 < i1 < i2 < .. ik < n
```
The following is a visual representation:
![venn diagram](https://upload.wikimedia.org/wikipedia/commons/3/3d/Inclusion-exclusion-3sets.png)
