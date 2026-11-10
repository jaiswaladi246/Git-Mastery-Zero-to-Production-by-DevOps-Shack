<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 17 · Cherry-pick and Backports

**Level:** Intermediate · **Time:** 25 minutes · **Module:** [13 · Stash, Cherry-pick & Worktrees](../../modules/13-stash-cherry-pick-worktrees.md)

## Scenario

Two common situations in one lab:

1. A bug fix (`fix: prevent negative cart totals`) landed on `main`. Customers still run **v1.4**, which lives on `release/1.4`. Backport only that fix, not the new dashboard features.
2. The latest commit on `main` (`feat: monthly reports`) should have gone on its own feature branch. Move it there. (`main` hasn't been pushed in this scenario.)

## Setup

```bash
bash setup.sh && cd playground
git log --oneline --graph --all
```

## Tasks

1. Cherry-pick the fix onto `release/1.4` using `-x`, so the commit message records where it came from.
2. Tag the result as annotated `v1.4.1`.
3. Create `feature/reports` containing the misplaced commit, and remove that commit from `main`.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `git log --oneline main` to find the fix's hash.
- To move the last commit: create the branch at the current commit, then `git reset --hard HEAD~1` on main.
- If main *had* been pushed, you'd `git revert` the commit on main instead.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
