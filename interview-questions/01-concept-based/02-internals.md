<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Git Internals

Questions 51–100 of the concept-based questions bank. Try answering each one out loud before opening the answer.

---

**Q51. What does "content-addressable storage" mean in Git?**

<details>
<summary>Show answer</summary>

Every object is stored under a key that is the hash of its content. Identical content always gets the same key, so it's stored once, and any change in content produces a completely different key, which makes corruption and tampering detectable.

</details>

**Q52. What are the four Git object types?**

<details>
<summary>Show answer</summary>

Blob (file content), tree (directory listing of names, modes and object hashes), commit (snapshot pointer plus parents, author, committer and message), and annotated tag (a named, signed or annotated pointer to another object, usually a commit).

</details>

**Q53. What does a blob store, and what doesn't it store?**

<details>
<summary>Show answer</summary>

A blob stores only the raw bytes of a file. It does not store the filename, path, permissions or timestamps; those live in the tree that references it.

</details>

**Q54. What does a tree object contain?**

<details>
<summary>Show answer</summary>

A list of entries, each with a mode (e.g. 100644 file, 100755 executable, 040000 directory, 120000 symlink, 160000 submodule gitlink), an object type, a hash and a name.

</details>

**Q55. What fields are inside a commit object?**

<details>
<summary>Show answer</summary>

`tree <hash>`, zero or more `parent <hash>` lines, `author` and `committer` lines with name, email, Unix timestamp and timezone, optional `gpgsig` and other headers, a blank line, and the message.

</details>

**Q56. What is the difference between a lightweight tag and an annotated tag internally?**

<details>
<summary>Show answer</summary>

A lightweight tag is just a ref in `refs/tags/` pointing directly at a commit. An annotated tag is a separate tag object (with tagger, date, message, optional signature) and the ref points at that tag object.

</details>

**Q57. How does Git compute an object's hash?**

<details>
<summary>Show answer</summary>

It hashes a header `<type> <size>\0` followed by the content. For example, a blob's ID is SHA-1 of `blob <bytes>\0<content>`, which is why `git hash-object` gives the same result on any machine.

</details>

**Q58. Where are objects stored on disk?**

<details>
<summary>Show answer</summary>

Loose objects are zlib-compressed files at `.git/objects/xx/yyyy...` where `xx` is the first two hex characters of the hash. Packed objects live in `.git/objects/pack/*.pack` with `.idx` index files.

</details>

**Q59. What is a packfile?**

<details>
<summary>Show answer</summary>

A single file containing many objects, where similar objects are stored as deltas against each other, plus an index for fast lookup. Packfiles keep repositories small and are what Git transfers over the network.

</details>

**Q60. When does Git create packfiles?**

<details>
<summary>Show answer</summary>

During `git gc` (including automatic `gc --auto` when there are too many loose objects), `git repack`, background `git maintenance`, and when receiving objects in a fetch or clone.

</details>

**Q61. What is a ref?**

<details>
<summary>Show answer</summary>

A human-readable name that points to an object ID, stored as a file under `.git/refs/` (or in `packed-refs`). Branches (`refs/heads/`), tags (`refs/tags/`), remote-tracking branches (`refs/remotes/`) and `refs/stash` are all refs.

</details>

**Q62. What is `packed-refs`?**

<details>
<summary>Show answer</summary>

A single file that stores many refs at once for performance, created by `git pack-refs` or `gc`. When a loose ref file exists with the same name, it takes precedence over the packed entry.

</details>

**Q63. Physically, what is a Git branch?**

<details>
<summary>Show answer</summary>

A file (or `packed-refs` entry) containing the 40-character hash of a commit. Creating a branch writes one small file, which is why branching in Git is instant regardless of repository size.

</details>

**Q64. What is a symbolic ref?**

<details>
<summary>Show answer</summary>

A ref that points to another ref instead of an object. HEAD is the main example (`ref: refs/heads/main`); `git symbolic-ref HEAD` reads it.

</details>

**Q65. What is detached HEAD internally?**

<details>
<summary>Show answer</summary>

`.git/HEAD` contains a commit hash instead of `ref: refs/heads/...`. New commits move HEAD only, so they're not referenced by any branch.

</details>

**Q66. What is the index file physically?**

<details>
<summary>Show answer</summary>

A binary file at `.git/index` listing every tracked path with its mode, blob hash, stage number and cached filesystem stat data (size, mtime, inode). The stat data lets `git status` skip rehashing unchanged files.

</details>

**Q67. What are index stage numbers?**

<details>
<summary>Show answer</summary>

