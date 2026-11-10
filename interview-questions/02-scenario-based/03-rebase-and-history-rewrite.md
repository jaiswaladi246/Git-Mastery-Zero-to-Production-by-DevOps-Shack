<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Rebase & History Rewrite Scenarios

Questions 101–150 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q101. Before opening a PR, your branch has 10 messy commits. How do you clean them up?**

<details>
<summary>Show answer</summary>

`git rebase -i main`: reword meaningful commits, squash or fixup noise, drop debug commits, reorder logically. Then `git push --force-with-lease` if the branch was already pushed.

</details>

**Q102. A reviewer asks for a change in the second of your five commits. How do you apply it to that commit specifically?**

<details>
<summary>Show answer</summary>

Make the change, then `git commit --fixup=<sha-of-commit-2>` and `git rebase -i --autosquash main`. Git folds the fix into the right commit. Force-push with lease.

</details>

**Q103. You're midway through a rebase with conflicts and realize it's going badly. What do you do?**

<details>
<summary>Show answer</summary>

`git rebase --abort` returns everything to the exact state before the rebase started.

</details>

**Q104. You finished a rebase, pushed with force, and then noticed you lost a commit. How do you recover?**

<details>
<summary>Show answer</summary>

Find the pre-rebase tip in `git reflog` (just before "rebase (start)"), inspect with `git log <sha>`, then reset your branch or cherry-pick the missing commit, and force-push with lease again.

</details>

**Q105. During a rebase, Git stops with "nothing to commit". Why, and what do you do?**

<details>
<summary>Show answer</summary>

The commit's changes already exist in the new base (e.g. a cherry-picked fix), so it became empty after conflict resolution. Run `git rebase --skip`.

</details>

**Q106. Your teammate says they pulled after you rebased and force-pushed the shared branch, and now they have duplicate commits. What happened and how do they fix it?**

<details>
<summary>Show answer</summary>

Their local branch still had the old commits, and pull merged the old and new histories. They should save any unique work, then `git fetch` and `git reset --hard origin/branch` (or `git pull --rebase`, which usually drops duplicates), re-applying their unique commits.

</details>

**Q107. Your rebase hits a conflict on every one of 15 commits. How can you reduce the pain?**

<details>
<summary>Show answer</summary>

Abort, then squash your own commits first (`git rebase -i --keep-base` or `reset --soft` to the merge base) so you resolve once, and enable rerere. Alternatively merge main in once if a linear history isn't required.

</details>

**Q108. You want to split a big commit into "refactor" and "feature" commits. How?**

<details>
<summary>Show answer</summary>

`git rebase -i <commit>^`, mark it `edit`. When it stops: `git reset HEAD~1`, `git add -p` the refactor parts and commit, then the feature parts and commit, then `git rebase --continue`.

</details>

**Q109. You need to change a commit message from five commits ago (unpushed). How?**

<details>
<summary>Show answer</summary>

`git rebase -i HEAD~5`, change `pick` to `reword` on that line, save, and edit the message.

</details>

**Q110. You want to ensure every commit in your branch builds and passes tests. How do you check?**

<details>
<summary>Show answer</summary>

`git rebase -i --exec "make test" main` (or `git rebase --exec "npm test" main`). The rebase stops at the first commit that fails.

</details>

**Q111. Your branch has a commit that added a large file and a later commit that removed it. The PR is blocked for size. How do you fix it?**

<details>
<summary>Show answer</summary>

Interactive rebase and drop (or edit) the commit that added the file, so it never appears in history. Then force-push with lease.

</details>

**Q112. You rebased and now want to see what actually changed between the old and new version of your branch. How?**

<details>
<summary>Show answer</summary>

`git range-diff @{u} HEAD` before pushing (comparing the remote version to your rebased version), or `git range-diff <old-tip>...<new-tip>`.

</details>

**Q113. You need to move the last 3 commits from `main` to a new branch, then remove them from main (unpushed). How?**

<details>
<summary>Show answer</summary>

`git branch new-feature`, then `git reset --hard HEAD~3` on main. The new branch keeps the three commits.

</details>

**Q114. You need to remove a specific commit from the middle of your unpushed branch. How?**

<details>
<summary>Show answer</summary>

`git rebase -i <commit>^` and `drop` that line, or `git rebase --onto <commit>^ <commit> <branch>`.

</details>

**Q115. You want to reorder two commits so the refactor comes before the feature. How?**

<details>
<summary>Show answer</summary>

`git rebase -i main` and swap the two lines in the todo list. Resolve any conflicts that ordering creates.

</details>

**Q116. Your stacked branches A → B → C need to be rebased onto updated main. How do you do it efficiently?**

<details>
<summary>Show answer</summary>

Check out C and run `git rebase -i --update-refs main` (Git 2.38+). A and B are updated automatically. Then force-push each branch with lease.

