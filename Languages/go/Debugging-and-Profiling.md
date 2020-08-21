# Debugging and Profiling
[dlv](https://github.com/go-delve/delve/tree/master/Documentation/cli) is a good golang debugger
- `b` to set breakpoints
- `c` to continue
- `n` to step over
- `s` to step
- `call` to call function
- `print` to check state

### Profiling and Benchmarking
Profiling is determining which methods are called and for how long.

Benchmarking compares two pieces of code and score each's relative performance.

golang has a built-in profiler. When profiling a go test, you can simply pass additional parameters
- `test.cpuprofile <filepath>` which will tell us where the cpu is spending cycles and time, but is not full tracing where it would tell us how much time is spent in each function.

view the output with `go tool pprof --text cprof`, adding output type `--text`, `--web` or `--list=funcname`
