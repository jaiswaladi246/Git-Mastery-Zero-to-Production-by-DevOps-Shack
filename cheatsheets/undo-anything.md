<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Undo Anything in Git

**Rule of thumb:** if it's already pushed to a shared branch, use **revert**. If it's only local, you can **reset** or **amend**.

| Situation | Command | Safe on shared history? |
|---|---|---|
| Discard edits to a file | `git restore <file>` | n/a |
| Discard all unstaged edits | `git restore .` | n/a |
| Delete untracked files | `git clean -n` then `git clean -fd` | n/a (unrecoverable) |
| Unstage a file | `git restore --staged <file>` | n/a |
| Fix last commit message | `git commit --amend` | ❌ (rewrites) |
| Add forgotten file to last commit | `git add f && git commit --amend --no-edit` | ❌ |
| Undo last commit, keep changes staged | `git reset --soft HEAD~1` | ❌ |
| Undo last commit, keep changes unstaged | `git reset HEAD~1` | ❌ |
| Undo last commit and throw away changes | `git reset --hard HEAD~1` | ❌ |
| Squash last N commits into one | `git reset --soft HEAD~N && git commit` | ❌ |
| Undo a pushed commit | `git revert <sha>` | ✅ |
| Undo a pushed merge | `git revert -m 1 <merge-sha>` | ✅ |
| Re-merge a branch after reverting its merge | `git revert <revert-sha>` then merge again | ✅ |
| Restore a file from an old commit | `git restore --source=<sha> <file>` | n/a |
| Move a commit to another branch | `git branch other && git reset --hard HEAD~1` | ❌ |
| Undo a rebase just finished | `git reset --hard ORIG_HEAD` | ❌ |
| Undo anything recent | `git reflog` then `git reset --hard HEAD@{n}` | ❌ |
| Recover deleted branch | `git reflog` then `git branch <name> <sha>` | ✅ |
| Recover dropped stash | `git fsck --no-reflogs \| grep commit` then `git stash apply <sha>` | ✅ |
| Undo `git add` of a file that should be ignored | `git rm --cached <file>` + add to `.gitignore` | ✅ |
| Remove a secret from all history | `git filter-repo --replace-text` (rotate first!) | ❌ coordinate team |

From [Git Mastery by DevOps Shack](../README.md) · [YouTube](https://www.youtube.com/@devopsshack)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