</details>

**Q117. You accidentally rebased the shared `develop` branch locally. Not yet pushed. What now?**

<details>
<summary>Show answer</summary>

Don't push. `git reset --hard origin/develop` (or `ORIG_HEAD`) to restore it, and make your changes with merge or on a separate branch.

</details>

**Q118. Your organization's `main` must have linear history, but your PR has a merge from main. How do you fix the PR?**

<details>
<summary>Show answer</summary>

`git fetch && git rebase origin/main`, which drops the merge commit and replays your commits linearly. Then `git push --force-with-lease`.

</details>

**Q119. You need to rewrite the author on every commit in a repository after a company email change. How?**

<details>
<summary>Show answer</summary>

Create a `.mailmap` mapping old to new identities. If display is enough, commit the `.mailmap`. To actually rewrite, run `git filter-repo --mailmap .mailmap` on a fresh clone, coordinate a force-push and have everyone re-clone.

</details>

**Q120. You want to remove a folder (`docs/internal/`) from all history before open-sourcing a repo. How?**

<details>
<summary>Show answer</summary>

On a fresh mirror clone: `git filter-repo --invert-paths --path docs/internal/`, check the result, then push to a new public repository. Never publish the old history.

</details>

**Q121. You must extract `services/billing` with its history into a new repository. How?**

<details>
<summary>Show answer</summary>

Clone the monorepo fresh, run `git filter-repo --subdirectory-filter services/billing`, add the new remote and push all branches and tags.

</details>

**Q122. You need to move a project into a subdirectory of another repo, preserving history. How?**

<details>
<summary>Show answer</summary>

In a clone of the project: `git filter-repo --to-subdirectory-filter project-a`. In the target repo: `git remote add a ../project-a && git fetch a && git merge --allow-unrelated-histories a/main`.

</details>

**Q123. After running filter-repo, your colleagues' old clones still contain the removed data. What must happen?**

<details>
<summary>Show answer</summary>

Everyone must re-clone (or hard-reset and expire reflogs and gc). Pulling into old clones would reintroduce the old commits. Old forks and caches must be cleaned too.

</details>

**Q124. Why does filter-repo refuse to run on your repository?**

<details>
<summary>Show answer</summary>

By default it requires a fresh clone, to protect unpushed work. Clone fresh (`git clone --no-local` or `--mirror`) or use `--force` if you're sure.

</details>

**Q125. You want to replace all occurrences of a leaked password across history. How?**

<details>
<summary>Show answer</summary>

Create `replacements.txt` with `oldpassword==>***REMOVED***` (or `regex:` patterns), run `git filter-repo --replace-text replacements.txt`, force-push all refs, and rotate the password.

</details>

**Q126. A rebase changed commit dates and the PR timeline looks odd. Can you keep original dates?**

<details>
<summary>Show answer</summary>

Author dates are preserved by default; committer dates change. Use `git rebase --committer-date-is-author-date` to set committer dates equal to author dates.

</details>

**Q127. You need to drop the last commit on a branch that's already pushed and only you use. How?**

<details>
<summary>Show answer</summary>

`git reset --hard HEAD~1` then `git push --force-with-lease`. If others might use the branch, use `git revert` instead.

</details>

**Q128. Your interactive rebase todo list is huge and you only want to edit the most recent few. Tip?**

<details>
<summary>Show answer</summary>

Rebase a smaller range, e.g. `git rebase -i HEAD~4`, instead of the full branch from main.

</details>

**Q129. Your PR branch was rebased by a bot (e.g. "update branch" button) and your local branch diverged. How do you sync?**

<details>
<summary>Show answer</summary>

If you have no new local commits: `git fetch && git reset --hard origin/feature`. If you do: `git pull --rebase` to replay them on top of the updated remote branch.

</details>

**Q130. You need to combine two separate repositories into one monorepo, keeping both histories. How?**

<details>
<summary>Show answer</summary>

Move each repo's content into a subdirectory with `git filter-repo --to-subdirectory-filter <name>`, then in the new monorepo `git fetch` each and merge with `--allow-unrelated-histories`.

</details>

**Q131. You squash-merged a PR but forgot one commit's content. Can you recover the original commits?**

<details>
<summary>Show answer</summary>

Yes. They still exist on the branch (if not deleted) or in the platform's PR refs (`refs/pull/N/head`), and locally in your reflog. Cherry-pick or diff from there.

</details>

**Q132. You want to clean up your history but keep a safety net. What's the habit?**

<details>
<summary>Show answer</summary>

Create a backup ref first: `git branch backup/feature-$(date +%s)`. If the rewrite goes wrong, `git reset --hard backup/...`.

</details>

**Q133. You want to rebase but your working tree has uncommitted changes. Options?**

