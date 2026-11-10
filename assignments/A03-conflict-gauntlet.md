<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A03 · Conflict Gauntlet

**Level:** Intermediate · **Estimated time:** 2 hours · **Related:** [Module 07](../modules/README.md)

## Objective

Create and resolve every major type of merge conflict, and document the reasoning behind each resolution.

## Requirements

1. In one practice repo, deliberately create: content conflict, modify/delete, add/add, rename/rename, binary conflict, and a lock-file conflict.
2. Resolve each one using a different technique (manual edit, `--ours`/`--theirs`, `git rm`, `mergetool`, regenerate lock file).
3. Use `merge.conflictstyle zdiff3` and show one screenshot or snippet of the ancestor section.
4. Create one **semantic** conflict that merges cleanly but breaks a test, and explain how CI would catch it.

## Deliverables

- Repo link
- CONFLICTS.md: for each conflict, how it was created, the markers, the resolution and why

## Grading rubric

| Criterion | Points |
|---|---|
| All 6 conflict types | 36 |
| Correct resolutions | 24 |
| Semantic conflict demo | 20 |
| Write-up clarity | 20 |
| **Total** | **100** |

## Stretch goal

Enable rerere and show it auto-resolving a repeated conflict.

## Submission tip

Put everything in a public repository named `git-mastery-a03-conflict-gauntlet` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
