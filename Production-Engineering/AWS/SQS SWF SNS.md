# SQS, SWF & SNS
There are categorized as amazon application and mobile services.
- **Simple Queue Service** is a message queue system that stores messages as they move between servers
  - does not guarantee preservation of order of messages
  - acts as a buffer, allowing either server to have downtime without loss of messages
  - useful especially if processing servers cannot fully handle spiky load, allowing messages to be queued up in high traffic spikes
  - **visibility timeouts** are configurable periods of time for how much message processing time is allowed before passing the message to a different component for processing
  - **delay queues** are similar in that they configure a period of time in which a message is unavailable, but different in that the message is invisible in a delay queue 
- **Simple Workflow Service** gives you control of coordinating tasks done by applications
- **Simple Notification Service** is a producer consumer system that allows asynchronous communication from publishers to their subscribers
