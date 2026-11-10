<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A07 · Release and Hotfix Drill

**Level:** Intermediate · **Estimated time:** 2 hours · **Related:** [Module 12](../modules/README.md)

## Objective

Run a full release cycle with semantic versioning, automated changelog and a hotfix backport.

## Requirements

1. Use Conventional Commits for 10+ commits across features and fixes.
2. Automate versioning with semantic-release or release-please in CI (or a script you write).
3. Cut v1.0.0 and v1.1.0 releases with annotated tags and platform releases.
4. Ship hotfix v1.0.1 on a `release/1.0` branch via cherry-pick `-x` from main.

## Deliverables

- Repo link with tags and releases
- RELEASES.md describing each step

## Grading rubric

| Criterion | Points |
|---|---|
| Correct SemVer bumps | 30 |
| Automation works | 30 |
| Hotfix backport correct | 25 |
| Docs | 15 |
| **Total** | **100** |

## Stretch goal

Sign your release tags and verify them in the CI release job.

## Submission tip

Put everything in a public repository named `git-mastery-a07-release-and-hotfix` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
