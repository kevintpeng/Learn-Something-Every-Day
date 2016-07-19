# Consensus Problem
A fundamental problem in distributed computing, which requires agreement among a number of processes for a single data value.
- consensus protocols must be fault tolerant, to deal with unreliability
- a candidate value is put forth, and a consensus value is agreed upon (deciding whether to commit a database transaction, synchronous clocks ...)
- a consensus protocol is correct if **agreement** is met, the value is **proposed** by some node, and all nodes eventually decide (**terminate**)

### Two-Phase Commit
1. A self assigned coordinator contacts every node, propose a value and gather boolean responses
2. if everyone agrees, commit

Solves consensus problem assuming no failures. 
- If a coordinator crashes without sending all proposal messages, some nodes are blocked waiting for a response to the consensus
- If coordinator crashes sending half of commits, then some nodes are updated, others are blocked

### Three-Phase Commit
Similar to 2PC. Second phase of 2PC has two sub-phases. 
1. Coordinator proposes
2. If everyone agrees, prepare to commit, communicating the result of the vote to every node
3. commit (or abort if delivery of prepare to commit to any node fails)

- If the coordinator crashes at any point, from 2 onwards, now any node can take over and coordinate.
- if a node has commited, we know that all nodes have prepared to commit already

**Problem**: network partitioning can cause inconsistenet states. In network systems, *fail-stop* isn't the only model of failures. Nodes can follow a *fail-recover* fault model. Coordinator can recover and interfere with another recovery node. Failure in this case isn't crashing, but could be instead network interuptions.

### Paxos -- [source](http://the-paper-trail.org/blog/consensus-protocols-paxos/)
One node acts as a proposer (protocol fails to terminate until only one node is acting as proposer).
1. The proposer sends a 'prepare' request to acceptors
2. acceptors indicate their agreement to accept and recieve a commit request
3. acceptors replay with success or failure
4. once enough acceptors commit, the protocol terminates

- paxos adds **ordering** to the proposals to determine which proposals should be accepted. 
  - proposals are tagged with **sequence numbers**, used for total order
  - an acceptor guarantees that it will not accept any more proposals ordered before its newest proposal, instead returning its highest sequence number, which the proposer uses to figure out a sufficiently high sequence number for its next proposal
  - proposers draw from disjoint sets of sequence numbers for uniqueness (one practical way is using the address value of the proposer for tie breakers, paired with an integer)
- paxos introduces **majorities**
  - for two sets of majorities, there is at least one acceptor that agrees on both
  - therefore a third majority is guaranteed to contain information about the previous two majorities
  - by having majorities, paxos guarantees that every reply will contain at least one response from the previously agreed proposal
  - before any commit is sent from a proposer, it is known what the most recently agreed proposal was
  - all acceptors promise not to accept values part of sequences less than its current highest, preventing a proposer with a low sequence number from getting its proposal accepted 
- **legitimate proposals** constrain the possible values a proposer can make (remember multiple propers can act at once)
  
