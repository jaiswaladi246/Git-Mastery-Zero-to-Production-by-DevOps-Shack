<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git Flow

Two permanent branches plus feature, release and hotfix branches.

```mermaid
gitGraph
    commit id: "v1.0" tag: "v1.0"
    branch develop
    commit id: "d1"
    branch feature/a
    commit id: "a1"
    commit id: "a2"
    checkout develop
    merge feature/a
    branch release/1.1
    commit id: "rc fix"
    checkout main
    merge release/1.1 tag: "v1.1"
    checkout develop
    merge release/1.1
    checkout main
    branch hotfix/1.1.1
    commit id: "hotfix"
    checkout main
    merge hotfix/1.1.1 tag: "v1.1.1"
    checkout develop
    merge hotfix/1.1.1
```

**What to notice:** Releases and hotfixes merge into both `main` and `develop`. Forgetting the second merge is the classic Git Flow regression.

**Related:** [01-git-flow](../branching-strategies/01-git-flow.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
