<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Rebasing & Undoing Changes

Questions 201–250 of the concept-based questions bank. Try answering each one out loud before opening the answer.

---

**Q201. What does `git rebase` do?**

<details>
<summary>Show answer</summary>

It takes the commits unique to your branch and reapplies them one by one on top of a new base commit, creating new commits with new hashes. The result looks as if the branch was started from the new base.

</details>

**Q202. What is the golden rule of rebasing?**

<details>
<summary>Show answer</summary>

Don't rebase commits that others have based work on, meaning commits already pushed to a shared branch. Rewriting them forces everyone else to reconcile divergent histories.

</details>

**Q203. When is it acceptable to rebase a pushed branch?**

<details>
<summary>Show answer</summary>

When it's your own feature branch that nobody else builds on, such as a PR branch. After rebasing, update it with `git push --force-with-lease`.

</details>

**Q204. What are the advantages of rebase over merge?**

<details>
<summary>Show answer</summary>

Linear, readable history, no noisy "merge main into feature" commits, easier `git bisect` and `git log`, and the ability to clean commits before review.

</details>

**Q205. What are the disadvantages of rebase?**

<details>
<summary>Show answer</summary>

It rewrites history (new hashes), can require resolving the same conflict on several commits, loses the true chronology of development, and is dangerous on shared branches.

</details>

**Q206. What is interactive rebase?**

<details>
<summary>Show answer</summary>

`git rebase -i <base>` opens a todo list of commits that you can reorder and mark as pick, reword, edit, squash, fixup, drop, exec or break. It's used to clean up history before sharing.

</details>

**Q207. What is the difference between squash and fixup in interactive rebase?**

<details>
<summary>Show answer</summary>

Both combine a commit into the previous one. `squash` lets you edit a combined message from both; `fixup` keeps only the earlier commit's message and discards the fixup's.

</details>

**Q208. What does `edit` do in an interactive rebase?**

<details>
<summary>Show answer</summary>

It pauses after applying that commit so you can amend it, split it into several commits (`git reset HEAD~1` then commit in parts), or run commands, then `git rebase --continue`.

</details>

**Q209. What does `exec` do in an interactive rebase?**

<details>
<summary>Show answer</summary>

It runs a shell command at that point in the sequence. If the command fails, the rebase stops. `git rebase -i --exec "make test" main` runs tests after every commit.

</details>

**Q210. What does `--autosquash` do?**

<details>
<summary>Show answer</summary>

It automatically moves `fixup!` and `squash!` commits right after the commits they target and marks them, so the cleanup happens with no manual todo editing. `rebase.autoSquash true` enables it by default.

</details>

**Q211. How do you continue, skip or abort a rebase?**

<details>
<summary>Show answer</summary>

`git rebase --continue` after resolving and staging, `git rebase --skip` to drop the current commit, and `git rebase --abort` to return to the exact pre-rebase state.

</details>

**Q212. How do you undo a rebase that has already finished?**

<details>
<summary>Show answer</summary>

Immediately afterwards, `git reset --hard ORIG_HEAD`. Otherwise, find the pre-rebase tip in `git reflog` (the entry before "rebase (start)") and reset to it.

</details>

**Q213. What does `git rebase --onto` do?**

<details>
<summary>Show answer</summary>

`git rebase --onto <newbase> <upstream> <branch>` takes commits in branch that aren't in upstream and replays them onto newbase. It is used to move a branch off another branch or to remove a range of commits.

</details>

**Q214. Give a practical example of `rebase --onto`.**

<details>
<summary>Show answer</summary>

You branched `feature-b` from `feature-a`, and `feature-a` was squash-merged into main. `git rebase --onto main feature-a feature-b` transplants only feature-b's own commits onto main.

</details>

**Q215. What does `--rebase-merges` do?**

<details>
<summary>Show answer</summary>

It preserves merge commits and the branch topology during a rebase, recreating the merges instead of flattening them into a linear series.

</details>

**Q216. What does `--update-refs` do?**

<details>
<summary>Show answer</summary>

In Git 2.38+, it updates any other branches pointing at commits being rewritten. It's useful for stacked branches, so rebasing the bottom branch also moves the branches stacked on it.

</details>

