<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A02 · Build a Commit by Hand

**Level:** Intermediate · **Estimated time:** 1.5 hours · **Related:** [Module 04](../modules/README.md)

## Objective

Prove you understand Git's object model by creating a three-commit history using only plumbing commands.

## Requirements

1. Create a repo with `git init`. Don't use `git add` or `git commit` at all.
2. Commit 1: one file. Commit 2: add a folder with two files. Commit 3: modify one file.
3. Use `hash-object -w`, `update-index` (or `mktree`), `write-tree`, `commit-tree -p`, and `update-ref`.
4. Write `internals.md` explaining each object you created (type, hash, what points to what), with a Mermaid diagram.

## Deliverables

- Shell script `build.sh` that recreates the history from scratch
- internals.md with diagram

## Grading rubric

| Criterion | Points |
|---|---|
| Script works from scratch | 40 |
| Correct parent chain | 20 |
| Explanation accuracy | 30 |
| Diagram | 10 |
| **Total** | **100** |

## Stretch goal

Show that two identical files in different folders share one blob, and prove it with `git cat-file`.

## Submission tip

Put everything in a public repository named `git-mastery-a02-build-a-commit-by-hand` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
