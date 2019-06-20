# [Corralling Crowd Power](https://hci.stanford.edu/publications/2015/soylent-cacm/p85-bernstein.pdf)
- on crowd sourcing for complex tasks, in this case a word processor
- crowd workers are operating in an open-ended manor, of which roughly 30% of open-ended task samples are poor
  - the 30% must be mitigated as it is obviously not acceptable from a data-integrity stand point
  - **high variance of effort** is a root cause. Often workers will be doing minimal work to get paid and some sort of incentive might be necessary to mitigate this
- proposes a multi-step flow Find-Fix-Verify using Mechanical Turk workers
  - Find-Fix-Verify pattern addresses the 30% issue by separating **open-ended tasks** into three stages
  - workers are used in three stages (likely not the same people) first to identify paragraphs to shorten, next to suggest fixes and finally to verify
  - for simpler tasks that are closed, I suspect a Fix-Verify flow would be beneficial
- average paragraph cost $1.41 to shorten, in two minutes of work time

### [Verifying crowdsourced training data using MTurk](https://blog.mturk.com/tutorial-how-to-verify-crowdsourced-training-data-using-a-known-answer-review-policy-85596fb55ed)
- "golden answers" are used to track quality when building ML training datasets
- review policies API on MTurk allows you to vet workers and reject their assignment based on "golden answer" results weaved into their assignment
