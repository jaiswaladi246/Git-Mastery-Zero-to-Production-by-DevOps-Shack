<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git Recovery Cheat Sheet

**Step 0, always:** `cp -r repo repo-backup` or `git branch backup-$(date +%s)`.

| Symptom | First command | Fix |
|---|---|---|
| Lost commits after reset/rebase | `git reflog` | `git reset --hard HEAD@{n}` |
| Deleted branch | `git reflog` | `git branch name <sha>` |
| Commits made on detached HEAD | `git reflog` | `git branch keep <sha>` |
| Dropped stash | `git fsck --no-reflogs` | `git stash apply <sha>` |
| Lost staged (never committed) file | `git fsck --lost-found` | read blobs in `.git/lost-found/other` |
| Force-push overwrote remote | `git reflog show origin/main` | `git push --force-with-lease origin <sha>:main` |
| Push rejected (fetch first) | `git fetch` | `git pull --rebase && git push` |
| Diverged branches | `git log --oneline --left-right main...origin/main` | rebase, merge or `reset --hard origin/main` |
| Unrelated histories | — | `git pull origin main --allow-unrelated-histories` |
| `index.lock` exists | check no git process running | `rm .git/index.lock` |
| Dubious ownership | — | `git config --global --add safe.directory <path>` |
| Permission denied (publickey) | `ssh -vT git@github.com` | `ssh-add`, check key on account, check remote URL |
| Object file is empty / corrupt | `git fsck --full` | delete empty objects, copy packs from healthy clone, or re-clone |
| Broken index | `git status` errors | `rm .git/index && git reset` |
| Huge file blocks push | `git log --stat` | remove from unpushed commits, or `filter-repo --strip-blobs-bigger-than` |
| Line endings show every line changed | `git diff --stat` | `.gitattributes` + `git add --renormalize .` |
| In middle of merge/rebase, confused | `git status` | `--abort`, or resolve and `--continue` |
| Remote repository deleted | any clone | `git push --mirror` to a new remote |

From [Git Mastery by DevOps Shack](../README.md) · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi](https://www.youtube.com/@shackverse)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
