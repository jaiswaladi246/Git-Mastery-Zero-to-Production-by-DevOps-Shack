<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Staging, Commits & History

Questions 101–150 of the concept-based questions bank. Try answering each one out loud before opening the answer.

---

**Q101. What is an atomic commit?**

<details>
<summary>Show answer</summary>

A commit that contains exactly one logical change and leaves the project working. Atomic commits are easy to review, revert, cherry-pick and bisect.

</details>

**Q102. Why is "one logical change per commit" important?**

<details>
<summary>Show answer</summary>

If a commit mixes a bug fix with a refactor, you can't revert one without the other, reviews are harder, and bisect points to a commit that changed too many things to reason about.

</details>

**Q103. What does `git commit -a` do, and what's its limitation?**

<details>
<summary>Show answer</summary>

It stages all modified and deleted tracked files before committing. It does not include new untracked files, and it bypasses careful staging, so unrelated changes can slip in.

</details>

**Q104. What does `git commit --amend` do?**

<details>
<summary>Show answer</summary>

It replaces the last commit with a new one containing the current index and optionally a new message. The old commit stays in the reflog. It rewrites history, so avoid it on commits that are already shared.

</details>

**Q105. How do you change only the author of the last commit?**

<details>
<summary>Show answer</summary>

`git commit --amend --author="Name <email>" --no-edit`, or fix your config and run `git commit --amend --reset-author --no-edit`.

</details>

**Q106. What is an empty commit, and when is it used?**

<details>
<summary>Show answer</summary>

A commit with no changes, created with `git commit --allow-empty -m "..."`. It is used to trigger CI pipelines or mark an event in history.

</details>

**Q107. What does `git commit -v` do?**

<details>
<summary>Show answer</summary>

It shows the diff of the staged changes in the editor below the message template, so you can review exactly what you're committing while writing the message.

</details>

**Q108. What is a commit trailer?**

<details>
<summary>Show answer</summary>

A `Key: value` line at the end of a commit message, such as `Signed-off-by:`, `Co-authored-by:`, `Reviewed-by:` or `Refs:`. Tools parse trailers, and `git interpret-trailers` can add or read them.

</details>

**Q109. What is `Signed-off-by` and the DCO?**

<details>
<summary>Show answer</summary>

`git commit -s` adds `Signed-off-by: Name <email>`, certifying the Developer Certificate of Origin: that you have the right to submit the code under the project's license. Many open-source projects require it. It's not a cryptographic signature.

</details>

**Q110. How do you credit multiple authors on one commit?**

<details>
<summary>Show answer</summary>

Add `Co-authored-by: Name <email>` trailers at the end of the message. GitHub and GitLab display all co-authors.

</details>

**Q111. What is the difference between `git restore` and `git reset` for files?**

<details>
<summary>Show answer</summary>

`git restore <file>` discards working tree changes, and `git restore --staged <file>` unstages. `git reset <file>` also unstages (resetting the index entry to HEAD), but `reset` is primarily for moving branch pointers.

</details>

**Q112. How do you discard all local changes, including untracked files?**

<details>
<summary>Show answer</summary>

`git restore .` (or `git reset --hard`) for tracked files, then `git clean -fd` for untracked files and directories. Run `git clean -n` first to see what would be deleted.

</details>

**Q113. What does `git clean -x` add?**

<details>
<summary>Show answer</summary>

It also removes files ignored by `.gitignore`, such as build output and `node_modules`. `-X` removes only ignored files.

</details>

**Q114. How do you search commit messages?**

<details>
<summary>Show answer</summary>

`git log --grep="pattern"`, optionally with `-i` for case-insensitive and `--all-match` when combining multiple `--grep` options.

</details>

**Q115. What is the difference between `git log -S` and `git log -G`?**

<details>
<summary>Show answer</summary>

`-S<string>` (pickaxe) finds commits where the number of occurrences of the string changed, meaning it was added or removed. `-G<regex>` finds commits whose diff contains added or removed lines matching the regex, including lines that were only modified.

</details>

**Q116. How do you show the history of a function?**

<details>
<summary>Show answer</summary>

`git log -L :functionName:path/to/file` shows every commit that changed that function, with diffs. You can also use a line range: `-L 40,60:file`.

