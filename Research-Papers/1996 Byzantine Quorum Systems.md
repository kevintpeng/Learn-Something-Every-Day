# [Byzantine Quorum Systems](http://pmg.csail.mit.edu/papers/osdi99.pdf)
[Byzantine Generals' Problem](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/12/The-Byzantine-Generals-Problem.pdf) is an agreement problem, where armies surround a city and must decide to attack or retreat, with the presence of traitorous generals.
- the algorithm must allow (A) all loyal generals to agree upon the same plan of action, and (B) guarantee that a small number of traitors cannot cause the loyal generals to adopt a bad plan
- if it's formalized as V(i) is some information for the `i th` general, then we achieve the desired results by having all loyal generals use the same method for combining and using a robust method to do so

For A, we need

1. every loyal general to obtain the same information. *Can't use value obtained directly from the `i th` general, otherwise he could send different values to different loyal generals*
2. if `i th` general is loyal, then the value he sends must be used by every loyal general as v(i). 
