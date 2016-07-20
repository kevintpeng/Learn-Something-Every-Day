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

### Phase 1a: Prepare -- [source](https://en.wikipedia.org/wiki/Paxos_(computer_science)#Basic_Paxos)
A Proposer (the leader) creates a proposal identified with a number N. This number must be greater than any previous proposal number used by this Proposer. Then, it sends a Prepare message containing this proposal to a Quorum of Acceptors. The Proposer decides who is in the Quorum.

### Phase 1b: Promise
If the proposal's number N is higher than any previous proposal number received from any Proposer by the Acceptor, then the Acceptor must return a promise to ignore all future proposals having a number less than N. If the Acceptor accepted a proposal at some point in the past, it must include the previous proposal number and previous value in its response to the Proposer.

Otherwise, the Acceptor can ignore the received proposal. It does not have to answer in this case for Paxos to work. However, for the sake of optimization, sending a denial (Nack) response would tell the Proposer that it can stop its attempt to create consensus with proposal N.

### Phase 2a: Accept Request
If a Proposer receives enough promises from a Quorum of Acceptors, it needs to set a value to its proposal. If any Acceptors had previously accepted any proposal, then they'll have sent their values to the Proposer, who now must set the value of its proposal to the value associated with the highest proposal number reported by the Acceptors. If none of the Acceptors had accepted a proposal up to this point, then the Proposer may choose any value for its proposal.

The Proposer sends an Accept Request message to a Quorum of Acceptors with the chosen value for its proposal.

### Phase 2b: Accepted
If an Acceptor receives an Accept Request message for a proposal N, it must accept it if and only if it has not already promised to any prepare proposals having an identifier greater than N. In this case, it should register the corresponding value v and send an Accepted message to the Proposer and every Learner. Else, it can ignore the Accept Request.
