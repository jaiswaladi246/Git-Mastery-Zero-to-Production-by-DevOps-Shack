<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Branching, Merging & Conflict Scenarios

Questions 51–100 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q51. Your merge produced conflicts in 15 files and you're overwhelmed. What do you do?**

<details>
<summary>Show answer</summary>

`git merge --abort` to return to a clean state. Then merge main into your branch more often, or rebase step by step. Alternatively list files with `git diff --name-only --diff-filter=U` and resolve one at a time, using `zdiff3` to see the base version.

</details>

**Q52. Both you and a teammate changed the same function. How do you decide the resolution?**

<details>
<summary>Show answer</summary>

Look at the base (with `zdiff3`) to understand each side's intent, read both commits (`git log --merge -p file`), talk to the teammate if unclear, combine the logic, then run tests before committing the merge.

</details>

**Q53. You get a modify/delete conflict on `legacy.py`. How do you resolve it?**

<details>
<summary>Show answer</summary>

Decide whether the file should exist. Keep it with your changes: `git add legacy.py`. Accept the deletion: `git rm legacy.py`. Then continue the merge.

</details>

**Q54. `package-lock.json` conflicts on every merge. How do you resolve it properly?**

<details>
<summary>Show answer</summary>

Don't hand-edit it. Take one side (`git checkout --theirs package-lock.json`), run `npm install` to regenerate it from the merged `package.json`, then `git add` it. Optionally set `merge=ours` style rules plus regeneration in CI.

</details>

**Q55. A binary image conflicts during a merge. How do you resolve it?**

<details>
<summary>Show answer</summary>

Git can't merge binaries. Choose a version (`git checkout --ours logo.png` or `--theirs`), confirm with the designer if needed, and `git add logo.png`.

</details>

**Q56. You merged a branch and Git said "Already up to date", but you expected changes. Why?**

<details>
<summary>Show answer</summary>

The branch's commits are already ancestors of your current branch (perhaps merged before, or you're on the wrong branch or have a stale local branch). Check with `git log --oneline HEAD..feature` and `git fetch` to get remote updates.

</details>

**Q57. You want a merge commit even though a fast-forward is possible. How?**

<details>
<summary>Show answer</summary>

`git merge --no-ff feature`. It's useful to record the feature as a unit, as Git Flow does.

</details>

**Q58. Your team wants to forbid accidental merge commits when pulling. What do you configure?**

<details>
<summary>Show answer</summary>

`git config --global pull.ff only` (fail if not fast-forwardable) or `pull.rebase true` (rebase local commits on top).

</details>

**Q59. You need to merge three topic branches into an integration branch at once. How?**

<details>
<summary>Show answer</summary>

`git merge topic-a topic-b topic-c` creates an octopus merge if there are no conflicts. If conflicts exist, merge them one at a time.

</details>

**Q60. You want to mark a branch as merged without taking any of its changes. How?**

<details>
<summary>Show answer</summary>

`git merge -s ours obsolete-branch` creates a merge commit that keeps your tree unchanged. It's used to supersede a branch.

</details>

**Q61. During a merge you want conflicting hunks to automatically favor your side but still take their non-conflicting changes. How?**

<details>
<summary>Show answer</summary>

`git merge -X ours feature`. Unlike `-s ours`, this still merges all non-conflicting changes.

</details>

**Q62. The merge went cleanly, but the build fails afterwards. What likely happened?**

<details>
<summary>Show answer</summary>

A semantic conflict: changes that don't overlap textually but break together (renamed function, changed API). Fix it in a follow-up commit or amend the merge, and introduce CI that tests the merge result (merge queue / merged-results pipelines).

</details>

**Q63. You need to test what a merge would produce without touching your working tree. How?**

<details>
<summary>Show answer</summary>

In Git 2.38+, `git merge-tree --write-tree main feature` reports the resulting tree and conflicts. Otherwise use a separate worktree: `git worktree add /tmp/test main && cd /tmp/test && git merge feature`.

</details>

**Q64. You resolved a conflict wrongly and already committed the merge locally. How do you redo it?**

<details>
<summary>Show answer</summary>

`git reset --hard ORIG_HEAD` (or `HEAD~1`) to undo the merge commit, then merge again. If rerere recorded the wrong resolution, run `git rerere forget path` first.

</details>

**Q65. You keep resolving the same conflict when rebasing your long-running branch. How do you stop repeating work?**

<details>
<summary>Show answer</summary>

Enable `rerere` (`git config rerere.enabled true`). Git records your resolution once and replays it automatically next time the same conflict appears.

</details>

**Q66. Someone deleted a remote branch that you still have locally. How do you clean up?**

<details>
<summary>Show answer</summary>

`git fetch --prune` removes the stale `origin/branch`. Delete your local branch with `git branch -d branch` if merged, or keep it if it has unique work.

</details>

