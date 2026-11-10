<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 04 · Exploring Git Objects

**Level:** Intermediate · **Time:** 40 minutes · **Module:** [04 · Git Internals](../../modules/04-git-internals.md)

## What you'll practise

Reading blobs, trees and commits with plumbing commands, and building a commit with no porcelain at all.

## Setup

```bash
bash setup.sh && cd playground
git log --oneline --graph --all
```

## Part A · Investigate

Create `answers.txt` in the playground with one answer per line in exactly this format:

```
Q1: <full hash of the tree that main's latest commit points to>
Q2: <full hash of the blob for README.md on main>
Q3: <number of parents of main's latest commit>
Q4: <object type of main:src  (blob, tree, commit or tag)>
```

Commands you'll want: `git cat-file -p`, `git cat-file -t`, `git rev-parse`, `git ls-tree`.

## Part B · Build a commit by hand

Using **only plumbing** (`hash-object`, `update-index`, `write-tree`, `commit-tree`, `update-ref`), create a branch called `handmade` that points to a root commit (no parent) containing a single file `hello.txt` whose content is exactly:

```
Built by hand at DevOps Shack
```

Don't disturb `main`'s files while doing this. Tip: use a separate index file with `GIT_INDEX_FILE=.git/handmade-index`.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `main^{tree}` resolves to the tree of main's commit. `main:README.md` resolves to a blob.
- `echo "text" | git hash-object -w --stdin` writes a blob and prints its hash.
- `git commit-tree <tree>` without `-p` creates a root commit.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Reflect

Run `cat .git/refs/heads/handmade`. A branch really is just a file with a hash in it.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
