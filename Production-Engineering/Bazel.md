# [Bazel](https://docs.bazel.build/versions/master/build-ref.html)
- BUILD files define packages, units of software to be built and referenced
- targets are individual elements in a package, usually files or rules
  - can be hidden or made public
- labels are prefixed with `//` and reference a target
  - can be read as `//package/name:target-name`, or if name == target-name then it can be omitted
- rules define a relationship between input and output files
  - `cc_binary` or `go_binary` are examples of build rules
  - name is the target, and deps are targets that this depends on