</details>

**Q117. What does `git log --first-parent` show?**

<details>
<summary>Show answer</summary>

Only the first-parent chain: on main this shows one entry per merge (the mainline), hiding the individual commits of merged branches.

</details>

**Q118. How do you show only merge commits or exclude them?**

<details>
<summary>Show answer</summary>

`git log --merges` shows only merges; `git log --no-merges` excludes them.

</details>

**Q119. How do you see what files changed in each commit?**

<details>
<summary>Show answer</summary>

`git log --stat` for per-file line counts, `--name-only` for names, or `--name-status` for names with A/M/D/R status letters.

</details>

**Q120. How do you format log output?**

<details>
<summary>Show answer</summary>

`git log --pretty=format:"%h %an %ad %s" --date=short`. Common placeholders: `%H`/`%h` hash, `%an` author, `%ae` email, `%ad` date, `%cr` relative commit date, `%s` subject, `%d` ref names.

</details>

**Q121. What does `git blame` show?**

<details>
<summary>Show answer</summary>

For each line of a file, the commit, author and date that last changed it. `-L` restricts lines, `-w` ignores whitespace, and `-C` detects lines moved or copied from other files.

</details>

**Q122. What is `.git-blame-ignore-revs`?**

<details>
<summary>Show answer</summary>

A file listing commit hashes (like mass reformatting commits) that blame should skip, so lines are attributed to the meaningful earlier change. Enable it with `git config blame.ignoreRevsFile .git-blame-ignore-revs`; GitHub honors it automatically.

</details>

**Q123. What does `git shortlog` do?**

<details>
<summary>Show answer</summary>

It summarizes commits grouped by author. `git shortlog -sn` gives a ranked count. It needs a revision such as `HEAD` when stdin is not a terminal, otherwise it reads a log from stdin.

</details>

**Q124. What is `.mailmap`?**

<details>
<summary>Show answer</summary>

A committed file mapping old or alternate author names and emails to a canonical identity, so `log`, `shortlog` and `blame` display them consistently without rewriting history.

</details>

**Q125. What does `git diff --word-diff` do?**

<details>
<summary>Show answer</summary>

It shows changes at the word level inside lines instead of whole changed lines, which is useful for prose and long lines.

</details>

**Q126. What does `git diff --stat` show?**

<details>
<summary>Show answer</summary>

A summary of files changed with insertion and deletion counts and a small histogram, without full diffs.

</details>

**Q127. What is `diff.colorMoved`?**

<details>
<summary>Show answer</summary>

A setting that highlights lines that were moved (not changed) in a different color, so refactors that move code are easier to review.

</details>

**Q128. What are the diff algorithms available in Git?**

<details>
<summary>Show answer</summary>

`myers` (default), `minimal`, `patience` and `histogram`. `histogram` often produces more readable diffs for code with repeated lines and is a popular setting (`diff.algorithm histogram`).

</details>

**Q129. How do you compare a file between two branches?**

<details>
<summary>Show answer</summary>

`git diff main feature -- path/to/file`, or `git diff main:path feature:path`.

</details>

**Q130. How do you see a file as it was at a specific commit?**

<details>
<summary>Show answer</summary>

`git show <commit>:path/to/file`. To restore it into the working tree, use `git restore --source=<commit> path/to/file`.

</details>

**Q131. What does `git grep` do differently from regular grep?**

<details>
<summary>Show answer</summary>

It searches tracked files quickly using Git's index, and can search any commit or tag without checking it out (`git grep "TODO" v1.2.0`). It also respects `.gitignore`.

</details>

**Q132. How do you count commits on a branch?**

<details>
<summary>Show answer</summary>

`git rev-list --count HEAD`, or `git rev-list --count main..feature` for commits on feature not on main.

</details>

**Q133. What does `git whatchanged` show?**

<details>
<summary>Show answer</summary>

An older command similar to `git log --raw --no-merges`, showing commits with the files they changed. `git log` options are preferred today.

</details>

**Q134. What is the difference between `git log` and `git reflog`?**

<details>
<summary>Show answer</summary>

`git log` walks commit ancestry from a ref, the project history shared with others. `git reflog` shows where your local refs and HEAD have pointed over time, including commits no longer in any branch's history.

