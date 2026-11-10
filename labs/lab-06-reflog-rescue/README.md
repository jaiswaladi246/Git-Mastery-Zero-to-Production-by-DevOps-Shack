<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 06 · Reflog Rescue

**Level:** Intermediate · **Time:** 25 minutes · **Module:** [05 · Undoing Changes](../../modules/05-undoing-changes.md)

## Scenario

It's Friday evening. A teammate ran two commands on their laptop:

```bash
git branch -D feature/invoices   # force-deleted an unmerged branch
git reset --hard HEAD~2          # threw away the last two commits on main
```

Nothing was pushed. They think three days of work are gone. You're going to prove otherwise.

## Setup

```bash
bash setup.sh && cd playground
git log --oneline --all     # the work looks gone
```

## Tasks

1. Use `git reflog` to find where `main` was before the reset, and restore `main` to that commit.
2. Find the last commit of the deleted `feature/invoices` branch (its message is `feat: invoice pdf`) and recreate the branch there.
3. Confirm with `git log --oneline --graph --all`.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `git reflog` lists every position HEAD has been at, newest first. The reset is `HEAD@{0}`, and the entry before it is where you want to go.
- `git log -g --oneline` is a reflog view that shows commit messages.
- `git branch <name> <sha>` creates a branch at any commit.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Remember

Reflog entries last 90 days, and they're local to your machine. If the work was never on your machine, your reflog can't help. Check the teammate's machine or the remote.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
