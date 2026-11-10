<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 09 · Interactive Rebase

**Level:** Intermediate · **Time:** 40 minutes · **Module:** [08 · Rebasing](../../modules/08-rebasing.md)

## Scenario

Your feature branch has six commits, and it shows how the work really happened:

```
add invoice model
wip                        ← junk notes file
fix tpyo                   ← belongs in "add invoice model"
add export endpoint
address review comments    ← belongs in "add export endpoint"
debug stuff                ← must never reach main
```

Before opening the PR, turn it into two clean commits that tell a clear story.

## Setup

```bash
bash setup.sh && cd playground
git switch feature/invoices
git log --oneline main..
```

## Tasks

Use `git rebase -i main` so that `feature/invoices` ends up with **exactly two commits** on top of `main`:

1. `feat: add invoice model`, containing only `invoice.py` with the typo fix folded in.
2. `feat: add invoice export endpoint`, containing `export.py` with both functions.

The `wip` and `debug stuff` commits must disappear completely.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- In the todo list: `reword` the two real commits, `fixup` the typo fix and review comments, `drop` wip and debug.
- `fixup` melds a commit into the one **above** it in the list.
- Lost? `git rebase --abort`. Already finished but wrong? `git reset --hard ORIG_HEAD`, or find the old tip in `git reflog`.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh). It scripts the editor with `GIT_SEQUENCE_EDITOR` so it runs unattended, which is also a handy trick for automation.

</details>

## Pro workflow

Next time, commit review fixes with `git commit --fixup=<sha>`, then run `git rebase -i --autosquash main`. Git lines up the fixups for you.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