**Q67. You want to find all local branches already merged into main and delete them. How?**

<details>
<summary>Show answer</summary>

`git branch --merged main | grep -vE '^\*|main|develop' | xargs -r git branch -d`. Review the list before deleting.

</details>

**Q68. A branch was squash-merged, and `git branch -d` refuses to delete it. Is it safe to force-delete?**

<details>
<summary>Show answer</summary>

Verify the PR was merged (on the platform, or `git diff main...branch` shows nothing meaningful), then `git branch -D branch`. Squash merges don't make the original commits ancestors of main, so `-d` can't tell.

</details>

**Q69. You started a feature from the wrong branch (develop instead of main). How do you move it?**

<details>
<summary>Show answer</summary>

`git rebase --onto main develop feature/x` replays only your feature commits onto main.

</details>

**Q70. Your branch `feature-b` was built on `feature-a`, which was squash-merged into main. Rebasing feature-b onto main gives tons of conflicts. Fix?**

<details>
<summary>Show answer</summary>

Use `git rebase --onto main <last-commit-of-feature-a> feature-b`, so only feature-b's own commits are replayed and the already-integrated feature-a commits are skipped.

</details>

**Q71. You need to know whether bugfix commit `abc123` is in release/2.3. How?**

<details>
<summary>Show answer</summary>

`git branch -a --contains abc123` or `git merge-base --is-ancestor abc123 release/2.3 && echo yes`. If it was cherry-picked, check with `git log --grep "cherry picked from commit abc123" release/2.3` or `git cherry`.

</details>

**Q72. Two developers created branches with the same name on the remote at the same time. What happens?**

<details>
<summary>Show answer</summary>

The first push succeeds; the second is rejected as non-fast-forward. The second developer should rename their branch or integrate the first developer's commits.

</details>

**Q73. You need to resolve a conflict in a huge generated file (e.g. `schema.graphql`). Best approach?**

<details>
<summary>Show answer</summary>

Don't resolve by hand. Pick one side, then rerun the generator from the merged sources, and commit the regenerated output.

</details>

**Q74. Your feature branch is 200 commits behind main. Merge main in, or rebase?**

<details>
<summary>Show answer</summary>

If the branch is private, rebase for a clean history (enable rerere, consider squashing first to reduce repeated conflicts). If others share it, merge main in. Either way, integrate more often next time.

</details>

**Q75. You merged the wrong branch into main locally. How do you undo it?**

<details>
<summary>Show answer</summary>

If not pushed: `git reset --hard ORIG_HEAD`. If pushed: `git revert -m 1 <merge-sha>` and push.

</details>

**Q76. You need to cherry-pick a merge commit. What's special?**

<details>
<summary>Show answer</summary>

Specify the mainline parent: `git cherry-pick -m 1 <merge-sha>` applies the changes the merge introduced relative to parent 1.

</details>

**Q77. Your merge conflict shows a rename/rename conflict. What does it mean?**

<details>
<summary>Show answer</summary>

Both sides renamed the same file to different names. Decide the final name, `git mv` or remove the unwanted path, `git add` the chosen file, and continue.

</details>

**Q78. After resolving conflicts, `git commit` says "you have unmerged paths". Why?**

<details>
<summary>Show answer</summary>

Some files are still marked conflicted in the index. Run `git status`, resolve the remaining files, and `git add` (or `git rm`) each one.

</details>

**Q79. You resolved a conflict but left a `=======` line by mistake and pushed. How could this have been prevented?**

<details>
<summary>Show answer</summary>

Add a pre-commit check (`check-merge-conflict` hook in pre-commit, or `git diff --check`) and CI linting that fails on conflict markers.

</details>

**Q80. You want to see the base, ours and theirs versions of a conflicted file separately. How?**

<details>
<summary>Show answer</summary>

`git show :1:file` (base), `git show :2:file` (ours), `git show :3:file` (theirs), or use `git mergetool`.

</details>

**Q81. How do you resolve all conflicts in favor of their version in one go?**

<details>
<summary>Show answer</summary>

`git checkout --theirs .` then `git add -A`. Only do this when you're certain, because it discards your side of every conflict.

</details>

**Q82. You want to merge a feature but exclude one commit from it. How?**

<details>
<summary>Show answer</summary>

Rebase the feature interactively and drop that commit before merging, or merge and then revert the unwanted commit. If the branch is shared, prefer the revert.

</details>

**Q83. A long-running branch keeps diverging. How do you reduce the pain going forward?**

<details>
<summary>Show answer</summary>

Merge or rebase from main daily, split the work into smaller mergeable pieces behind feature flags, use branch by abstraction for big refactors, and aim to merge within days.

</details>

**Q84. After merging, you realize history shows dozens of "Merge branch main into feature" commits. How do you avoid this in future?**

<details>
<summary>Show answer</summary>

