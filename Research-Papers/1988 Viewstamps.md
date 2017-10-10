# [Viewstamp Replication](http://www.cs.princeton.edu/courses/archive/fall09/cos518/papers/viewstamped.pdf)
The original paper is a bit confusing, [this offers a more concrete explanation of implementation details](http://pmg.csail.mit.edu/papers/vr-revisited.pdf).

In the paper, a **view** is a set of members and a leader (called a primary). Each event within a view has a unique logical timestamp. A **viewstamp** is the tuple of view id with some timestamp and used to detect lost information
- uses the "primary copy technique", where everything is computed on a primary node, and replicated for the purpose of failover
- a **view change** occurs if the primary is separated from the cluster, where a new primary is assigned
- paper has different protocols for replication depending on state, one when membership and leadership is stable, one otherwise
- *during a view change, some actions from the old view might be lost in the new view, and we use viewstamps to decide whether to commit or abort an action*

### protocol overview
It differs from Paxos in that it is a replication protocol, not consensus
- a primary replica handles ordering of client requests, all other replicas are backups
- failure is handled by allowing the primary to change, changing through a sequence of **views**
  - so we need the view change protocol
- the goal is that the next view should reflect all client operations that were executed in an earlier view, so the current view cannot execute changes without ensuring that the backups can retain it
  - so the primary must wait until `f+1` replicas have acknowledged the request
  - each request is a **quorum**

### details
Identity of the primary is encoded in the viewstamp (the totally ordered view number part)
- primary is chosen by round robin, ordering replicas by IP address
- clients have a viewstamped replication proxy

#### without failure
Every message sent from one replica to another contains the current view number
- if behind, message is dropped
- if ahead, transfer its state to the receiver before processing

Each replica holds some state:
- configuration is a sorted list of `2f + 1` IP addresses
- replica number is the index of the replica itself
- log contains the ordered list of requests that have been received
- client-table tracks the most recent requests from all clients, important for ensuring execution of requests
- current status {normal, view-change, recovering}

As a part of state, there's a bunch of numbers:
- view-number is the totally ordered identifier for the current view, incremented through view changes
- op-number is assigned to the most recently received request
- commit-number is the most recently commited op-number

1. client sends request to primary, <REQUEST operation, client-id, request-number>
2. primary receives request, and looks up the client in its client table. If request number is strictly larger than the last from the client, then it's processed.
3. primary increments the op-number (logical timestamp) and adds it to the log. It updates the client table. Now it proceeds with 2PC to its other replicas <PREPARE view-number, message, op-number, commit-number>
4. backups receive prepare, replies PREPAREOK if

### Paper's architecture
- a cohort is a single logical entity, with several underlying replica modules of some primary module
- in their architecture, any module running is replicated, one is the primary which processes two-phase commits, and others are simply backups and endpoints
- a view is a set of sets (cohorts) of replicas, one cohort is a primary
- viewstamps let you state guarantees that the cohort's state reflects only events that occur logically at or before the viewstamp
- lifetime of a system is divided into **epochs**, which are subdivided into **views**
  - changes to epochs are administrative, changes to views are due to failure
- there are four protocols for the algorithm: normal operation, view changes, recovery for crashed replicas and reconfiguration for epoch changes
- ensures availability beyond some number `f` of failed replicas, by using a protocol that does not need to check `f` replicas
  -