</details>

**Q135. How do you find which commit deleted a file?**

<details>
<summary>Show answer</summary>

`git log --diff-filter=D --summary -- path/to/file` or `git log --oneline -- path/to/file`, where the newest entry is the deletion. Restore it with `git restore --source=<commit>^ path/to/file`.

</details>

**Q136. How do you find when a line was removed?**

<details>
<summary>Show answer</summary>

Use the pickaxe on the line's text: `git log -S "exact text" --oneline -- file`, or `git blame --reverse START..HEAD file` to see the last commit where each line existed.

</details>

**Q137. What does `git range-diff` compare?**

<details>
<summary>Show answer</summary>

Two versions of a series of commits, typically a branch before and after a rebase (`git range-diff main@{1} main` or `old-base..old new-base..new`), matching commits and showing how each changed.

</details>

**Q138. What is a patch, and how do `format-patch` and `am` work?**

<details>
<summary>Show answer</summary>

A patch is a text diff with metadata. `git format-patch -3` writes the last three commits as email-style patch files; `git am *.patch` applies them as commits, preserving authorship. The Linux kernel still works this way.

</details>

**Q139. What is the difference between `git apply` and `git am`?**

<details>
<summary>Show answer</summary>

`git apply` applies a diff to the working tree (or index with `--index`) without committing. `git am` applies mailbox-format patches and creates commits with the original author and message.

</details>

**Q140. What does `git describe` output?**

<details>
<summary>Show answer</summary>

The nearest reachable annotated tag, plus the number of commits since then and the abbreviated hash, e.g. `v1.4.2-7-g3f9a1c2`. `--tags` includes lightweight tags; `--dirty` appends a marker if the working tree has changes.

</details>

**Q141. What does `git notes` do?**

<details>
<summary>Show answer</summary>

It attaches extra text to commits without changing their hashes, for example build results or review metadata. Notes are stored in `refs/notes/*` and must be pushed explicitly.

</details>

**Q142. What is the purpose of `git archive`?**

<details>
<summary>Show answer</summary>

It exports a tree (like a tag) as a tar or zip without the `.git` directory, respecting `export-ignore` attributes. It is useful for release tarballs.

</details>

**Q143. What is the difference between `git stash` and committing work in progress?**

<details>
<summary>Show answer</summary>

A stash is local, unnamed by default and easy to forget; it never gets pushed. A WIP commit on a branch can be pushed, backed up, shared and later cleaned up with interactive rebase.

</details>

**Q144. What is a "fixup" commit?**

<details>
<summary>Show answer</summary>

A commit made with `git commit --fixup=<sha>` whose message is `fixup! <original subject>`. `git rebase -i --autosquash` automatically folds it into the target commit.

</details>

**Q145. What is the difference between `--fixup` and `--squash` commits?**

<details>
<summary>Show answer</summary>

Both are folded into the target during autosquash. `fixup!` discards its own message; `squash!` combines both messages and opens the editor. `--fixup=amend:<sha>` can also replace the target's message.

</details>

**Q146. What are the risks of `git add .` from the repository root?**

<details>
<summary>Show answer</summary>

You might stage secrets, build artifacts, large files or unrelated changes. Using `git add -p`, a good `.gitignore` and pre-commit hooks reduces those risks.

</details>

**Q147. What does `git commit --no-verify` do?**

<details>
<summary>Show answer</summary>

It skips the `pre-commit` and `commit-msg` hooks. That is why client-side hooks can't be your only enforcement; CI and server rules must repeat critical checks.

</details>

**Q148. How do you write a multi-paragraph commit message from the command line?**

<details>
<summary>Show answer</summary>

Use multiple `-m` options (`git commit -m "Subject" -m "Body paragraph"`), each becoming a separate paragraph, or omit `-m` to use your editor.

</details>

**Q149. What is a commit template?**

<details>
<summary>Show answer</summary>

A file set via `commit.template` whose content pre-fills the commit message editor, used to remind people of conventions (type, scope, ticket, testing notes).

</details>

**Q150. What is `git log --since/--until` relative to?**

<details>
<summary>Show answer</summary>

The committer date by default. `--author-date-order` and format options let you display author dates, but filtering uses commit timestamps.

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
