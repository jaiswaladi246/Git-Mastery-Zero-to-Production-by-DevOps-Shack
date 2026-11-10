<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A10 · Secret Purge Incident

**Level:** Advanced · **Estimated time:** 2 hours · **Related:** [Module 15](../modules/README.md) · [Module 19](../modules/README.md)

## Objective

Handle a leaked-secret incident end to end, including prevention.

## Requirements

1. Plant a fake AWS key in 3 commits across 2 branches and one tag.
2. Write the incident response runbook (rotate, assess, purge, force-push, re-clone, platform cache).
3. Purge with filter-repo `--replace-text`; prove no trace with `git log -p --all` and `git grep $(git rev-list --all)`.
4. Add gitleaks to pre-commit and to CI, and enable platform push protection if available.

## Deliverables

- RUNBOOK.md
- Proof outputs
- Working pre-commit + CI config

## Grading rubric

| Criterion | Points |
|---|---|
| Complete purge (branches + tags) | 35 |
| Runbook quality | 30 |
| Prevention controls | 35 |
| **Total** | **100** |

## Stretch goal

Repeat with BFG and compare speed and safety.

## Submission tip

Put everything in a public repository named `git-mastery-a10-secret-purge` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
