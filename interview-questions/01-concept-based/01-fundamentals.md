<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Fundamentals & Configuration

Questions 1–50 of the concept-based questions bank. Try answering each one out loud before opening the answer.

---

**Q1. What is version control and why do teams need it?**

<details>
<summary>Show answer</summary>

Version control records every change to a set of files over time, with who made it, when and why. Teams need it to collaborate without overwriting each other, to go back to any earlier state, to work on parallel lines of development, and to keep an auditable history of every change.

</details>

**Q2. What is Git?**

<details>
<summary>Show answer</summary>

Git is a free, open-source, distributed version control system created by Linus Torvalds in 2005 for Linux kernel development. Every clone holds the full history, most operations are local and fast, and every object is identified by a cryptographic hash of its content.

</details>

**Q3. What is the difference between centralized and distributed version control?**

<details>
<summary>Show answer</summary>

In centralized VCS (SVN, Perforce) the full history lives on one server and clients only have a working copy, so most operations need the server. In distributed VCS (Git, Mercurial) every clone is a complete repository with full history, so you can commit, branch, diff and view logs offline, and any clone can restore the server.

</details>

**Q4. What is the difference between Git and GitHub?**

<details>
<summary>Show answer</summary>

Git is the version control tool that runs locally. GitHub is a hosting platform for Git repositories that adds collaboration features: pull requests, code review, issues, Actions CI/CD, permissions and security scanning. GitLab, Bitbucket and Azure Repos are alternatives to GitHub, not to Git.

</details>

**Q5. Why was Git created?**

<details>
<summary>Show answer</summary>

In 2005 the Linux kernel community lost free access to BitKeeper, the proprietary DVCS it used. Linus Torvalds wrote Git to replace it, with goals of speed, data integrity, support for thousands of parallel branches, and fully distributed workflows.

</details>

**Q6. Does Git store differences or snapshots?**

<details>
<summary>Show answer</summary>

Conceptually Git stores snapshots: each commit points to a full tree of the project. Unchanged files are not duplicated; the new tree simply references the same blob. Deltas are only used as a storage optimization inside packfiles.

</details>

**Q7. What are the three main areas of a Git project?**

<details>
<summary>Show answer</summary>

The working tree (files you edit), the staging area or index (what will go into the next commit), and the repository (`.git` directory holding commits and refs). Commands move content between them: `add` (working tree → index), `commit` (index → repository), `restore`/`checkout` (repository → working tree).

</details>

**Q8. What is the staging area and why does it exist?**

<details>
<summary>Show answer</summary>

The staging area (index) is an intermediate layer where you assemble the exact content of the next commit. It lets you commit only part of your changes, for example splitting a bug fix and an unrelated refactor into two clean commits, even when both are in the same file (`git add -p`).

</details>

**Q9. What are the possible states of a file in Git?**

<details>
<summary>Show answer</summary>

Untracked (Git has never tracked it), unmodified (tracked and same as last commit), modified (changed but not staged), and staged (change is in the index, ready to commit). Ignored files are untracked files Git deliberately hides.

</details>

**Q10. What does `git init` do?**

<details>
<summary>Show answer</summary>

It creates a new, empty repository by creating the `.git` directory with its object store, refs, HEAD and config. The current folder becomes the working tree. `git init -b main` sets the initial branch name.

</details>

**Q11. What does `git clone` do?**

<details>
<summary>Show answer</summary>

It copies a remote repository: it creates a new directory, initializes `.git`, downloads all objects and refs, creates remote-tracking branches (`origin/*`), configures the `origin` remote, and checks out the default branch.

</details>

**Q12. What is a commit?**

<details>
<summary>Show answer</summary>

A commit is an object that records a snapshot of the project (a pointer to one tree), zero or more parent commits, the author and committer with timestamps, and a message. Its ID is the hash of all of that, so any change to content or history produces a different ID.

</details>

**Q13. What is a commit hash?**

<details>
<summary>Show answer</summary>

A 40-character hexadecimal SHA-1 (or 64-character SHA-256 in SHA-256 repos) computed from the commit's content, including its tree, parents, author, committer and message. It uniquely identifies the commit, and usually the first 7–12 characters are enough to reference it.

</details>

**Q14. What are the three levels of Git configuration?**

<details>
<summary>Show answer</summary>

System (`--system`, `/etc/gitconfig`, all users), global (`--global`, `~/.gitconfig`, your user), and local (`--local`, `.git/config`, one repo). More specific levels override broader ones; there is also `--worktree` for per-worktree settings.

</details>

**Q15. How do you see where a Git setting comes from?**

<details>
<summary>Show answer</summary>

`git config --list --show-origin` lists every setting with the file it came from, and `git config --show-origin <key>` shows it for one key. `--show-scope` additionally shows system/global/local.

</details>

**Q16. Why must you set user.name and user.email?**

<details>
<summary>Show answer</summary>

Git writes them into every commit as author and committer. They are labels, not authentication, so anyone can set any value; that is why platforms match emails to accounts and why commit signing exists for proof of identity.

