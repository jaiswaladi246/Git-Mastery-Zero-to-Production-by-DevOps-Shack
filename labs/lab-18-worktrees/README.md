<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 18 · Worktrees

**Level:** Intermediate · **Time:** 20 minutes · **Module:** [13 · Stash, Cherry-pick & Worktrees](../../modules/13-stash-cherry-pick-worktrees.md)

## Scenario

You're deep in a big feature with uncommitted changes in `feature.py`. An urgent `2.0.1` patch is needed on `hotfix/2.0.1`. This time, don't stash. Use a second working directory.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Add a worktree at `../playground-hotfix` for the existing branch `hotfix/2.0.1`.
2. In that folder, change `VERSION` in `api.py` to `2.0.1` and commit.
3. Back in `playground`, confirm your uncommitted `feature.py` work was never touched.
4. List worktrees, then remove the hotfix worktree.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Where this shines

Long test runs on one branch while you code on another, reviewing PRs side by side, and running parallel AI coding agents, each in its own worktree.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
