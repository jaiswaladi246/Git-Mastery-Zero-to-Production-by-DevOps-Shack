<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Daily Workflow & Undo Scenarios

Questions 1–50 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q1. You committed to `main` locally instead of your feature branch, and haven't pushed. How do you fix it?**

<details>
<summary>Show answer</summary>

Create the branch at the current commit, then move main back: `git branch feature/x`, `git reset --hard origin/main` (or `HEAD~N`), `git switch feature/x`. The commits now live only on the feature branch.

</details>

**Q2. You made a typo in your last commit message, not yet pushed. What do you do?**

<details>
<summary>Show answer</summary>

`git commit --amend -m "Correct message"`. This creates a new commit replacing the old one; since it isn't pushed, nobody is affected.

</details>

**Q3. You forgot to include a file in your last commit. How do you add it?**

<details>
<summary>Show answer</summary>

`git add forgotten.js && git commit --amend --no-edit`. If the commit was already pushed to your own branch, follow with `git push --force-with-lease`.

</details>

**Q4. You accidentally staged a file with secrets but haven't committed. What do you do?**

<details>
<summary>Show answer</summary>

`git restore --staged secrets.env` to unstage it, add it to `.gitignore`, and commit the ignore rule. Since it was never committed, there's nothing in history to purge.

</details>

**Q5. You want to commit only part of your changes in a file. How?**

<details>
<summary>Show answer</summary>

Use `git add -p file`, answer `y`/`n` per hunk (`s` to split, `e` to edit), check with `git diff --staged`, then commit.

</details>

**Q6. You edited a file and want to throw away all changes to it. How?**

<details>
<summary>Show answer</summary>

`git restore file` (or `git checkout -- file`). This is irreversible for uncommitted edits, so check `git diff file` first.

</details>

**Q7. Your working tree is full of build artifacts and untracked junk. How do you clean it safely?**

<details>
<summary>Show answer</summary>

Preview with `git clean -n -d` (add `-x` to include ignored files), then run `git clean -fd`. Better long-term: add the patterns to `.gitignore`.

</details>

**Q8. You need to undo your last three local commits but keep the code changes to recommit differently. How?**

<details>
<summary>Show answer</summary>

`git reset --soft HEAD~3` keeps everything staged, or `git reset HEAD~3` keeps changes unstaged so you can re-stage selectively with `git add -p`.

</details>

**Q9. You ran `git reset --hard HEAD~2` by mistake. How do you get the commits back?**

<details>
<summary>Show answer</summary>

`git reflog` to find the entry before the reset, then `git reset --hard HEAD@{1}` (or the specific SHA).

</details>

**Q10. A commit that's already on shared `main` introduced a bug. How do you undo it?**

<details>
<summary>Show answer</summary>

`git revert <sha>` and push. This adds an inverse commit without rewriting history, so teammates aren't affected.

</details>

**Q11. You need to undo a merge commit that's already pushed to main. How?**

<details>
<summary>Show answer</summary>

`git revert -m 1 <merge-sha>` keeps main's side (parent 1) and undoes the merged branch's changes. Remember that re-merging later requires reverting this revert first.

</details>

**Q12. A teammate's feature was reverted on main. They fixed it and want to merge again, but most changes don't come back. Why, and what's the fix?**

<details>
<summary>Show answer</summary>

Git considers the original commits already merged, so only new commits merge in. Revert the revert commit (`git revert <revert-sha>`), then merge the fix branch.

</details>

**Q13. You deleted a file and committed it two weeks ago. Now you need it back. How?**

<details>
<summary>Show answer</summary>

Find the deletion: `git log --diff-filter=D --oneline -- path/file`. Restore from the parent of that commit: `git restore --source=<sha>^ path/file`, then commit.

</details>

**Q14. You need the version of `config.yaml` from release v1.4.0 without switching branches. How?**

<details>
<summary>Show answer</summary>

`git show v1.4.0:config.yaml > config.yaml.v140` to view it, or `git restore --source=v1.4.0 config.yaml` to replace your working copy.

</details>

**Q15. You want to see exactly what you're about to commit. Which command?**

<details>
<summary>Show answer</summary>

`git diff --staged` (or `git commit -v` to see it in the editor). `git diff` alone shows only unstaged changes.

</details>

**Q16. `git status` shows a file as both staged and modified (`MM`). What does that mean?**

<details>
<summary>Show answer</summary>

You staged a version of the file and then edited it again. The staged version will be committed; the newer edits stay unstaged unless you `git add` again.

</details>

**Q17. You committed with the wrong email on the last 5 commits of your unpushed branch. How do you fix it?**

<details>
<summary>Show answer</summary>

Fix `user.email`, then `git rebase -r HEAD~5 --exec "git commit --amend --no-edit --reset-author"`. For the whole repo, use `git filter-repo --mailmap`.

