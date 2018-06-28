# SQS, SWF & SNS
There are categorized as amazon application and mobile services.
- **Simple Queue Service** is a message queue system that stores messages as they move between servers
  - acts as a buffer, allowing either server to have downtime without loss of messages
  - **visibility timeouts** are configurable periods of time for how much message processing time is allowed before passing the message to a different component for processing
- **Simple Workflow Service** gives you control of coordinating tasks done by applications
- **Simple Notification Service** is a producer consumer system that allows asynchronous communication from publishers to their subscribers