**Q217. Why are "ours" and "theirs" reversed during a rebase?**

<details>
<summary>Show answer</summary>

Rebase works by checking out the new base and applying your commits onto it. So the branch being built (the base, like main) is "ours", and the commit being replayed (your work) is "theirs".

</details>

**Q218. What does `git pull --rebase` do?**

<details>
<summary>Show answer</summary>

It fetches, then rebases your local unpushed commits on top of the updated upstream branch instead of creating a merge commit.

</details>

**Q219. What does `rebase.autoStash` do?**

<details>
<summary>Show answer</summary>

It automatically stashes uncommitted changes before a rebase and reapplies them afterwards, so you can rebase with a dirty working tree.

</details>

**Q220. What is `git reset`?**

<details>
<summary>Show answer</summary>

It moves the current branch to a specified commit and, depending on mode, updates the index and working tree. It's the main tool to undo local commits.

</details>

**Q221. Explain `git reset --soft`, `--mixed` and `--hard`.**

<details>
<summary>Show answer</summary>

`--soft` moves the branch only, keeping the index and working tree (changes stay staged). `--mixed` (the default) also resets the index (changes become unstaged). `--hard` also resets the working tree, discarding changes.

</details>

**Q222. What does `git reset --keep` do?**

<details>
<summary>Show answer</summary>

Like `--hard`, it moves the branch and updates files, but it aborts if a file with local changes would need to change. It's a safer way to drop commits without losing uncommitted work.

</details>

**Q223. How do you combine the last 3 commits into one without interactive rebase?**

<details>
<summary>Show answer</summary>

`git reset --soft HEAD~3` then `git commit -m "new message"`. All changes from the three commits remain staged and become one commit.

</details>

**Q224. What is `git revert`?**

<details>
<summary>Show answer</summary>

It creates a new commit that applies the inverse of a previous commit, undoing its effect while preserving history. It's the safe way to undo shared commits.

</details>

**Q225. When should you use revert instead of reset?**

<details>
<summary>Show answer</summary>

When the commit has been pushed to a shared branch. Revert adds history; reset rewrites it and would break other people's clones.

</details>

**Q226. How do you revert several commits at once as a single commit?**

<details>
<summary>Show answer</summary>

`git revert --no-commit <oldest>^..<newest>` then `git commit -m "Revert ..."`. Without `--no-commit`, each commit is reverted individually.

</details>

**Q227. Can a revert conflict?**

<details>
<summary>Show answer</summary>

Yes. If later commits changed the same lines, Git can't cleanly apply the inverse. Resolve like a merge, then `git revert --continue`, or `--abort`.

</details>

**Q228. What does `git restore --source` do?**

<details>
<summary>Show answer</summary>

It restores files from a given commit into the working tree (and with `--staged`, into the index), for example `git restore --source=HEAD~5 config.yaml`.

</details>

**Q229. How do you recover a file deleted in an earlier commit?**

<details>
<summary>Show answer</summary>

Find the deleting commit with `git log --diff-filter=D -- path`, then `git restore --source=<deleting-commit>^ path`.

</details>

**Q230. How do you undo `git add` before committing?**

<details>
<summary>Show answer</summary>

`git restore --staged <file>` (or `git reset <file>`). The changes stay in the working tree.

</details>

**Q231. How do you undo `git commit --amend`?**

<details>
<summary>Show answer</summary>

The pre-amend commit is in the reflog: `git reset --soft HEAD@{1}` brings the branch back to it while keeping the amended content staged.

</details>

**Q232. How do you undo a `git stash pop` that caused conflicts?**

<details>
<summary>Show answer</summary>

The stash isn't dropped when pop conflicts. You can `git reset --hard` (careful with other changes) or `git checkout -- .` to discard the half-applied stash; the stash entry is still in `git stash list`.

</details>

**Q233. What is the difference between `git checkout <commit> -- file` and `git checkout <commit>`?**

<details>
<summary>Show answer</summary>

With `-- file`, it copies the file from that commit into the working tree and index while staying on your branch. Without a path, it moves HEAD to the commit (detached HEAD).

</details>

**Q234. What does `git reset HEAD~1` do to a pushed commit?**

<details>
<summary>Show answer</summary>

