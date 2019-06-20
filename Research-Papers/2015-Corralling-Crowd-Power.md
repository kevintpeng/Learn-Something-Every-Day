# [Corralling Crowd Power](https://hci.stanford.edu/publications/2015/soylent-cacm/p85-bernstein.pdf)
- on crowd sourcing for complex tasks, in this case a word processor
- crowd workers are operating in an open-ended manor, of which roughly 30% of open-ended task samples are poor
  - the 30% must be mitigated as it is obviously not acceptable from a data-integrity stand point
  - **high variance of effort** is a root cause. Often workers will be doing minimal work to get paid and some sort of incentive might be necessary to mitigate this
- proposes a multi-step flow Find-Fix-Verify using Mechanical Turk workers
  - Fix-Find-Verify pattern addresses the 30% issue by separating **open-ended tasks** into three stages
  - workers are used in three stages (likely not the same people) first to identify paragraphs to shorten, next to suggest fixes and finally to verify
- average paragraph cost $1.41 to shorten, in two minutes of work time
