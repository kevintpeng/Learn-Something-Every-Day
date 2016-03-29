# Capistrano
A remote server automation and deployment tool that extends Rake, using the *Rake DSL*. Supports scripting and execution of arbitrary tasks. Used for automating prepartion for starting Ruby app in its application server:
- Uploading Ruby app's code and files to server machine
- installing libraries, gems, dependencies
- setting up/migrating database
- starting and stopping daemons that app might reply on

Useful in combination with application servers, as it automates many tasks.