It moves your local branch back, but the remote still has the commit. Your next push will be rejected as non-fast-forward; forcing it would rewrite shared history, so revert is preferred.

</details>

**Q235. How long can you recover "lost" commits?**

<details>
<summary>Show answer</summary>

As long as they're referenced by a reflog entry (90 days by default for reachable, 30 days for unreachable entries) or until `gc` prunes unreachable objects after the grace period (two weeks by default).

</details>

**Q236. What is `git reflog expire`?**

<details>
<summary>Show answer</summary>

It removes old reflog entries according to expiry settings. `git reflog expire --expire=now --all` followed by `git gc --prune=now` permanently removes unreachable objects, which is used after purging secrets.

</details>

**Q237. What is the danger of `git push --force`?**

<details>
<summary>Show answer</summary>

It overwrites the remote branch with your local version, discarding any commits others pushed in the meantime. On shared branches this silently destroys work.

</details>

**Q238. How is `--force-with-lease` safer?**

<details>
<summary>Show answer</summary>

It only forces the push if the remote branch still points where your remote-tracking ref says it does. If someone else pushed since your last fetch, it refuses.

</details>

**Q239. What does `--force-if-includes` add?**

<details>
<summary>Show answer</summary>

Used with `--force-with-lease`, it also checks that the remote tip you're overwriting is included in your local branch's reflog history. That prevents a background `git fetch` from silently updating your lease and defeating its protection.

</details>

**Q240. Can you undo `git clean -fd`?**

<details>
<summary>Show answer</summary>

Not with Git. Untracked files were never stored in the object database. Recovery depends on editor local history, OS backups or file recovery tools, so always run `git clean -n` first.

</details>

**Q241. What is the safest way to experiment with destructive history changes?**

<details>
<summary>Show answer</summary>

Create a backup branch first (`git branch backup-before-rebase`), or copy the repo. Then any reset, rebase or filter can be undone by resetting to the backup.

</details>

**Q242. What does `git rebase -i --root` do?**

<details>
<summary>Show answer</summary>

It allows interactive editing of every commit including the very first (root) commit. It's useful in small or new repos to fix early history.

</details>

**Q243. How do you change an old commit message that isn't the latest?**

<details>
<summary>Show answer</summary>

`git rebase -i <commit>^`, change `pick` to `reword` for that commit, save, and edit the message. Only do this on unshared history.

</details>

**Q244. How do you remove a specific commit from the middle of your local branch?**

<details>
<summary>Show answer</summary>

`git rebase -i <commit>^` and change its line to `drop` (or delete the line), or `git rebase --onto <commit>^ <commit>`.

</details>

**Q245. How do you split one commit into two?**

<details>
<summary>Show answer</summary>

Mark it `edit` in an interactive rebase. When it stops, run `git reset HEAD~1`, stage and commit the parts separately (`git add -p`), then `git rebase --continue`.

</details>

**Q246. What is `git commit --fixup=reword:<sha>`?**

<details>
<summary>Show answer</summary>

In newer Git, it creates an `amend!` style commit that, when autosquashed, replaces only the target commit's message without changing its content.

</details>

**Q247. What happens to tags when you rebase?**

<details>
<summary>Show answer</summary>

Tags keep pointing at the old commits; they don't move. If a rebased commit was tagged, you'd need to move the tag, which you should never do for published release tags.

</details>

**Q248. Why might a rebase produce an "empty commit" message?**

<details>
<summary>Show answer</summary>

If a commit's changes are already present in the new base (for example it was cherry-picked upstream), replaying it results in no changes. Git drops it or asks you to skip, depending on `--empty` settings.

</details>

**Q249. What is the difference between `git rebase main` and `git rebase origin/main`?**

<details>
<summary>Show answer</summary>

`main` is your local branch, which may be stale. `origin/main` is your last fetched view of the remote. Rebasing onto `origin/main` after `git fetch` uses the latest shared state without updating local main.

</details>

**Q250. What is `git rebase --interactive --keep-base`?**

<details>
<summary>Show answer</summary>

It rebases interactively onto the same merge base the branch already has, letting you edit commits without pulling in new upstream changes. It's handy for cleanup without conflict risk.

</details>

---

← [Back to Concept-Based Questions](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
