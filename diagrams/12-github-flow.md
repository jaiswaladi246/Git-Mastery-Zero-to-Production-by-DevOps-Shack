<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# GitHub Flow

Main is always deployable. Short branches, PRs, merge, deploy.

```mermaid
gitGraph
    commit id: "A"
    branch feature/search
    commit id: "s1"
    commit id: "s2"
    checkout main
    merge feature/search id: "PR #41 → deploy"
    branch fix/header
    commit id: "f1"
    checkout main
    merge fix/header id: "PR #42 → deploy"
```

**What to notice:** Every merge to main triggers deployment. There are no develop, release or hotfix branch types.

**Related:** [02-github-flow](../branching-strategies/02-github-flow.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
