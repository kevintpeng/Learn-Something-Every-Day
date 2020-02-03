# CS444 Compilers
- LL(1) is a top-down parser which finds a parse tree or rejects some input. The goal is a linear time algorithm.
  - a grammar is LL1 iff |predict(A,a)| <= 1 for all A,a
  - more generally, this class of parsers is referred to as LL(k), where k = 1 in this case
- LR is a bottom-up parser
  - a **viable prefix** is a string of symbols that expands to a prefix of a valid sentence
- SLR(1) is same parser as LR(1), but they check viable prefix `Beta A alpha` differently
