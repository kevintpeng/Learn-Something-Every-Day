# [Time, Clocks, and the Ordering of Events in a Distributed System 1978](http://amturing.acm.org/p558-lamport.pdf)
A system is distributed if the message transmission delay is non negligable relative to the time between events in a single process
- In distributed systems, the concept of an event happening before another one is partial ordering
- paper examines a distributed algorithm for synchronizing a system of logical clocks for totally ordering events
- sometimes precise ordering cannot be determined, and is thus partial ordering
- concept of time and "happened before" to us is based on physical time and physical clocks, but in a system it may be more beneficial to care about observed 
- we define a system as a collection of processes, each with a sequence of a priori totally ordered event
- notationally, `->` is relation between two events in a system, where `a -> b` means a happend before b
  - intuitively, this means that `a` causally affects event `b`
  - two events are concurrent if they cannot causally affect each other, denoted by `a -|-> b`, concurrency is commutative
  - physically, it is intuitive that `a -|-> a`, reflexive, since it doesn't make sense if an event can happen before itself
  - `->` can be thought of as an irreflexive `-|->`
- even if phyically event `a` on process A happens before event `b` on process B, they can be effectively concurrent when A doesn't know what B did until later
  - effectively, since they didn't communcative, we can think intuitively that they had no causal effect on on another

### Logical Clocks
Abstractly, a clock doesn't need to be physical. We represent it as C(x) which is a function that assigns a number to an event, `x`
- for multiple processes, each P<sub>i</sub> has a clock C<sub>i</sub>, then C(a) = C<sub>i</sub>(a) for event `a` in process P<sub>i</sub> 
- **Clock condition** states `if a -> b then C(a) < C(b)` (implication because partial ordering exists and events could be concurrent, even when C(a) ≠ C(b))
  - holds only if during message transmission, a is sending event and b is recieving event, if `a -> b` from Pi to Pj, then C<sub>i</sub>(a) < C<sub>j</sub>(b)
  
