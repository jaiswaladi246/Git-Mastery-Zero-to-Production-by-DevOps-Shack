<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Branches, Tags, HEAD and Refs

Refs are files that hold hashes. HEAD usually points at a branch. In detached HEAD, it points straight at a commit.

```mermaid
flowchart LR
    subgraph Attached["Normal (attached) HEAD"]
        H1((HEAD)) --> RB1["refs/heads/main"] --> CA1((c7))
    end
    subgraph Detached["Detached HEAD"]
        H2((HEAD)) --> CA2((c4))
        RB2["refs/heads/main"] --> CA3((c7))
    end
    subgraph Others["Other refs"]
        TG["refs/tags/v1.0"] --> CT((c5))
        RT["refs/remotes/origin/main"] --> CR((c6))
        SS["refs/stash"] --> CS((stash commit))
    end
```

**What to notice:** Committing on an attached HEAD moves the branch. Committing on a detached HEAD moves only HEAD, so the new commits belong to no branch until you create one.

**Related:** [06-branching](../modules/06-branching.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
