<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A09 · Split a Monorepo

**Level:** Advanced · **Estimated time:** 2 hours · **Related:** [Module 15](../modules/README.md) · [Module 16](../modules/README.md)

## Objective

Extract one service from a monorepo into its own repository while keeping its history.

## Requirements

1. Build or use a monorepo with 3+ services and 30+ commits touching multiple services.
2. Use `git filter-repo --subdirectory-filter` to extract one service.
3. Verify that history, tags (renamed per service, e.g. `payments-v1.2.0`) and authors are preserved.
4. Remove the service from the monorepo with a normal commit and add a pointer README.

## Deliverables

- New repo link
- SPLIT.md with commands, before/after commit counts, and verification steps

## Grading rubric

| Criterion | Points |
|---|---|
| History preserved | 35 |
| Tags handled | 20 |
| Monorepo cleanup | 20 |
| Documentation | 25 |
| **Total** | **100** |

## Stretch goal

Do the reverse: merge two repos into one monorepo preserving both histories (`--to-subdirectory-filter`).

## Submission tip

Put everything in a public repository named `git-mastery-a09-monorepo-split` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
