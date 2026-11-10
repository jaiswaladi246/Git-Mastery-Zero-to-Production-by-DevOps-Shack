<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 16 · Stash Scenarios

**Level:** Intermediate · **Time:** 30 minutes · **Module:** [13 · Stash, Cherry-pick & Worktrees](../../modules/13-stash-cherry-pick-worktrees.md)

## Scenario

You're halfway through a "filters" feature: `app.js` is modified and `notes.md` is a new untracked file. A production bug comes in: the header says "Dashbord." Fix it on a hotfix branch without committing half-done work.

Separately, yesterday you dropped a stash called `WIP: experiment cache layer` by mistake. Get it back.

## Setup

```bash
bash setup.sh && cd playground
git status
git stash list    # empty: the experiment stash was dropped
```

## Tasks

1. Stash **all** in-progress work, including the untracked `notes.md`, with a descriptive message.
2. Create `hotfix/header` from `main`, fix the typo, and commit.
3. Switch back to `main` and restore your WIP. The stash list should end up empty.
4. Recover the dropped stash into a branch called `recovered-experiment`.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `git stash push -u -m "..."` includes untracked files.
- A stash is a commit. Dropped stashes become *dangling commits*: `git fsck --no-reflogs | grep "dangling commit"`.
- `git log -1 --format=%s <sha>` shows each dangling commit's message, so you can find the right one.

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
