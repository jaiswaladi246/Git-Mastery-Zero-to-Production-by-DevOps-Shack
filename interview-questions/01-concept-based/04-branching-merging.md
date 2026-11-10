<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Branching & Merging

Questions 151–200 of the concept-based questions bank. Try answering each one out loud before opening the answer.

---

**Q151. Why is branching cheap in Git compared to older VCSs?**

<details>
<summary>Show answer</summary>

A Git branch is just a pointer file holding a commit hash, so creating one writes a few bytes. Older systems like SVN copied directory trees on the server to create branches.

</details>

**Q152. How do you create a branch from a specific commit or tag?**

<details>
<summary>Show answer</summary>

`git switch -c <name> <commit-or-tag>`, or `git branch <name> <start-point>` to create it without switching.

</details>

**Q153. What does `git switch -` do?**

<details>
<summary>Show answer</summary>

It switches back to the previously checked-out branch, like `cd -` in the shell.

</details>

**Q154. What happens to uncommitted changes when you switch branches?**

<details>
<summary>Show answer</summary>

Git carries them over if they don't conflict with the target branch. If switching would overwrite them, Git refuses. Then you commit, stash, use `--merge`, or use a worktree.

</details>

**Q155. What is the difference between `git branch -d` and `-D`?**

<details>
<summary>Show answer</summary>

`-d` deletes a branch only if it's fully merged into its upstream or HEAD; `-D` force-deletes regardless. A force-deleted branch's commits remain recoverable through the reflog for a while.

</details>

**Q156. How do you rename a branch locally and on the remote?**

<details>
<summary>Show answer</summary>

`git branch -m old new`, then `git push origin -u new` and `git push origin --delete old`. Teammates update with `git fetch --prune` and `git branch -u origin/new new`.

</details>

**Q157. How do you list branches merged or not merged into main?**

<details>
<summary>Show answer</summary>

`git branch --merged main` lists branches whose tips are reachable from main (safe to delete); `git branch --no-merged main` lists branches with unique commits.

</details>

**Q158. What is an upstream (tracking) branch?**

<details>
<summary>Show answer</summary>

The remote branch a local branch is linked to, used as the default for `pull`, `push` and ahead/behind counts in `git status`. Set it with `git push -u` or `git branch --set-upstream-to=origin/x`.

</details>

**Q159. What does `git branch -vv` show?**

<details>
<summary>Show answer</summary>

Each local branch with its tip commit, upstream branch, and ahead/behind counts relative to it.

</details>

**Q160. What is an orphan branch?**

<details>
<summary>Show answer</summary>

A branch with no parent history, created with `git switch --orphan <name>`. It's used for things like a `gh-pages` site or completely separate content in the same repo.

</details>

**Q161. What is detached HEAD, and is it dangerous?**

<details>
<summary>Show answer</summary>

HEAD points directly at a commit instead of a branch, for example after checking out a tag. It isn't dangerous to look around, but new commits aren't on any branch and can be lost after you switch away unless you create a branch.

</details>

**Q162. How do you save commits made in detached HEAD?**

<details>
<summary>Show answer</summary>

Run `git switch -c <new-branch>` while still detached. If you've already left, find the commit in `git reflog` and `git branch <name> <sha>`.

</details>

**Q163. What branch naming rules does Git enforce?**

<details>
<summary>Show answer</summary>

Names can't contain spaces, `~`, `^`, `:`, `?`, `*`, `[`, `\`, or `..`, can't begin with `-` or end with `.lock` or `/`, and can't be `@`. `git check-ref-format --branch <name>` validates a name.

</details>

**Q164. What is a fast-forward merge?**

<details>
<summary>Show answer</summary>

When the target branch's tip is an ancestor of the branch being merged, Git simply moves the target pointer forward. No merge commit is created and history stays linear.

</details>

**Q165. What is a three-way merge?**

<details>
<summary>Show answer</summary>

A merge where both branches have diverged. Git compares each side against their merge base and combines the changes, creating a merge commit with two parents. Conflicts arise where both sides changed the same lines differently.

</details>

**Q166. What does `--no-ff` do?**

<details>
<summary>Show answer</summary>

It forces a merge commit even when a fast-forward is possible, keeping a visible record that a set of commits was developed and merged as a unit.

</details>

**Q167. What does `--ff-only` do?**

