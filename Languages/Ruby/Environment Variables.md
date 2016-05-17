# Environment Variables
Some apps store config information in environment variables. 
- Every process has its own set of environment variables
- Environment variables die with their process
- A process gets its environment variables from its parent
  - if you use \`backticks\` to shell out and echo, it uses the ruby process's `ENV` hash

[source](http://blog.honeybadger.io/ruby-guide-environment-variables/)
