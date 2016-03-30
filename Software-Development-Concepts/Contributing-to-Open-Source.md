# Contributing to Open Source Projects
Various open source projects use different tools for managing distributed development, bust most use the same set of concepts:

- Version Control (with central remote repository)
- Pull Requests
- Isolated Dev/Test environment
- Continuous Integration 

## Version Control
Is an integral part of open source projects. Includes *git, svn, and mercurial*. I use git. Github and Bitbucket host central repositories for developers to contribute to. More on [Git](Git.md).

The following steps can be followed as an example for contributing to Rails:
- `git clone https://github.com/rails/rails.git` clone repo
- `git checkout -b my_new_branch` create new branch for local changes
- `bundle install` install dependencies and gems
- `bundle exec rails new ~/my-test-app --dev` creates dummy application to test changes. `--dev` uses your branch
- `bundle exec rake test` in a specific file will run tests for a component

## Pull Requests
After making changes to a repository, a **pull request** is made, requesting that code changes are merged to the central repository. After your changes are in a forked repository. It is good practice to **squash commits** into one commit, using `git rebase`.

More on [Pull Requests](Pull Requests.md)

## Isolated Dev/Test environments
Projects often have a standardized developer environment for core development, using a DevOps tool like Docker or Vagrant, for various cases.

## Continuous Integration
Is the practice in software engineering, of merging all developer working copies with a shared main branch. CI often refers to testing every change after being merged. **Travis CI** is a very popular option for continuous integration.