Use `git pull --rebase` (or `pull.rebase true`) on private branches, rebase feature branches onto main instead of merging main in, and squash-merge PRs.

</details>

**Q85. Your teammate force-pushed their rebased branch that you also had commits on. How do you recover your work?**

<details>
<summary>Show answer</summary>

Don't pull. Save your commits with `git branch my-backup`. Then `git fetch` and `git rebase --onto origin/feature <old-upstream-sha> my-backup` (find the old base in reflog), or cherry-pick your commits onto the new `origin/feature`.

</details>

**Q86. You want to merge `upstream/main` into your fork's main but get "refusing to merge unrelated histories". Why?**

<details>
<summary>Show answer</summary>

Your fork's main and upstream don't share a root commit, perhaps because the repo was re-created or history was rewritten upstream. Investigate first; if intended, `git merge --allow-unrelated-histories upstream/main`, or reset your fork's main to upstream.

</details>

**Q87. You need to review what changed in a merge commit itself (e.g. manual conflict fixes). How?**

<details>
<summary>Show answer</summary>

`git show --cc <merge-sha>` or `git show --remerge-diff <merge-sha>` (Git 2.36+), which shows the difference between an automatic remerge and the actual recorded merge, highlighting manual resolutions.

</details>

**Q88. Your branch has a merge commit you want to remove before opening a PR. How?**

<details>
<summary>Show answer</summary>

`git rebase main` flattens it by default (merge commits are dropped and their non-redundant changes replayed). Use `--rebase-merges` only if you want to keep them.

</details>

**Q89. A teammate asks why their branch shows "ahead 5, behind 3". Explain.**

<details>
<summary>Show answer</summary>

Their branch has 5 commits the upstream doesn't, and the upstream has 3 commits their branch doesn't. They need to integrate (rebase or merge) before a fast-forward push is possible.

</details>

**Q90. Your merge base looks wrong and the merge pulls in unexpected changes. What do you check?**

<details>
<summary>Show answer</summary>

`git merge-base main feature` and `git log --oneline --graph main feature` to see if someone merged main into feature incorrectly, or if there are criss-cross merges (`git merge-base --all`). An incorrect earlier merge may need reverting.

</details>

**Q91. How do you merge a single file from another branch without merging the whole branch?**

<details>
<summary>Show answer</summary>

`git restore --source=other-branch -- path/to/file` (or `git checkout other-branch -- path/to/file`), then commit. This copies the file and doesn't record a merge relationship.

</details>

**Q92. You need to apply only some hunks of a file from another branch. How?**

<details>
<summary>Show answer</summary>

`git checkout -p other-branch -- path/to/file` (or `git restore -p --source=other-branch path/to/file`) to pick hunks interactively.

</details>

**Q93. The team uses squash merges, and a follow-up PR from the same branch shows old commits again. Why?**

<details>
<summary>Show answer</summary>

After a squash merge, the branch's original commits aren't in main, so continuing on the same branch makes them reappear in the diff. Delete the branch after merging and start new work from updated main.

</details>

**Q94. How do you prevent people from merging their own PRs without review?**

<details>
<summary>Show answer</summary>

Branch protection with required approvals (at least 1), "dismiss stale approvals", CODEOWNERS review for critical paths, and including administrators in the rules.

</details>

**Q95. Your PR shows conflicts on the platform, but locally the merge is clean. Why?**

<details>
<summary>Show answer</summary>

Your local main is stale. `git fetch origin` and merge or rebase onto `origin/main`; you'll see the same conflicts the platform sees.

</details>

**Q96. You want to keep a branch around but make sure nobody pushes to it again. How?**

<details>
<summary>Show answer</summary>

Protect it on the platform (no pushes allowed, or lock branch/read-only), or tag its tip (`archive/feature-x`) and delete the branch.

</details>

**Q97. How do you find the commit where two branches diverged?**

<details>
<summary>Show answer</summary>

`git merge-base branchA branchB` gives the common ancestor commit, and `git log --oneline $(git merge-base A B)..A` lists what happened on A since.

</details>

**Q98. Two branches both added a file `config/new.yaml` with different contents. How do you resolve the add/add conflict?**

<details>
<summary>Show answer</summary>

Open the file, combine or choose the correct contents (markers appear like a normal content conflict), then `git add config/new.yaml`.

</details>

**Q99. You merged a PR that accidentally included unrelated formatting changes across 300 files. How do you handle blame going forward?**

<details>
<summary>Show answer</summary>

If you can't revert and redo it, add the merge or format commit SHA to `.git-blame-ignore-revs` and configure `blame.ignoreRevsFile`, so blame skips it.

</details>

**Q100. Your team wants a merge commit message template including the ticket and PR. Where is this configured?**

<details>
<summary>Show answer</summary>

On the platform's merge settings (default commit message for merges and squashes), or locally with a `prepare-commit-msg` hook that formats merge messages.

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
