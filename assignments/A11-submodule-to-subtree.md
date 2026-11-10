<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A11 · Submodule to Subtree Migration

**Level:** Advanced · **Estimated time:** 1.5 hours · **Related:** [Module 16](../modules/README.md)

## Objective

Replace a troublesome submodule with a subtree (or a package) and document the trade-offs.

## Requirements

1. Start with a repo that uses a submodule.
2. Remove the submodule cleanly (deinit, rm, .git/modules).
3. Add the same code with `git subtree add --squash` and update it once with `subtree pull`.
4. Write a decision record comparing submodule, subtree and versioned package for your case.

## Deliverables

- Repo link
- ADR.md (architecture decision record)

## Grading rubric

| Criterion | Points |
|---|---|
| Clean removal | 25 |
| Subtree working | 25 |
| ADR reasoning | 50 |
| **Total** | **100** |

## Stretch goal

Push a change back upstream with `git subtree push`.

## Submission tip

Put everything in a public repository named `git-mastery-a11-submodule-to-subtree` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