Stage 0 is the normal entry. During a merge conflict a path can have stage 1 (common ancestor), stage 2 (ours) and stage 3 (theirs). `git ls-files -u` shows unmerged entries.

</details>

**Q68. What does `git cat-file` do?**

<details>
<summary>Show answer</summary>

It inspects objects: `-t` prints the type, `-s` the size, `-p` pretty-prints the content, and `-e` checks existence. `--batch` modes are used by scripts to read many objects efficiently.

</details>

**Q69. What does `git hash-object -w` do?**

<details>
<summary>Show answer</summary>

It computes the object ID for a file or stdin and, with `-w`, writes it as a blob into the object database.

</details>

**Q70. What do `write-tree` and `commit-tree` do?**

<details>
<summary>Show answer</summary>

`git write-tree` writes the current index as a tree object and prints its hash. `git commit-tree <tree> [-p parent] -m msg` creates a commit object for that tree and prints its hash without moving any branch.

</details>

**Q71. What does `git update-ref` do?**

<details>
<summary>Show answer</summary>

It safely updates a ref to a new value (optionally checking the old value) and records the change in the reflog. Scripts should use it instead of writing ref files directly.

</details>

**Q72. What does `git rev-parse` do?**

<details>
<summary>Show answer</summary>

It resolves any revision expression to an object ID (`git rev-parse HEAD~2`) and answers repository questions like `--show-toplevel`, `--abbrev-ref HEAD`, `--git-dir` and `--is-inside-work-tree`.

</details>

**Q73. What does `HEAD~3` mean?**

<details>
<summary>Show answer</summary>

The commit three generations back following first parents only: HEAD's parent's parent's parent.

</details>

**Q74. What is the difference between `HEAD~2` and `HEAD^2`?**

<details>
<summary>Show answer</summary>

`HEAD~2` is the grandparent via first parents. `HEAD^2` is the second parent of HEAD, which only exists if HEAD is a merge commit (the tip of the branch that was merged in).

</details>

**Q75. What does `A..B` mean in revision ranges?**

<details>
<summary>Show answer</summary>

Commits reachable from B but not from A, for example "commits on feature not yet on main" with `main..feature`.

</details>

**Q76. What does `A...B` mean?**

<details>
<summary>Show answer</summary>

The symmetric difference: commits reachable from either A or B but not both. With `git log --left-right A...B`, each commit is marked as belonging to the left or right side. In `git diff A...B` it means "changes on B since the merge base".

</details>

**Q77. What is the reflog?**

<details>
<summary>Show answer</summary>

A local log of every position a ref (and HEAD) has pointed to, with timestamps and reasons (commit, reset, rebase, checkout). It's the main tool to recover from bad resets, rebases or deleted branches.

</details>

**Q78. How long are reflog entries kept?**

<details>
<summary>Show answer</summary>

By default 90 days for entries still reachable from the ref (`gc.reflogExpire`) and 30 days for unreachable ones (`gc.reflogExpireUnreachable`). Reflogs are local and never pushed.

</details>

**Q79. What does `ORIG_HEAD` contain?**

<details>
<summary>Show answer</summary>

The previous value of HEAD saved by dangerous operations like `reset`, `merge` and `rebase`, so `git reset --hard ORIG_HEAD` undoes the last such operation.

</details>

**Q80. What other special refs does Git create during operations?**

<details>
<summary>Show answer</summary>

`MERGE_HEAD` (commit being merged), `CHERRY_PICK_HEAD`, `REVERT_HEAD`, `REBASE_HEAD`, `FETCH_HEAD` (last fetched tips), and `AUTO_MERGE` in recent versions.

</details>

**Q81. When is an object "reachable"?**

<details>
<summary>Show answer</summary>

When it can be reached by following commit parents and tree entries from any ref, HEAD, the reflog, the index or a stash. Unreachable objects are candidates for garbage collection.

</details>

**Q82. What does `git gc` do?**

<details>
<summary>Show answer</summary>

It packs loose objects into packfiles, packs refs, expires old reflog entries, removes unreachable objects older than the prune grace period (`gc.pruneExpire`, default two weeks), and writes the commit-graph.

</details>

**Q83. What is a dangling object?**

<details>
<summary>Show answer</summary>

An object not referenced by anything: for example a commit from a dropped stash or an abandoned rebase. `git fsck --lost-found` lists them, and they're recoverable until pruned.

</details>

**Q84. What does `git fsck` check?**

<details>
<summary>Show answer</summary>

The connectivity and validity of the object database: corrupt or missing objects, broken links between commits, trees and blobs, and dangling or unreachable objects.

</details>

