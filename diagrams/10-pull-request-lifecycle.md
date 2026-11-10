<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Pull Request Lifecycle

How a change moves from a developer's branch to production in a typical feature-branch workflow.

```mermaid
stateDiagram-v2
    [*] --> Branch: git switch -c feature/x
    Branch --> Draft: push + open draft PR
    Draft --> Ready: mark ready for review
    Ready --> CI: pipeline runs
    CI --> ChangesRequested: checks fail or review comments
    ChangesRequested --> CI: push fixes
    CI --> Approved: checks pass + approvals
    Approved --> MergeQueue: add to merge queue
    MergeQueue --> Merged: combined build green
    MergeQueue --> ChangesRequested: combined build red
    Merged --> Deployed: CD pipeline on main
    Deployed --> [*]
```

**What to notice:** Branch protection decides which transitions are allowed: required checks, approval counts, CODEOWNERS and up-to-date requirements.

**Related:** [10-collaboration-workflows](../modules/10-collaboration-workflows.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
