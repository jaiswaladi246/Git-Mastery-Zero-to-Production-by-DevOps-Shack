<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# The Git Object Model

Commits point to trees, trees point to blobs and other trees, tags point to commits. Every arrow is a content hash.

```mermaid
flowchart TB
    TAG["tag object · v1.0<br/>tagger, message, signature"] --> C2
    C2["commit c2<br/>Add API"] --> T2["tree (root)"]
    C2 --> C1["commit c1<br/>Initial commit"]
    C1 --> T1["tree (root)"]
    T1 --> B1["blob · README.md v1"]
    T2 --> B1b["blob · README.md v1<br/>(same blob reused)"]
    T2 --> TS["tree · src/"]
    TS --> B2["blob · app.js"]
    B1 -.same hash.- B1b
```

**What to notice:** Unchanged files aren't stored twice: c2's tree points to the same README blob as c1's. This is why snapshots are cheap. Changing any byte anywhere changes the blob hash, which changes the tree hash, which changes the commit hash.

**Related:** [04-git-internals](../modules/04-git-internals.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
