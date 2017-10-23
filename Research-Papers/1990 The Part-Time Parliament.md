# [The Part-Time Parliament](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/12/The-Part-Time-Parliament.pdf) and [Paxos](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/12/paxos-simple-Copy.pdf)
Paxos is a consensus algorithm where any process can propose values and the group can choose a single value 
- if the majority `M` of some set `S` of processes selects some value `v : V`, then it is impossible for `S - M` to have a majority of any value other than `v`
- furthermore, for a new value from `V` to be selected, at least one of the previous processes from `M` must also select the new value to make a majority
  - this is really important and is the basis of paxos; before a proposal is selected, the majority that is formed must ensure that the proposal is newer than the last selected one (in other words the proposer isn't outdated) and this only works because for some new majority M', `M' n M` is not empty
  - we use an ordered proposal number to know which proposals are outdated
- formally, our consensus algorithm must select from only proposed values, select only one value, and a process may never learn that a value is selected until it actually has been 
- we use 2 phase commits to select proposed values, because we cannot select a value until we know that a majority has promised to not select any older proposals than it
  - a process can only promise proposals newer than its latests selected proposal
  - a process can only accept a proposal 
