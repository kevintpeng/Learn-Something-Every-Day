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

### Structural Coverage
Static Testing at compile time involves review through code inspection (code review)

Dynamic Testing includes black and white box testing

Need testing critera to define coverage 
- test case is fed into a program, many is a test set
  - prefix and postfix values as specification
- measuring test set effectiveness depends on use case/criteria
- **coverage**: given set of test requirements `TR` for a coverage criterion `C`, a test set `T` satisfies `C` iff forall `tr` in `TR`, exists some `t` in `T` s.t. `t` satisfies `tr`
- coverage level helps us evaluate effectiveness of a test set, helps to find infeasible test requirements

**Subsumption**: a test criterion C1 subsumes C2 iff forall test sets that satisfy C1 also satisfy C2. In other words, A subsumes B if it's a strictly weaker coverage criterion
- edge coverage subsumes node coverage
- branch coverage subsumes statement (node) coverage

### Control Flow Graph

