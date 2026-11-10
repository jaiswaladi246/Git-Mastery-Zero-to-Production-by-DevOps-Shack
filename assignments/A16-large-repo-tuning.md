<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A16 · Large Repo Tuning

**Level:** Advanced · **Estimated time:** 2 hours · **Related:** [Module 20](../modules/README.md)

## Objective

Measure and improve Git performance on a big repository.

## Requirements

1. Clone a large public repo (e.g. linux, chromium mirror subset, or a generated 200k-file repo).
2. Measure clone, status and log --graph times before tuning.
3. Apply partial clone, sparse checkout, fsmonitor, commit-graph, `git maintenance` or `scalar`.
4. Re-measure and report the speedups in a table.

## Deliverables

- PERF.md with before/after numbers and commands

## Grading rubric

| Criterion | Points |
|---|---|
| Baseline method | 25 |
| Optimizations applied | 40 |
| Results and explanation | 35 |
| **Total** | **100** |

## Stretch goal

Profile with `GIT_TRACE_PERFORMANCE` and explain the biggest cost.

## Submission tip

Put everything in a public repository named `git-mastery-a16-large-repo-tuning` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
