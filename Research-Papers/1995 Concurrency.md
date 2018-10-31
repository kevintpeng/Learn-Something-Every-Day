# [1995 Are Safe Concurrent Libraries Possible?](https://plg.uwaterloo.ca/~usystem/pub/uSystem/LibraryApproach.pdf)
- code generation that are correct for sequential programs may have incorrect semantics for concurrent programs
- solutions that make correctness guarantees state potentially unreasonable requirements for the library designer and end programmer
  - by forbidding optimization, performance gains are lessened, which is often the reason for concurrency in the first place
  - requiring explicit deactivation of optimizations requires deep knowledge of the compiler, its optimizations, and may result is wildly different behaviour and correctness guarantees depending on the compiler implementation
- the conclusion of this paper is that concurrency is a linguistic feature that affects code generation

1. compiler loads variables into a register, then data modification doesn't get written back to the variable as needed and other threads won't see the changes
  - Dekker's and Petersons' algorthims (software solutions) use assignment
2. compiler might reorder instructions for optimization, which may cause reordering at the boundaries of critical sections
  - requires explicit language facilities (`volatile`) or concurrency constructs to disable optimization
3. instruction substitution (for multiple) can turn atomic operations into non-atomic operations
