# [2018 Performance analysis of cloud applications](https://www.usenix.org/conference/nsdi18/presentation/ardelean)
Stated that the only way to analyze production performance is using live production systems. In this paper, Google looks at Gmail performance
- looking at request patterns with respect to time, you can find cyclical patterns in user activity based on what kind of app you are running
- load can be composed of user activity and one-off events like recoveries, jobs, deploys

### Methodology for live testing
Users are partitioned randomly, one test and one control
- A/B testing is common for UI changes
- A/A testing is used to measure statistical deviation in user partitions (without necessarily rolling out new features between the two partitions)

### Statistics and experiments
Must make assumptions clear when using statistics and scrutinize the experiment to enure that assumptions (like event independence) are not violated

### Measuring Performance 
Before determining how to make an app faster, we must understand why it's slow or expensive

**temporal context** of a request can be used to find out what else was running at the time

**operation context** tells you how a request ran (what parameters, maybe what other calls are madE)

We need a method for tracing the context of these events. *it seems temporal context may be as easy as timestamps when estimating?* More accurately, we might require coordination between layers

### Bursty Tracing
