<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 05 · Undo Everything

**Level:** Beginner–Intermediate · **Time:** 30 minutes · **Module:** [05 · Undoing Changes](../../modules/05-undoing-changes.md)

## Scenario

Your repository is in a messy state with four different problems. Each needs a *different* undo tool. Choosing the right tool is the whole point.

## Setup

```bash
bash setup.sh && cd playground
git status
git log --oneline
```

## Tasks

1. **`a.txt`** has an accidental edit. Throw it away.
2. **`b.txt`** has a good edit, but you staged it too early. Unstage it and keep the edit.
3. The last commit message is `fix tpyo`. Change it to exactly `docs: fix typo in README`. Make sure `b.txt` doesn't sneak into that commit.
4. `feat: add broken feature` is already on the shared `main` that everyone has pulled. Undo it **without rewriting history**.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- 1 → `git restore`. 2 → `git restore --staged`. 3 → `git commit --amend`. 4 → `git revert`.
- Do task 2 before task 3, otherwise amend would include the staged `b.txt`.
- Why not `reset` for task 4? Because the commit is shared. Reset rewrites history that teammates already have.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Bonus

Run `git reflog` and find the original "fix tpyo" commit. Amend didn't edit it. It created a new commit, and the old one is still recoverable.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
