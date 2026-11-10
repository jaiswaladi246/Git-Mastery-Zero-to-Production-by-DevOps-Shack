<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# git reset Modes

What each mode does to the branch pointer, the index and the working tree.

```mermaid
flowchart LR
    subgraph soft["--soft"]
        s1["Branch ← moves"] --> s2["Index: kept"] --> s3["Working tree: kept"]
    end
    subgraph mixed["--mixed (default)"]
        m1["Branch ← moves"] --> m2["Index: reset"] --> m3["Working tree: kept"]
    end
    subgraph hard["--hard"]
        h1["Branch ← moves"] --> h2["Index: reset"] --> h3["Working tree: reset ⚠"]
    end
```

**What to notice:** `--soft` is for recombining commits, `--mixed` for unstaging and recommitting, `--hard` for discarding. All three can be undone through the reflog, but uncommitted working-tree changes lost with `--hard` can't.

**Related:** [05-undoing-changes](../modules/05-undoing-changes.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
