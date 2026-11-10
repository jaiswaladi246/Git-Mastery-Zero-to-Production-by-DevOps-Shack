<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A14 · Git in CI

**Level:** Intermediate · **Estimated time:** 2 hours · **Related:** [Module 18](../modules/README.md)

## Objective

Build a CI pipeline that uses Git metadata correctly.

## Requirements

1. Trigger different jobs on push, PR, main and tags.
2. Tag Docker images with the short SHA and `git describe` version, and add OCI revision labels.
3. Generate a changelog in CI (needs full history and tags: handle shallow clones).
4. Path-filter a job so it only runs when its folder changes.

## Deliverables

- Pipeline file(s)
- CI.md explaining each Git-related decision

## Grading rubric

| Criterion | Points |
|---|---|
| Correct triggers | 25 |
| Versioning/labels | 25 |
| Shallow clone handling | 25 |
| Path filters | 25 |
| **Total** | **100** |

## Stretch goal

Make a bot commit back a version bump without triggering an infinite loop.

## Submission tip

Put everything in a public repository named `git-mastery-a14-git-in-ci` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
