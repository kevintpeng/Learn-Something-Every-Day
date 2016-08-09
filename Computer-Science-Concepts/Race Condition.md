# Race Condition/Hazard
Behaviour of systems where the output is dependent on the sequence/timing of events. Originates from circuits.
- affects multi-threaded or multi-process software, that share persistent components
- an operation that is **mutually exclusive** cannot be interrupted while accessing a resource
- for file systems, file locking is common to avoid this
  - software generally requests and reserves all resources it will need before a task
