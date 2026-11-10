<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A05 · Team Collaboration Simulation

**Level:** Intermediate · **Estimated time:** 3 hours (pairs or trios) · **Related:** [Module 09](../modules/README.md) · [Module 10](../modules/README.md)

## Objective

Simulate a small team shipping features through PRs with protection rules, reviews and CI.

## Requirements

1. One repo on GitHub/GitLab; each member works from their own branch (or fork).
2. Protect `main`: PR required, 1 approval, status check required, no force push.
3. Add a CODEOWNERS file and a PR template.
4. Each member ships 3 PRs; at least one PR must hit a conflict that the author resolves by rebasing.
5. Use squash-merge as the default and enable auto-delete of head branches.

## Deliverables

- Repo link with closed PRs visible
- RETRO.md: what went well, what slowed you down, rules you'd change

## Grading rubric

| Criterion | Points |
|---|---|
| Protection setup | 25 |
| PR quality (size, description) | 25 |
| Conflict handling | 25 |
| Retro insight | 25 |
| **Total** | **100** |

## Stretch goal

Add a merge queue / merge train and explain the difference it made.

## Submission tip

Put everything in a public repository named `git-mastery-a05-team-simulation` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