</details>

**Q17. How do you use different emails for work and personal repositories?**

<details>
<summary>Show answer</summary>

Use conditional includes in `~/.gitconfig`, e.g. `[includeIf "gitdir:~/work/"] path = ~/.gitconfig-work`, where the included file sets `user.email` to your work address. Git 2.36+ also supports `hasconfig:remote.*.url:` conditions based on the remote URL.

</details>

**Q18. What does `init.defaultBranch` control?**

<details>
<summary>Show answer</summary>

The name of the first branch created by `git init`. Setting it to `main` avoids the older default `master` and matches what GitHub and GitLab use for new repositories.

</details>

**Q19. What is `.gitignore`?**

<details>
<summary>Show answer</summary>

A file of patterns telling Git which untracked files to ignore, such as build output, dependencies, logs and local secrets. It does not affect files that are already tracked.

</details>

**Q20. If a file is already tracked, does adding it to `.gitignore` stop tracking it?**

<details>
<summary>Show answer</summary>

No. `.gitignore` only applies to untracked files. You must run `git rm --cached <file>` and commit to stop tracking it while keeping it on disk.

</details>

**Q21. What do `/`, `**` and `!` mean in `.gitignore`?**

<details>
<summary>Show answer</summary>

A leading `/` anchors the pattern to the directory containing the `.gitignore`; a trailing `/` matches only directories; `**` matches across any number of directories; a leading `!` re-includes a path excluded by an earlier pattern (but not if its parent directory is excluded).

</details>

**Q22. Where else can ignore rules live besides `.gitignore`?**

<details>
<summary>Show answer</summary>

`.git/info/exclude` for personal per-repo ignores that are not committed, and the file set by `core.excludesFile` (default `~/.config/git/ignore`) for global ignores like editor and OS files.

</details>

**Q23. How do you find out why a file is being ignored?**

<details>
<summary>Show answer</summary>

`git check-ignore -v <path>` prints the ignore file, line number and pattern that matched.

</details>

**Q24. What is `.gitattributes` used for?**

<details>
<summary>Show answer</summary>

It sets per-path attributes: line-ending normalization (`text`, `eol`), marking binaries, custom diff and merge drivers, Git LFS filters, `export-ignore` for `git archive`, and linguist hints for GitHub language stats. Because it is committed, the rules travel with the repo.

</details>

**Q25. How do you handle CRLF vs LF line endings across Windows and Linux?**

<details>
<summary>Show answer</summary>

Commit a `.gitattributes` with `* text=auto eol=lf` (plus exceptions like `*.bat text eol=crlf`) so normalization is enforced for everyone. `core.autocrlf` (`true` on Windows, `input` elsewhere) is the per-user alternative but `.gitattributes` takes precedence and is more reliable.

</details>

**Q26. What is the difference between HTTPS and SSH remotes?**

<details>
<summary>Show answer</summary>

HTTPS remotes authenticate with a username plus a personal access token (passwords are no longer accepted by major hosts) and work through most proxies. SSH remotes authenticate with a key pair and avoid token prompts. Both carry the same Git data.

</details>

**Q27. What is a credential helper?**

<details>
<summary>Show answer</summary>

A program Git calls to store and retrieve HTTPS credentials so you are not prompted each time: `cache` (memory, time-limited), `store` (plain-text file), OS keychains, or Git Credential Manager, which supports OAuth and MFA.

</details>

**Q28. How do you create and use an SSH key for Git?**

<details>
<summary>Show answer</summary>

Run `ssh-keygen -t ed25519 -C "you@example.com"`, add the public key (`~/.ssh/id_ed25519.pub`) to your GitHub/GitLab account, optionally load it into `ssh-agent`, and test with `ssh -T git@github.com`.

</details>

**Q29. What are Git aliases?**

<details>
<summary>Show answer</summary>

Shortcuts defined in config, e.g. `git config --global alias.lg "log --oneline --graph --all"`. Aliases starting with `!` run shell commands, such as `alias.root '!pwd'`.

</details>

**Q30. What is `git status` and what does the short format show?**

<details>
<summary>Show answer</summary>

It shows the current branch, ahead/behind counts against upstream, and staged, unstaged and untracked changes. In `git status -s`, the first column is the index and the second the working tree: `M ` staged, ` M` unstaged, `MM` both, `??` untracked, `A ` added.

</details>

**Q31. What is the difference between `git diff`, `git diff --staged` and `git diff HEAD`?**

<details>
<summary>Show answer</summary>

`git diff` shows working tree vs index (unstaged changes); `git diff --staged` (or `--cached`) shows index vs last commit (what will be committed); `git diff HEAD` shows working tree vs last commit (all uncommitted changes).

</details>

**Q32. What does `git add -p` do?**

<details>
<summary>Show answer</summary>

It walks through changes hunk by hunk and asks whether to stage each one (`y`, `n`, `s` to split, `e` to edit). It is the standard way to make focused commits and catch debug code or secrets before committing.

</details>

**Q33. What is the difference between `git add .`, `git add -A` and `git add -u`?**

