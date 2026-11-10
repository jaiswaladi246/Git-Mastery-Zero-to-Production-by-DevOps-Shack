<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A08 · Bisect the Bug

**Level:** Intermediate · **Estimated time:** 1.5 hours · **Related:** [Module 14](../modules/README.md)

## Objective

Find a regression in a real open-source project's history using automated bisect.

## Requirements

1. Pick an open-source repo (or the provided script in Lab 19 with 500 commits).
2. Write a test script that returns 0/1/125 correctly.
3. Run `git bisect run` and record the session with `git bisect log`.
4. Explain the bad commit and propose a fix.

## Deliverables

- bisect.log
- BISECT.md with the test script and analysis

## Grading rubric

| Criterion | Points |
|---|---|
| Correct culprit | 40 |
| Test script quality (incl. 125 skip) | 30 |
| Analysis | 30 |
| **Total** | **100** |

## Stretch goal

Use `--first-parent` to bisect only merged PRs first, then drill in.

## Submission tip

Put everything in a public repository named `git-mastery-a08-bisect-the-bug` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
