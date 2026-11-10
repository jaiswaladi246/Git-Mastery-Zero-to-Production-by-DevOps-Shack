<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A12 · Hooks Pipeline

**Level:** Intermediate · **Estimated time:** 2 hours · **Related:** [Module 17](../modules/README.md)

## Objective

Build a local-plus-CI quality gate using the pre-commit framework.

## Requirements

1. `.pre-commit-config.yaml` with whitespace, YAML check, large-file block, private-key detection, gitleaks and one language linter.
2. A commit-msg hook enforcing Conventional Commits.
3. A prepare-commit-msg hook that inserts the ticket ID from the branch name.
4. The same checks running in CI with `pre-commit run --all-files`.

## Deliverables

- Repo link
- HOOKS.md showing blocked and allowed examples

## Grading rubric

| Criterion | Points |
|---|---|
| Hooks work locally | 40 |
| CI parity | 30 |
| Docs | 30 |
| **Total** | **100** |

## Stretch goal

Switch to Lefthook and compare speed on a large repo.

## Submission tip

Put everything in a public repository named `git-mastery-a12-hooks-pipeline` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