<details>
<summary>Show answer</summary>

In modern Git, `git add .` stages new, modified and deleted files under the current directory; `git add -A` does the same for the whole working tree; `git add -u` stages modifications and deletions of tracked files only, ignoring new untracked files.

</details>

**Q34. What makes a good commit message?**

<details>
<summary>Show answer</summary>

A short imperative summary (around 50 characters, e.g. "Add retry to payment client"), a blank line, then a body wrapped at 72 characters explaining why the change was made and any side effects, plus references like ticket IDs. The diff already shows what changed.

</details>

**Q35. What are Conventional Commits?**

<details>
<summary>Show answer</summary>

A message convention `type(scope): description`, with types like `feat`, `fix`, `docs`, `refactor`, `chore`, `ci`, and `!` or a `BREAKING CHANGE:` footer for breaking changes. Tools use it to generate changelogs and decide semantic version bumps automatically.

</details>

**Q36. What is the difference between author and committer?**

<details>
<summary>Show answer</summary>

The author wrote the change; the committer last applied it. They differ after rebases, cherry-picks, `git am` of a patch, or when a platform squash-merges a PR, and both have their own timestamps.

</details>

**Q37. What does `git log --oneline --graph --decorate --all` show?**

<details>
<summary>Show answer</summary>

One line per commit across all refs, with an ASCII graph of branches and merges and ref names (branches, tags, HEAD) next to their commits. It is the fastest way to understand the state of a repository.

</details>

**Q38. How do you see the history of a single file, including renames?**

<details>
<summary>Show answer</summary>

`git log --follow -p -- path/to/file` shows each commit touching the file with diffs, following it across renames.

</details>

**Q39. Does Git track renames?**

<details>
<summary>Show answer</summary>

Not explicitly. Git stores snapshots and detects renames when comparing them, based on content similarity (default 50%). `git mv` is just a convenience for `mv` plus staging the delete and add.

</details>

**Q40. What does `git rm --cached` do?**

<details>
<summary>Show answer</summary>

It removes the file from the index so it becomes untracked in the next commit, but leaves it on disk. It is used to stop tracking files like `.env` after adding them to `.gitignore`.

</details>

**Q41. What is HEAD?**

<details>
<summary>Show answer</summary>

HEAD is a reference to what you currently have checked out. Normally it is symbolic and points to a branch (`ref: refs/heads/main`); in detached HEAD state it contains a commit hash directly.

</details>

**Q42. What is the difference between `git fetch` and `git pull`?**

<details>
<summary>Show answer</summary>

`fetch` downloads new objects and updates remote-tracking branches like `origin/main` without touching your local branches or files. `pull` runs a fetch and then integrates the upstream branch into your current branch with merge (default) or rebase.

</details>

**Q43. What is `origin`?**

<details>
<summary>Show answer</summary>

The default name Git gives the remote you cloned from. It is just a convention and can be renamed or removed; a fork setup typically has `origin` (your fork) and `upstream` (the original).

</details>

**Q44. What is a bare repository?**

<details>
<summary>Show answer</summary>

A repository with no working tree, containing only what is normally inside `.git`. Servers host bare repos because nobody edits files there; create one with `git init --bare` or `git clone --bare`.

</details>

**Q45. What does `git show` display?**

<details>
<summary>Show answer</summary>

For a commit, its metadata, message and diff; for a tag, the tag details and target; for a blob or `commit:path`, the file content. `git show HEAD~2:src/app.js` prints a file as it was two commits ago.

</details>

**Q46. What is the purpose of `git help` and `--help`?**

<details>
<summary>Show answer</summary>

`git help <command>` or `git <command> --help` opens the full manual page; `git <command> -h` prints a short usage summary. `git help -g` lists concept guides like `gitworkflows` and `gitrevisions`.

</details>

**Q47. What are porcelain and plumbing commands?**

<details>
<summary>Show answer</summary>

Porcelain commands (`commit`, `merge`, `switch`) are the user-friendly interface. Plumbing commands (`cat-file`, `hash-object`, `update-ref`, `rev-parse`) are low-level building blocks with stable output intended for scripts.

</details>

**Q48. Why were `git switch` and `git restore` introduced?**

<details>
<summary>Show answer</summary>

Git 2.23 split the overloaded `git checkout` into `switch` (change branches) and `restore` (restore files), making intent clearer and reducing accidental data loss. `checkout` still works for backward compatibility.

</details>

**Q49. Is Git only for source code?**

<details>
<summary>Show answer</summary>

No. Git can version any files: docs, configs, infrastructure as code, notebooks. It works best with text, though; large or frequently changing binaries should use Git LFS or another artifact store.

</details>

**Q50. What is the minimum Git setup you would do on a new laptop?**

<details>
<summary>Show answer</summary>

Set `user.name`, `user.email`, `init.defaultBranch main`, an editor, `pull.rebase` per team standard, `fetch.prune true`, `push.autoSetupRemote true`, `rerere.enabled true`, and configure SSH keys or a credential manager, ideally from a dotfiles repo.

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
