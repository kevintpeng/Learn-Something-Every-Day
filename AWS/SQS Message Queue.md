# SQS
**Simple Queue Service** is a message queue system that stores messages as they move between servers
- does not guarantee preservation of order of messages
- acts as a buffer (default 4 days, up to 14), allowing either server to have downtime without loss of messages
- useful especially if processing servers cannot fully handle spiky load, allowing messages to be queued up in high traffic spikes
- **visibility timeouts** are configurable periods of time for how much message processing time is allowed before passing the message to a different component for processing
- **delay queues** are similar in that they configure a period of time in which a message is unavailable, but different in that the message is invisible in a delay queue
- **long polling** is a configuration that can drastically reduce CPU-cycle cost and load by adding a wait period between polls (1 to 20 seconds)
- provides a layer of access control, more fine-grained than IAM (like what content is viewable from a certain account in an SQS queue)