</details>

**Q18. You want to temporarily set aside changes to switch to another branch quickly. Options?**

<details>
<summary>Show answer</summary>

`git stash push -u -m "WIP: description"`, switch, then `git stash pop` later. Alternatives: a WIP commit on your branch, or `git worktree add` for a second checkout.

</details>

**Q19. Your stash pop resulted in conflicts. What state are you in, and what do you do?**

<details>
<summary>Show answer</summary>

The stash is applied partially and NOT dropped. Resolve conflicts, `git add` the files, then `git stash drop` manually. To bail out, `git checkout -- .` (careful) and the stash remains in the list.

</details>

**Q20. You accidentally dropped a stash with important work. How do you recover it?**

<details>
<summary>Show answer</summary>

Find dangling commits: `git fsck --no-reflogs | grep "dangling commit"`, inspect with `git show <sha>` or `git log -1 --format=%s <sha>` to find "WIP on ..." messages, then `git stash apply <sha>` or `git branch recovered <sha>`.

</details>

**Q21. You're in detached HEAD and made a commit. How do you keep it?**

<details>
<summary>Show answer</summary>

While still detached: `git switch -c save-work`. If you already switched away, find it in `git reflog` and run `git branch save-work <sha>`.

</details>

**Q22. You ran `git add .` and staged 200 files including `node_modules`. How do you undo it?**

<details>
<summary>Show answer</summary>

`git restore --staged .` (or `git reset`) unstages everything. Add `node_modules/` to `.gitignore`, then stage again.

</details>

**Q23. `node_modules` was committed months ago. How do you remove it from tracking going forward?**

<details>
<summary>Show answer</summary>

Add `node_modules/` to `.gitignore`, run `git rm -r --cached node_modules`, and commit. To shrink the repo history as well, use `git filter-repo --invert-paths --path node_modules` with team coordination.

</details>

**Q24. You want to find which commit changed the value of `MAX_CONNECTIONS`. How?**

<details>
<summary>Show answer</summary>

`git log -S "MAX_CONNECTIONS" -p` to see commits where the string was added or removed, or `git log -G "MAX_CONNECTIONS\s*=" -p` for any change to lines containing it. Then `git blame` on the current line.

</details>

**Q25. You need to know who last changed lines 120–140 of a file and why. How?**

<details>
<summary>Show answer</summary>

`git blame -L 120,140 file` gives commits per line; `git show <sha>` shows the full change and message, and the commit usually links to the PR with the discussion.

</details>

**Q26. Blame shows a "reformat with Prettier" commit for every line. How do you see the real authors?**

<details>
<summary>Show answer</summary>

`git blame --ignore-rev <format-sha> file`, or add the SHA to `.git-blame-ignore-revs` and set `blame.ignoreRevsFile`. GitHub's blame view respects that file automatically.

</details>

**Q27. You renamed a file and now `git log file` only shows history after the rename. How do you see all of it?**

<details>
<summary>Show answer</summary>

`git log --follow -- newname` follows history across renames.

</details>

**Q28. On macOS, renaming `readme.md` to `README.md` isn't detected. What do you do?**

<details>
<summary>Show answer</summary>

Use `git mv readme.md README.md` (or via a temp name: `git mv readme.md tmp && git mv tmp README.md`) and commit, because the case-insensitive filesystem hides the change otherwise.

</details>

**Q29. Every line of a file shows as changed after a Windows teammate edits it. What's wrong and how do you fix it?**

<details>
<summary>Show answer</summary>

Line endings changed from LF to CRLF. Add `.gitattributes` with `* text=auto eol=lf`, run `git add --renormalize .`, and commit. Ask teammates to set `core.autocrlf` appropriately.

</details>

**Q30. A shell script fails in CI with `/bin/bash^M: bad interpreter`. What happened?**

<details>
<summary>Show answer</summary>

The script was committed with CRLF line endings. Enforce `*.sh text eol=lf` in `.gitattributes`, renormalize and commit.

</details>

**Q31. A script lost its executable bit in the repo. How do you fix it in Git?**

<details>
<summary>Show answer</summary>

`git update-index --chmod=+x script.sh` (or `chmod +x` then `git add`) and commit. Git stores mode 100755 for executables.

</details>

**Q32. Git shows files as modified, but only file permissions changed (on a mounted drive). How do you stop it?**

<details>
<summary>Show answer</summary>

`git config core.fileMode false` for that repo, so Git ignores executable-bit changes.

</details>

**Q33. `git status` takes 15 seconds in your repo. What do you check?**

<details>
<summary>Show answer</summary>

Large untracked folders not ignored (add to `.gitignore`), a missing commit-graph, and too many loose objects (`git gc`). Enable `core.untrackedCache`, `core.fsmonitor` and `feature.manyFiles`. Measure with `GIT_TRACE_PERFORMANCE=1 git status`.

