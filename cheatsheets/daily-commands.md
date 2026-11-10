<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Daily Git Commands Cheat Sheet

## Setup

| Command | What it does |
|---|---|
| `git config --global user.name "Name"` | Set your name |
| `git config --global user.email "you@x.com"` | Set your email |
| `git config --global init.defaultBranch main` | Default branch for new repos |
| `git config --list --show-origin` | See all config and where it comes from |

## Start

| Command | What it does |
|---|---|
| `git init -b main` | New repo |
| `git clone <url>` | Copy a repo |
| `git clone --depth 1 <url>` | Shallow clone (CI) |
| `git clone --filter=blob:none <url>` | Partial clone (big repos) |

## Everyday loop

| Command | What it does |
|---|---|
| `git status -sb` | Short status with branch info |
| `git add -p` | Stage hunk by hunk |
| `git diff` / `git diff --staged` | Unstaged / staged changes |
| `git commit -m "feat: ..."` | Commit |
| `git commit --amend --no-edit` | Add staged changes to last commit |
| `git pull --rebase` | Update without merge commits |
| `git push -u origin <branch>` | First push of a branch |

## Branches

| Command | What it does |
|---|---|
| `git switch -c feature/x` | Create and switch |
| `git switch -` | Previous branch |
| `git branch -vv` | Branches with upstream and ahead/behind |
| `git branch -d x` / `-D x` | Delete merged / force delete |
| `git push origin --delete x` | Delete remote branch |
| `git branch --merged main` | Safe-to-delete branches |

## Integrate

| Command | What it does |
|---|---|
| `git merge --no-ff feature` | Merge with merge commit |
| `git merge --squash feature` | Squash into one staged change |
| `git rebase main` | Replay branch on main |
| `git rebase -i main` | Clean up commits |
| `git cherry-pick -x <sha>` | Copy a commit (backport) |
| `git merge --abort` / `git rebase --abort` | Bail out |

## History

| Command | What it does |
|---|---|
| `git log --oneline --graph --all` | The picture that answers most questions |
| `git log -S "text"` | Commits that added/removed text |
| `git log --follow -- file` | History across renames |
| `git blame -L 10,20 file` | Who changed these lines |
| `git show <sha>` | One commit in full |
| `git bisect start; git bisect run ./test.sh` | Find the bad commit |

## Remotes and tags

| Command | What it does |
|---|---|
| `git remote -v` | List remotes |
| `git fetch --all --prune` | Update everything, drop deleted branches |
| `git push --force-with-lease` | Safe force push (your branch only) |
| `git tag -a v1.2.0 -m "..."` | Annotated tag |
| `git push --follow-tags` | Push commits and their tags |

## Park work

| Command | What it does |
|---|---|
| `git stash push -u -m "WIP: x"` | Stash including untracked |
| `git stash list` / `git stash pop` | List / restore |
| `git worktree add ../hotfix hotfix/1.2.1` | Second working folder |

Made by DevOps Shack. Print it, pin it, and star the repo.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