<details>
<summary>Show answer</summary>

It refuses to merge unless a fast-forward is possible. It's useful for keeping history linear and preventing accidental merge commits, for example with `pull.ff only`.

</details>

**Q168. What does `git merge --squash` do?**

<details>
<summary>Show answer</summary>

It applies all changes from the branch to the index as one combined change without committing and without recording a merge relationship. You then commit once. The branch isn't marked as merged.

</details>

**Q169. Why does `git branch -d` refuse to delete a branch after a squash merge?**

<details>
<summary>Show answer</summary>

Because the branch's original commits aren't ancestors of main; the squash created a brand-new commit. Git can't tell the work was integrated, so you must use `-D` after verifying.

</details>

**Q170. What is the default merge strategy in modern Git?**

<details>
<summary>Show answer</summary>

`ort` (Ostensibly Recursive's Twin), the default since Git 2.34. It replaced `recursive`, is much faster, and handles renames better.

</details>

**Q171. What merge strategies exist besides ort?**

<details>
<summary>Show answer</summary>

`recursive` (older default), `resolve` (simple two-head), `octopus` (more than two branches, no conflicts allowed), `ours` (keep our tree entirely), and `subtree` (merge into a subdirectory).

</details>

**Q172. What is the difference between `-s ours` and `-X ours`?**

<details>
<summary>Show answer</summary>

`-s ours` is a strategy that creates a merge commit but keeps our tree exactly, discarding all their changes. `-X ours` is an option for ort/recursive that merges normally but resolves conflicting hunks in favor of our side.

</details>

**Q173. What is an octopus merge?**

<details>
<summary>Show answer</summary>

A single merge commit with more than two parents, created by `git merge branchA branchB branchC`. It's only allowed when there are no conflicts.

</details>

**Q174. What causes a merge conflict?**

<details>
<summary>Show answer</summary>

Both sides changed the same lines (or adjacent lines) differently relative to the merge base, or made incompatible structural changes such as one modifying and the other deleting a file, or both renaming it differently.

</details>

**Q175. What do the conflict markers mean?**

<details>
<summary>Show answer</summary>

`<<<<<<< HEAD` begins our version, `=======` separates, and `>>>>>>> branch` ends their version. With `diff3`/`zdiff3` style, a `|||||||` section shows the common ancestor.

</details>

**Q176. Why use `merge.conflictstyle zdiff3`?**

<details>
<summary>Show answer</summary>

It shows the original (base) text in conflicts, so you can see what each side intended to change rather than guessing between two final versions. `zdiff3` also trims common lines for clarity.

</details>

**Q177. How do you resolve a conflict by taking one side for a whole file?**

<details>
<summary>Show answer</summary>

`git checkout --ours <file>` or `git checkout --theirs <file>` (or `git restore --ours/--theirs`), then `git add <file>`.

</details>

**Q178. What is a modify/delete conflict?**

<details>
<summary>Show answer</summary>

One branch modified a file and the other deleted it. You resolve it by keeping the file (`git add`) or confirming the deletion (`git rm`).

</details>

**Q179. How do you abort a merge in progress?**

<details>
<summary>Show answer</summary>

`git merge --abort` restores the pre-merge state (as long as you had no uncommitted changes before starting).

</details>

**Q180. What does `git mergetool` do?**

<details>
<summary>Show answer</summary>

It opens each conflicted file in a configured visual merge tool (VS Code, Meld, KDiff3, vimdiff, Beyond Compare) showing base, local, remote and merged panes.

</details>

**Q181. What is a semantic conflict?**

<details>
<summary>Show answer</summary>

Changes that merge without textual conflicts but break behavior, such as one branch renaming a function while another adds a call to the old name. Only builds and tests catch it, which is why CI should test the merge result.

</details>

**Q182. What is a criss-cross merge?**

<details>
<summary>Show answer</summary>

When two branches merge each other repeatedly so there is more than one best common ancestor. ort handles it by recursively merging the ancestors into a virtual base.

</details>

**Q183. How does Git detect renames during a merge?**

<details>
<summary>Show answer</summary>

It compares deleted and added files for content similarity (default threshold 50%, configurable with `-X find-renames=<n>`) and treats close matches as renames, applying the other side's changes to the new path.

</details>

**Q184. What is `git merge-base --is-ancestor` used for?**

<details>
<summary>Show answer</summary>

To test whether one commit is an ancestor of another in scripts. It exits 0 if true, for example to check if a fix is already included in a release branch.

</details>

**Q185. How do you check which branches contain a commit?**

<details>
<summary>Show answer</summary>

`git branch --contains <sha>` (local) or `git branch -r --contains <sha>` (remote); `git tag --contains <sha>` shows which releases include it.

</details>

**Q186. What is the difference between merging main into feature and rebasing feature onto main?**

<details>
<summary>Show answer</summary>

Merging main into feature adds a merge commit to feature and keeps its history unchanged; rebasing replays feature's commits on top of main, creating new commits and a linear history. Rebasing should only be done on branches that aren't shared.

</details>

**Q187. What does "merged results pipeline" or "test the merge commit" mean?**

<details>
<summary>Show answer</summary>

Running CI on the result of merging the PR into the latest target branch, not just the PR's own head. It catches semantic conflicts. GitHub's PR checkout and GitLab's merged results pipelines do this.

</details>

**Q188. What is `git merge -X ignore-space-change` for?**

<details>
<summary>Show answer</summary>

It ignores whitespace-only differences when merging, reducing conflicts caused by reformatting or indentation changes.

</details>

**Q189. How can you preview what a merge would do without changing anything?**

<details>
<summary>Show answer</summary>

`git merge --no-commit --no-ff <branch>` then inspect and `git merge --abort`, or in Git 2.38+, `git merge-tree --write-tree main feature`, which computes the merge result and conflicts without touching the working tree.

</details>

**Q190. What does `git log --merge` show during a conflict?**

<details>
<summary>Show answer</summary>

Commits on both sides of the merge that touched the conflicted files, helping you understand why the conflict happened.

</details>

**Q191. How do you undo a merge that you just completed locally?**

<details>
<summary>Show answer</summary>

`git reset --hard ORIG_HEAD` (or `HEAD~1`) if it isn't pushed. If it's pushed, use `git revert -m 1 <merge-commit>`.

</details>

**Q192. Why does reverting a merge make re-merging the branch tricky?**

<details>
<summary>Show answer</summary>

After reverting a merge, Git still considers the branch's commits merged, so merging again only brings new commits and the original changes stay reverted. You must revert the revert before re-merging.

</details>

**Q193. What does `-m 1` mean in `git revert -m 1`?**

<details>
<summary>Show answer</summary>

It names parent 1 as the mainline, the side to keep. The revert undoes the changes introduced by the other parent (the merged branch).

</details>

**Q194. What is a "merge commit message" convention?**

<details>
<summary>Show answer</summary>

By default, "Merge branch 'feature/x' into main"; platforms add PR numbers, such as "Merge pull request #42 from org/feature-x". Squash merges typically use the PR title plus the PR number.

</details>

**Q195. What is a long-lived branch, and why can it cause problems?**

<details>
<summary>Show answer</summary>

A branch that exists for weeks or months alongside main. It drifts, accumulates conflicts, hides integration problems until the end, and often ends in a painful "merge hell".

</details>

**Q196. What is "integration hell"?**

<details>
<summary>Show answer</summary>

The pain of integrating many large, long-diverged branches at once: huge conflicts, semantic breakages and delayed releases. Continuous integration and short-lived branches avoid it.

</details>

**Q197. How does `rerere` help with merges?**

<details>
<summary>Show answer</summary>

With `rerere.enabled true`, Git records how you resolved a conflict and automatically reapplies the same resolution when the identical conflict appears again, such as in repeated test merges or rebases.

</details>

**Q198. What is `git cherry` used for?**

<details>
<summary>Show answer</summary>

`git cherry -v upstream branch` lists commits on branch, marking with `-` those whose equivalent patch already exists upstream (e.g. cherry-picked) and with `+` those that don't.

</details>

**Q199. What does `git log --left-right --cherry-pick A...B` do?**

<details>
<summary>Show answer</summary>

It shows commits unique to each side of A...B while omitting commits whose patches are equivalent on both sides, which is useful when cherry-picks make hashes differ.

</details>

**Q200. Can you merge unrelated histories?**

<details>
<summary>Show answer</summary>

Yes, with `git merge --allow-unrelated-histories other`. This is used when combining two independent repositories into one.

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
