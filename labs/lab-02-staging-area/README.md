<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 02 · Mastering the Staging Area

**Level:** Beginner · **Time:** 20 minutes · **Module:** [03 · The Core Workflow](../../modules/03-core-workflow.md)

## Scenario

You fixed a real bug in `payment.py` (the timeout was too low). While debugging, you also added a `print("DEBUG ...")` line further down the same file. You also have a `scratch.txt` file with personal notes. Only the bug fix should be committed.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Run `git status` and `git diff`. Identify the two separate changes inside `payment.py`.
2. Use `git add -p payment.py` to stage **only** the timeout change. Answer `y` for the timeout hunk and `n` for the debug hunk. (If both changes appear in one hunk, press `s` to split it.)
3. Confirm with `git diff --staged` that only the timeout change is staged, and with `git diff` that the debug line is still unstaged.
4. Commit with a message that explains the fix.
5. Leave the debug line and `scratch.txt` uncommitted.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- In `git add -p`, `?` shows all the options.
- `git restore --staged payment.py` unstages everything if you make a mistake.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Why this matters

`git add -p` is how professionals keep commits focused, and it's how they catch debug prints and secrets before they reach history. Interviewers love asking "how do you commit only part of a file?"


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
