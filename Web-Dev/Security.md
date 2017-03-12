# Security
### Input Validation
- format checking, limit allowed characters, string lengths, min/max values
- use whitelists, not blacklists
- use Active Record validation

### SQL injection
- if you parse arbitary input into your SQL query, an attacker can run anything
- avoid this by using parameterized: `Project.where("name = ?", params[:name])` 
  - instead of string interpolation
- **SQLMap** is a tool for checking SQL injections or attacks
