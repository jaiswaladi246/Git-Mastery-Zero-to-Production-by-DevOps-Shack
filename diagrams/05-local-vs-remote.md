<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Local Branches vs Remote-Tracking Branches

`origin/main` is your local snapshot of the remote, updated only when you fetch.

```mermaid
sequenceDiagram
    participant L as main (local)
    participant T as origin/main (tracking)
    participant R as main on server
    Note over R: teammate pushes c9
    L->>T: git status says "up to date" (stale!)
    T->>R: git fetch
    R-->>T: origin/main now at c9
    Note over L,T: "behind by 1"
    T->>L: git merge / rebase origin/main
    L->>R: git push (fast-forward accepted)
```

**What to notice:** Always fetch before trusting ahead/behind counts. A push is accepted only if it's a fast-forward of the server's branch, unless forced.

**Related:** [09-remotes](../modules/09-remotes.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