</details>

**Q34. You want to compare your branch against main to see only your changes. What command?**

<details>
<summary>Show answer</summary>

`git diff main...HEAD` shows changes since the merge base (only your work), and `git log main..HEAD --oneline` lists your commits.

</details>

**Q35. You want to see what changed between two releases. How?**

<details>
<summary>Show answer</summary>

`git log --oneline v1.3.0..v1.4.0` for commits, and `git diff --stat v1.3.0 v1.4.0` for files. Add `--no-merges` or `--first-parent` for a cleaner list.

</details>

**Q36. You need a list of all files changed in the last commit. How?**

<details>
<summary>Show answer</summary>

`git show --name-status HEAD` or `git diff --name-only HEAD~1 HEAD`.

</details>

**Q37. You committed a change and immediately want to undo it, keeping the edits in the working tree. How?**

<details>
<summary>Show answer</summary>

`git reset HEAD~1` (mixed). The commit is gone and its changes are unstaged in your working tree.

</details>

**Q38. You want an alias for a pretty graph log. How do you set it?**

<details>
<summary>Show answer</summary>

`git config --global alias.lg "log --oneline --graph --decorate --all"`, then use `git lg`.

</details>

**Q39. You need to temporarily ignore local changes to a tracked config file. Options?**

<details>
<summary>Show answer</summary>

`git update-index --skip-worktree config.local.yml` tells Git to ignore local modifications (undo with `--no-skip-worktree`). A better pattern is committing a template and git-ignoring the real local file.

</details>

**Q40. You want to start fresh and match the remote exactly, discarding all local work. How?**

<details>
<summary>Show answer</summary>

`git fetch origin`, `git reset --hard origin/main`, and `git clean -fd` for untracked files. Make a backup branch first if there's any chance you need something.

</details>

**Q41. Your commit is rejected by a `commit-msg` hook. You're sure the message is fine for this case. What do you do?**

<details>
<summary>Show answer</summary>

Prefer fixing the message to match the convention. `git commit --no-verify` bypasses client hooks, but CI or server rules will likely enforce the same check anyway.

</details>

**Q42. You accidentally committed a 300 MB video locally and the push fails. It's in your last commit. Fix?**

<details>
<summary>Show answer</summary>

`git rm --cached video.mp4`, add it to `.gitignore` (or track it with LFS), `git commit --amend --no-edit`, then push. If it's deeper in unpushed history, use interactive rebase or `filter-repo` before pushing.

</details>

**Q43. You want to rename the last commit's branch from `featur/login` to `feature/login`, already pushed. How?**

<details>
<summary>Show answer</summary>

`git branch -m feature/login`, `git push -u origin feature/login`, `git push origin --delete featur/login`. Update any open PR to the new branch if the platform requires it.

</details>

**Q44. You need to pick up where a colleague left off on their branch. How?**

<details>
<summary>Show answer</summary>

`git fetch origin` then `git switch feature/their-branch` (Git creates a local tracking branch automatically if the name exists on exactly one remote).

</details>

**Q45. You want to see which branches you worked on most recently. How?**

<details>
<summary>Show answer</summary>

`git branch --sort=-committerdate` or `git for-each-ref --sort=-committerdate refs/heads --format='%(committerdate:relative) %(refname:short)'`.

</details>

**Q46. How do you check if your local branch is behind the remote?**

<details>
<summary>Show answer</summary>

`git fetch` first, then `git status` (ahead/behind), or `git rev-list --left-right --count main...origin/main`.

</details>

**Q47. You need to apply a colleague's patch file. How?**

<details>
<summary>Show answer</summary>

If it's from `git format-patch`, use `git am change.patch` (keeps author and message). For a plain diff, use `git apply --check change.patch` then `git apply change.patch`, and commit yourself.

</details>

**Q48. You want to create a patch of your last two commits to email. How?**

<details>
<summary>Show answer</summary>

`git format-patch -2` creates two `.patch` files; or `git format-patch main --stdout > feature.patch` for everything since main.

</details>

**Q49. You committed an `.idea/` folder accidentally. How do you prevent this for all your repos?**

<details>
<summary>Show answer</summary>

Remove it from tracking (`git rm -r --cached .idea`), and add `.idea/` to your global ignore file (`core.excludesFile`) so it never shows up in any repo.

</details>

**Q50. You're asked to squash your PR's 12 commits into one before merge. How?**

<details>
<summary>Show answer</summary>

`git rebase -i main`, keep the first `pick`, change the rest to `squash` or `fixup`, write one good message, then `git push --force-with-lease`. Or use the platform's "squash and merge".

</details>

---

← [Back to Scenario-Based Questions](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
