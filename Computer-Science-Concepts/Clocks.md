### Network Time Protocol
- NTP is a protocol for clock synchronization over packet switched, variable latency data networks
- syncs within miliseconds of each other using UTC
- uses Marzullo's algorithm, to estimate correct time from noisy sources
  - produces an optimal value from a set of estimates with **confidence intervals**
  - the best estimate is taken to be the smallest interval consistent with the largest number of sources
- NTP can maintain time within tens of miliseconds, passing timestamps through UDP

### Hybrid Logical Clock and Consistent Snapshots
- aims to provide tighter synchronization than using physical/NTP clocks
- enables consistent snapshots of distributed systems
- history; logical clocks pass information instead of physical time
  - impractical because cannot query based on physical time, and is not tolerent
- vector clocks were proposed to maintain a vector at each node which tracks the logical clocks of other nodes
  - while LC finds one consistent snapshot from nodes, VC finds all possible snapshots
