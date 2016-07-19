# Consensus Problem
A fundamental problem in distributed computing, which requires agreement among a number of processes for a single data value.
- consensus protocols must be fault tolerant, to deal with unreliability
- a candidate value is put forth, and a consensus value is agreed upon (deciding whether to commit a database transaction, synchronous clocks ...)
- a consensus protocol is correct if agreement is met, the value is proposed by some node, and all nodes eventually decide

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

**Problem**: network partitioning can cause inconsistenet states.