**Q85. Why is Git history tamper-evident?**

<details>
<summary>Show answer</summary>

Each commit's hash covers its tree and its parent hashes, so changing any file or any earlier commit changes every later hash. A signed tag or commit at the tip therefore vouches for the whole history behind it.

</details>

**Q86. Why does rewriting history create new commits instead of editing old ones?**

<details>
<summary>Show answer</summary>

Objects are immutable and named by their content hash. Changing anything (message, parent, content) produces a different hash, so Git writes a new commit and moves the ref; the old commit remains until garbage-collected.

</details>

**Q87. What is the commit-graph file?**

<details>
<summary>Show answer</summary>

A precomputed file (`.git/objects/info/commit-graph`) storing commit parents, generation numbers and root tree IDs. It makes graph operations like `log --graph`, merge-base and reachability checks much faster on large repos.

</details>

**Q88. What is the SHA-1 collision concern, and how has Git responded?**

<details>
<summary>Show answer</summary>

SHA-1 collisions became practical in 2017 (SHAttered). Git uses a hardened SHA-1 that detects known collision attacks, and supports SHA-256 repositories (`git init --object-format=sha256`), though hosting support for SHA-256 is still limited.

</details>

**Q89. What is a gitlink?**

<details>
<summary>Show answer</summary>

A tree entry with mode 160000 that records a commit hash of another repository. It's how submodules are stored: the parent repo pins a commit but doesn't contain the submodule's objects.

</details>

**Q90. What is `.git/config` versus `.git/description` and `.git/info`?**

<details>
<summary>Show answer</summary>

`config` holds repository settings (remotes, branches, local options). `description` is only used by GitWeb. `info/exclude` holds local ignore rules, and `info/` can also contain the sparse-checkout file and other metadata.

</details>

**Q91. Why is `git status` fast even on large repositories?**

<details>
<summary>Show answer</summary>

It compares cached stat data in the index with the filesystem, only rehashing files whose metadata changed. Features like untracked cache and FSMonitor make it faster still by avoiding full directory scans.

</details>

**Q92. What is a tree-ish and a commit-ish?**

<details>
<summary>Show answer</summary>

A commit-ish is anything that resolves to a commit (a commit, a branch, an annotated tag). A tree-ish is anything that resolves to a tree (a commit-ish or a tree itself). Commands document which they accept.

</details>

**Q93. What does `^{tree}` or `^{commit}` mean after a revision?**

<details>
<summary>Show answer</summary>

Peeling syntax: `v1.0^{commit}` follows a tag to its commit, and `HEAD^{tree}` gives the tree of HEAD's commit.

</details>

**Q94. What is a merge base, and how do you find it?**

<details>
<summary>Show answer</summary>

The best common ancestor of two commits, used as the base for three-way merges. `git merge-base A B` prints it; `--all` shows all candidates when criss-cross merges create several.

</details>

**Q95. What is the difference between the author date and commit date?**

<details>
<summary>Show answer</summary>

The author date is when the change was originally written; the commit date is when the commit object was created. Rebases and amends update the commit date but keep the author date unless you use `--reset-author` or `--committer-date-is-author-date`.

</details>

**Q96. Why can you recover from `git reset --hard` but not always from `git clean -f`?**

<details>
<summary>Show answer</summary>

A reset moves refs while committed objects remain in the object database and reflog. `git clean` deletes untracked files that were never stored in Git, so there's nothing in the repository to recover.

</details>

**Q97. How does Git know a file is binary?**

<details>
<summary>Show answer</summary>

By default, it checks the first few kilobytes for NUL bytes. You can override this with `.gitattributes` (`*.dat binary`, or `-diff`/`-merge`), which affects diff output, merging and line-ending conversion.

</details>

**Q98. What is a delta chain?**

<details>
<summary>Show answer</summary>

Inside a packfile, an object can be stored as a delta against another object, which may itself be a delta. Long chains save space but slow reads; `pack.depth` and `pack.window` control the trade-off.

</details>

**Q99. What happens internally when you run `git commit`?**

<details>
<summary>Show answer</summary>

Git writes the index as tree objects, creates a commit object with that tree, the current HEAD commit as parent, author/committer and message, then updates the branch HEAD points to and appends a reflog entry. Hooks run around these steps.

</details>

**Q100. What happens internally when you run `git switch other-branch`?**

<details>
<summary>Show answer</summary>

Git reads the target branch's commit and tree, updates the index and working tree to match (refusing if uncommitted changes would be overwritten), then updates HEAD to `ref: refs/heads/other-branch` and logs the move in the reflog.

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
