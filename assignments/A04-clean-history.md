<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A04 · Clean History Before PR

**Level:** Intermediate · **Estimated time:** 1.5 hours · **Related:** [Module 08](../modules/README.md)

## Objective

Take a deliberately messy 15-commit branch and turn it into a 3–4 commit series a reviewer would love.

## Requirements

1. Start a feature with 15 realistic messy commits (wip, typo, review fixes, debug, revert of a revert).
2. Use interactive rebase: reword, squash, fixup, drop, reorder, and split at least one commit with `edit`.
3. Use `commit --fixup` + `--autosquash` for at least two fixes.
4. Run `git rebase -i --exec '<test command>' main` so every final commit passes tests.
5. Use `git range-diff` to show the before/after.

## Deliverables

- Branch `messy` (original) and `clean` (final) pushed
- HISTORY.md with the range-diff output and your reasoning

## Grading rubric

| Criterion | Points |
|---|---|
| Final series quality | 40 |
| Techniques used | 30 |
| Every commit passes tests | 20 |
| range-diff explanation | 10 |
| **Total** | **100** |

## Stretch goal

Do the same on a stacked branch setup with `--update-refs`.

## Submission tip

Put everything in a public repository named `git-mastery-a04-clean-history` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
