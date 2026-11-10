<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A17 · Recover a Corrupted Repository

**Level:** Advanced · **Estimated time:** 1.5 hours · **Related:** [Module 21](../modules/README.md)

## Objective

Practise three corruption-recovery techniques.

## Requirements

1. Corrupt a loose object, a packfile and the index in three separate copies of a repo.
2. Recover each using a different method: fetch from healthy remote, copy packs from another clone, rebuild index.
3. Preserve one unpushed commit in each case.
4. Document symptoms, diagnosis and recovery.

## Deliverables

- RECOVERY.md

## Grading rubric

| Criterion | Points |
|---|---|
| All 3 recovered | 45 |
| Unpushed work preserved | 25 |
| Diagnosis explanation | 30 |
| **Total** | **100** |

## Stretch goal

Write a script that runs `git fsck` across all repos on a machine and reports problems.

## Submission tip

Put everything in a public repository named `git-mastery-a17-recover-corrupted-repo` and share it on LinkedIn with **#DevOpsShack** and **#GitMastery**. A recruiter-visible Git portfolio is worth more than a certificate line on its own.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
