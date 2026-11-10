<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Merge vs Rebase

Same starting point, two different results.

```mermaid
flowchart TB
    subgraph Start["Starting point"]
        direction LR
        A0((A)) --> B0((B)) --> E0((E))
        B0 --> C0((C)) --> D0((D))
    end
    subgraph Merge["git merge main (on feature)"]
        direction LR
        A1((A)) --> B1((B)) --> E1((E)) --> M1((M))
        B1 --> C1((C)) --> D1((D)) --> M1
    end
    subgraph Rebase["git rebase main (on feature)"]
        direction LR
        A2((A)) --> B2((B)) --> E2((E)) --> C2(("C'")) --> D2(("D'"))
    end
```

**What to notice:** Merge preserves the real history and adds M. Rebase rewrites C and D as new commits C' and D' on top of E, giving a straight line. Rebase only branches nobody else has built on.

**Related:** [08-rebasing](../modules/08-rebasing.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
