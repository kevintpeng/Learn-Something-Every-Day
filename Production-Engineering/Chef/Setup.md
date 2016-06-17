# Setup Walkthrough
- `knife node edit mynode` 
  - modify `chef_environment`, `roles`, `run_list`
- [Cookbooks help organize recipes.](./Cookbooks.md) Create one, add the recipe to the run-list
- configure chef server, setup SSH.
  - chef server holds your public SSH key, you hold private (RSA scheme)