<details>
<summary>Show answer</summary>

Commit them, stash them, or use `git rebase --autostash` (or set `rebase.autoStash true`) to stash and reapply automatically.

</details>

**Q134. A rebase stopped and you're not sure which commit is being applied. How do you check?**

<details>
<summary>Show answer</summary>

`git status` shows the current step and commit. `git log -1 REBASE_HEAD` (or `.git/rebase-merge/stopped-sha`) shows the commit being replayed.

</details>

**Q135. After a rebase, your PR lost all its review comments' context on GitHub. Why?**

<details>
<summary>Show answer</summary>

Comments are attached to specific commits and diffs. Rewriting the commits makes old comments "outdated". Teams often avoid force-pushing during active review and use fixup commits, squashing at merge time.

</details>

**Q136. You want to rebase onto main but keep merges inside your branch intact. How?**

<details>
<summary>Show answer</summary>

`git rebase --rebase-merges main` recreates the internal merge structure on the new base.

</details>

**Q137. You discovered a commit with a wrong ticket ID in the message, already merged to main. Should you fix it?**

<details>
<summary>Show answer</summary>

Don't rewrite main. Add a git note (`git notes add -m "Correct ticket: PAY-321"`), or correct the link on the platform. Main's history stays untouched.

</details>

**Q138. You need to undo a `git filter-repo` run you just did locally. Possible?**

<details>
<summary>Show answer</summary>

Filter-repo expires reflogs and repacks, so local undo is hard. Restore from a backup or re-clone the original remote, which is why you always run it on a fresh clone and keep the original untouched.

</details>

**Q139. You want to drop all commits after a certain point on your local branch but keep them somewhere. How?**

<details>
<summary>Show answer</summary>

`git branch archive/experiment` at the current tip, then `git reset --hard <good-commit>`.

</details>

**Q140. Your branch history shows a commit "Revert X" followed by "Revert Revert X". How do you clean this before merging?**

<details>
<summary>Show answer</summary>

Interactive rebase and drop both revert commits (they cancel out), or drop all three if the original change isn't needed.

</details>

**Q141. A colleague asks you to "rebase on main" but there's a conflict in a file you never touched. Why?**

<details>
<summary>Show answer</summary>

One of your commits touched nearby lines or was based on an old version of that file, or a merge from main into your branch introduced it. Inspect with `git show REBASE_HEAD` to see which of your commits is conflicting.

</details>

**Q142. You need to temporarily rewind your branch to test an older version, then return. How?**

<details>
<summary>Show answer</summary>

`git switch --detach <old-sha>` to test, then `git switch -` to return. No rewrite is needed.

</details>

**Q143. Your commit includes both a fix and a debug print in the same hunk. How do you remove just the debug line from history?**

<details>
<summary>Show answer</summary>

`git rebase -i`, mark the commit `edit`, remove the line, `git commit --amend`, `git rebase --continue`.

</details>

**Q144. You want the last commit's message reused when you redo a commit. How?**

<details>
<summary>Show answer</summary>

`git commit -C ORIG_HEAD` (reuse without editing) or `-c ORIG_HEAD` (reuse and edit) after a reset.

</details>

**Q145. Someone pushed commits with a "WIP" message to main. Your policy forbids rewriting main. What do you do?**

<details>
<summary>Show answer</summary>

Leave history alone. Add a commit-message check in CI and server rules (push rules / rulesets) to prevent it in future, and add notes if context is needed.

</details>

**Q146. Your rebase todo shows unexpected commits from main. Why?**

<details>
<summary>Show answer</summary>

Your upstream argument is wrong (e.g. an old local main), so Git sees main's commits as yours. Fetch and rebase onto `origin/main`, or use `git rebase -i $(git merge-base HEAD origin/main)`.

</details>

**Q147. You need to sign all commits on your branch retroactively. How?**

<details>
<summary>Show answer</summary>

`git rebase --exec 'git commit --amend --no-edit -S' main` (with signing configured), then force-push with lease.

</details>

**Q148. You rebased a branch that had a tag on one of its commits. What happens to the tag?**

<details>
<summary>Show answer</summary>

The tag still points at the old commit, which is now outside the branch history. Move it only if it's an unpublished, private tag.

</details>

**Q149. How do you check whether a branch has been rewritten since your last fetch?**

<details>
<summary>Show answer</summary>

After fetching, compare `git rev-parse @{u}` against `git reflog show origin/branch`. A "forced-update" in fetch output (`+ abc...def (forced update)`) indicates a rewrite.

</details>

**Q150. When would you prefer `git reset --soft` over interactive rebase for squashing?**

<details>
<summary>Show answer</summary>

When you want all commits on the branch combined into one quickly: `git reset --soft $(git merge-base HEAD main) && git commit`. It's faster and conflict-free.

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
