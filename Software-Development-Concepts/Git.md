# Git 
Git is a version control system.

## Architechture
Git has local and remote repositories, branches, staging, commits (HEAD).

## Commands
- `git init` creates new repository
- `git add -A` stages all changes
- `git commit -m "message"` commits staged changes to repository
- `git status` checks stage
- `git reset HEAD filename` to unstage file from HEAD pointer
- `git rm filename` removes a file from tracked files in repository
- `git mv file_from file_to` renaming a file and keeping its metadata (otherwise VCS has no idea that the file previously existed under another name)
- `git clone https://repo.com` clones a remote repository to local
- `git checkout branchname` creates or checks out existing branch

## Git Ignore
`.gitignore` uses [glob](Glob Patterns.md) patterns to describe patterns in filenames. `#` denotes comments.

## Repository History
`git log` shows the commit history, reverse chronological order. `--stat` shows abbreviated stats for each commit. `--pretty` and `--oneline` can be used to reformat `git log`. `--pretty=format:"%h - %an, %ar : %s"` prints a string for each commit:
```
ca82a6d - Scott Chacon, 6 years ago : changed the version number
085bb3b - Scott Chacon, 6 years ago : removed unnecessary test
a11bef0 - Scott Chacon, 6 years ago : first commit
```
More options:
```
$ git log --pretty=format:"%h %s" --graph
* 2d3acf9 ignore errors from SIGCHLD on trap
*  5e3ee11 Merge branch 'master' of git://github.com/dustin/grit
|\
| * 420eac9 Added a method for getting the current branch.
* | 30e367c timeout code and tests
* | 5a09431 add timeout protection to grit
* | e1193f8 support for heads with slashes in them
|/
* d6016bc require time for xmlschema
*  11d191e Merge branch 'defunkt' into local
```
## Git Remote
Manages remote connections, for pushing and pulling code changes between your local repository and a central repository hosted on sites like GitHub and BitBucket.
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

[source](https://git-scm.com/doc)
