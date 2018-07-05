# SQS, SWF & SNS
There are categorized as amazon application and mobile services.

**Simple Queue Service** is a message queue system that stores messages as they move between servers
- does not guarantee preservation of order of messages
- acts as a buffer (default 4 days, up to 14), allowing either server to have downtime without loss of messages
- useful especially if processing servers cannot fully handle spiky load, allowing messages to be queued up in high traffic spikes
- **visibility timeouts** are configurable periods of time for how much message processing time is allowed before passing the message to a different component for processing
- **delay queues** are similar in that they configure a period of time in which a message is unavailable, but different in that the message is invisible in a delay queue
- **long polling** is a configuration that can drastically reduce CPU-cycle cost and load by adding a wait period between polls (1 to 20 seconds)
- provides a layer of access control, more fine-grained than IAM (like what content is viewable from a certain account in an SQS queue)

**Simple Workflow Service** gives you control of coordinating tasks done by applications
- this is multi-step background jobs, like handling an online order
- SWF facilitates these workflows with many tasks (Lambda, activity tasks, decision tasks)
- **actors** are just their term for processes owned by SWF that are the different components of the entire system
  - **decider** uses the history log of tasks performed to determine which task to run next
  - the decider can choose to complete, cancel, or fail an open workflow execution
  - **workflow starter** instantiates a workflow with an empty history
- deciders and activity workers communicate using long polling

**Simple Notification Service** is a producer consumer system that allows asynchronous communication from publishers to their subscribers
- push to topics where possibly many consumers can listen
- can be used for monitoring
- can be used to push newsletters, notifications
- supports HTTPS, SMS, Email, Lambda, SQS
