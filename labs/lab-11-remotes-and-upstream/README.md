<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 11 · Remotes and Upstream

**Level:** Intermediate · **Time:** 30 minutes · **Module:** [09 · Remotes](../../modules/09-remotes.md)

## Scenario

The playground simulates a real team. `server.git` is a bare repository acting as GitHub. `you/` is your clone. While you were working, a teammate pushed a healthcheck to `main`, and someone deleted the remote branch `old-feature`. You have one local commit (`you: add metrics`) that isn't pushed yet.

## Setup

```bash
bash setup.sh
cd playground/you
git log --oneline --all
git branch -a          # origin/old-feature still shows: your view is stale
```

## Tasks

1. Try `git push origin main`. Read the rejection message carefully. Why was it rejected?
2. `git fetch --prune` and compare: `git log --oneline main..origin/main` and `git log --oneline origin/main..main`.
3. Integrate the teammate's work **without a merge commit**, then push.
4. Create a branch `feature/upstream-demo` with one commit, and push it so that it tracks `origin/feature/upstream-demo`.
5. Confirm `origin/old-feature` is gone from `git branch -a`, and inspect tracking with `git branch -vv`.

## Verify

```bash
bash ../../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `git pull --rebase` replays your commit on top of the teammate's.
- `git push -u origin <branch>` sets upstream on first push.
- `git config fetch.prune true` makes pruning automatic.

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
