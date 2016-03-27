# Git 
Git is a version control system.

## Architechture
Git has local and remote repositories, branches, staging, commits (HEAD).

## Commands
- `git init` creates new repository
- `git clone https://repo.com` clones a remote repository to local
- `git checkout branchname` creates or checks out existing branch

## `git remote`
manages remote connections, for pushing and pulling code changes between your local repository and a central repository hosted on sites like GitHub and BitBucket.
```
$ git remote add origin https://github.com/user/repo.git
# Set a new remote named origin (origin is also the default name for remote connection after being cloned)

$ git remote -v
# Verify new  and existing remotes
origin  https://github.com/user/repo.git (fetch)
origin  https://github.com/user/repo.git (push)

$ git remote show origin
# displays branches
```

- `git fetch origin` fetches any changes in the server since you last fetched. It does not automatically merge.
- `git pull origin` fetches and merges from the remote branch to current branch.
- `git push origin master` pushes your changes to the origin repo from the `master` branch

