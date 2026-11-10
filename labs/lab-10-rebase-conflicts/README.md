<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 10 · Rebase Conflicts

**Level:** Intermediate–Advanced · **Time:** 35 minutes · **Module:** [08 · Rebasing](../../modules/08-rebasing.md)

## Scenario

The ops team changed `port` and `log` on `main` for production. Your three-commit branch also touched those lines. When you rebase, Git replays your commits one at a time, so you may hit conflicts **more than once**.

The agreed result:

- `port=9090` and `log=warn`: ops decisions win.
- `retries=3` and `timeout=30`: your additions must survive.

## Setup

```bash
bash setup.sh && cd playground
git switch feature/resilience
```

## Tasks

1. Rebase `feature/resilience` onto `main`.
2. Resolve each conflict as agreed, then `git add` and `git rebase --continue`.
3. One of your commits (`chore: debug logging`) only changed the log level, which ops overrides. After resolving, that commit has nothing left. Use `git rebase --skip` for it.
4. Confirm the final `app.conf` and a linear history.

## Remember: ours and theirs flip during a rebase

During a rebase, `--ours` is the branch you're rebasing **onto** (main) and `--theirs` is **your** commit being replayed. That's the opposite of a merge. Read the file rather than trusting the labels.

## Verify

```bash
bash ../verify.sh
```

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
