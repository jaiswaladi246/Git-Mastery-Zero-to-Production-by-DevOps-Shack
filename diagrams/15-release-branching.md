<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Release Branching with Backports

Fix on main first, cherry-pick into each supported release.

```mermaid
gitGraph
    commit id: "A"
    branch release/1.4
    commit id: "1.4.0" tag: "v1.4.0"
    checkout main
    commit id: "B"
    branch release/1.5
    commit id: "1.5.0" tag: "v1.5.0"
    checkout main
    commit id: "FIX-881"
    checkout release/1.5
    cherry-pick id: "FIX-881" tag: "v1.5.1"
    checkout release/1.4
    cherry-pick id: "FIX-881" tag: "v1.4.1"
    checkout main
    commit id: "C"
```

**What to notice:** Use `git cherry-pick -x` so every backport records the original commit hash.

**Related:** [05-release-branching](../branching-strategies/05-release-branching.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
