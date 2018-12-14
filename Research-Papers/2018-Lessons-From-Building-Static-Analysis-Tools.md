# [2018 Lessons from Building Static Analysis Tools at Google](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/3198e114c4b70702b27e6d88de2c92734c9ac4c0.pdf)

### Problem:
The motivation is that software bugs can be costly. They enumerated the "goto error" and other prolific bugs that unfolded at Google, as examples where static analysis could have avoided the costly errors. Static analysis is relatively cheap compared to dynamically running code, for the purpose of finding simple bugs. Bugs also often have a greater impact than simply downtime and financial opportunity cost. They can affect customer trust in software, and decrease usage rates.

### Solution:
Static analysis tools are a subset of developer tools, for the purpose of checking for bugs in source code. Static analysis is run on source code (statically, so just looking at the text and not running it in a dynamic environment). 

### Issues:
False positives in static analysis can lose developer trust in the system. They found that developers were already reluctant to use such tools, and that any false positives negatively affected perception of the tool. Developers were more receptive to potential false positives when presented them as warnings in code review. Up to 10% false positives were tolerable by devlopers, in warnings from code review.

It was found that developer satisfaction with the tool was the most important criteria for success. Some key takeaways are:
- static analysis authors should focus on developer feedback
- workflow integration is key for adoption
  - checks as compiler time errors, for important errors
- scale by crowdsourcing anaylsis development

### My thoughts on the article:
I like how they applied the scientific process to how they iterate, by collecting data and reviewing feedback and surveys. They also heavily emphasized the importantace of customer market fit and satisfaction, even for internal tools. This is an important takeaway for me. It's very easy for internal tools teams to not have product managers and worry less about customer feedback, when in fact it is the most important aspect of building tools.

Under the assumption of correctness, glazing over technical implementation details, the high level message here is that developer tools need to be effective in communicating their output, and integration into developer's workflow is key. A tool that is hard to understand is detrimental to productivity.
