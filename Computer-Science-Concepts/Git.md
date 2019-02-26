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

## Undoing Changes
[Interesting link for help](http://sethrobertson.github.io/GitFixUm/fixup.html).

`git commit --amend` will add changes to the previous commit (second, new commit overwrites first). 

`git reset HEAD <filename>` unstages a file.

`git reset HEAD~1` unstages last commit.

`git reset --hard HEAD~1` removes commit along with all changes, removes it from history too.

## Git Remote
Manages remote connections, for pushing and pulling code changes between your local repository and a central repository hosted on sites like GitHub and BitBucket.
```shell
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

## Git Branching
- `git branch testing` creates a new "testing" branch.
- `git checkout testing` switches branches (moves `HEAD` to point to `testing` branch)
-`HEAD` points to the current working branch
- from `master`, `git merge <branch>` merges changes from a branch into the master.

### Basic Merge Conflict
Git doesn't automatically create new commit, it pauses the process. `git mergetool` or `git opendiff`

### Remote Branches
Remote references are pointers to remote repositories, including branches. `git ls-remote <remote>` shows all remote references. Remote-tracking branches are references to the state of remote branches, of the form `(remote)/(branch)`. 

When pushing a local branch, it needs to be pushed to a remote that you have access to. `git push origin serverfix` pushing the local serverfix branch to the remote serverfix branch. 

Checking out a local branch from a remote-tracking branch automatically creates a "tracking branch" which follows an "upstream branch". `git pull` from a tracking branch with fetch from the upstream remote branch. `git clone` automatically sets up `master` as a tracking branch that tracks `origin/master`. 

`git checkout --track origin/serverfix` will create a local tracking branch called serverfix, that tracks `origin/serverfix` as its upstream. 

`git branch -u origin/serverfix` sets the current branch's upstream.

### Rebasing
`merge` and `rebase` integrate changes from one branch to another. Rebasing is "rewinding" a branch, and "replaying" each commit one by one in the master branch, starting with their common ancestor:
```
$ git checkout experiment
$ git rebase master
First, rewinding head to replay your work on top of it...
Applying: added staged command
# Now do a fast-forward merge
$ git checkout master
$ git merge experiment
```
Makes a cleaner history, especially for open source projects which you don't maintain. 

[rebase a PR](https://github.com/edx/edx-platform/wiki/How-to-Rebase-a-Pull-Request)

## GitHub Config
On a somewhat unrelated note, here is GitHub configurations:
```bash
git config --global core.editor "your editor"
git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -C "YOUR@EMAIL.com"
```
Input your account values. Then go [to github ssh](https://github.com/settings/ssh) and click new SSH key.

Copy the output of `cat ~/.ssh/id_rsa.pub` and paste on GitHub.

[source](https://git-scm.com/doc)

### Subprojects -- [source](https://git.wiki.kernel.org/index.php/SubprojectSupport)
- **Submodules** provide fixed references from the superproject to subprojects
  - good for shared code between superprojects, or separation of maintainers
  - creates separation for git efficiency
- **Subtrees** cause subproject repos to be imported with its full history
- **Wrappers** which provide multi-repo management functionality

### Git Objects
Git is a content-addressable filesystem. Built with a key-value store.

### Git Server Protocols
**Local protocol** is basic, uses another directory on disk as the remote

# Gerrit
A commit review tool built on git, with workflows analogous to pull-request style with github
- compared to pull-requests, Gerrit does not support multi-commit changes
- Gerrit is more explicit, adding change-ids, CLI integration through githooks
- patch sets are git hashes at all points you push to Gerrit, essentially revisions, aiding reviewers to see what's changed since the last review
