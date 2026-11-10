<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 01 · Your First Repository

**Level:** Beginner · **Time:** 20 minutes · **Module:** [03 · The Core Workflow](../../modules/03-core-workflow.md)

## What you'll practise

Creating a repository, staging files, writing good commit messages, ignoring files, and reading history.

## Setup

```bash
cd labs/lab-01-first-repository
bash setup.sh
cd playground
```

The playground starts as an empty folder.

## Tasks

1. Turn the `playground` folder into a Git repository whose default branch is `main`.
2. Create `README.md` with a title, stage it, and commit it with a meaningful message (more than 10 characters, no "update" or "changes").
3. Create `src/app.sh` containing a one-line script that prints a greeting. Commit it separately.
4. Create a `.gitignore` that ignores every `*.log` file. Prove it works: create `run.log`, run `git status`, and confirm the log file doesn't show up. Commit the `.gitignore`.
5. Run `git log --oneline` and `git log --stat`. Look at how each commit records what changed.
6. Finish with a clean working tree (`git status` shows nothing to commit).

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `git init -b main` creates the repo with `main` as its default branch.
- `git status` after every step tells you what's staged and what isn't.
- Untracked log files are fine. They're ignored, so they don't make the tree "dirty."

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh). Run `bash solution.sh && bash verify.sh` to see a passing run.

</details>

## Interview connection

"What are the three areas in Git?" and "What does `.gitignore` do to a file that's already tracked?" Both come straight from this lab. See the [concept bank](../../interview-questions/01-concept-based/01-fundamentals.md).


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
