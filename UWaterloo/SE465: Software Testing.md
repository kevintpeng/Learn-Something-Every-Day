# [Software Testing](https://ece.uwaterloo.ca/~lintan/courses/testing/)
[piazza](https://piazza.com/class/ja1fsztq51yi9), [learn](https://learn.uwaterloo.ca/d2l/le/content/359316/Home?itemIdentifier=TOC)
### Summary
- design test subsets
- daikon is invariant-based bug detection
- to fund bugs requires a specification
- looks for patterns in values to deterime invariants dynamically

### [Fault, Error, Failure](https://bitbucket.org/lintan/testing18/raw/b93cad84c4bf15eb63cefa1d4f77678163311ea4/03-FaultErrorFailure.pdf)
- Fault == Bug, incorrect code
- Error is incorrect, unobserved state
- Failure is externally incorrect behaviour
- program counter is the instruction that has been executed
- an error is the first state where it does not follow specification

Program must be RIP for a failure to occur: Reachable, incorrect state, propagates to output

Avoidance, Detection (testing), Tolerance (redundancy)

