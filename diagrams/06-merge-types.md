<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Merge Types

Fast-forward, three-way merge commit, and squash merge produce three different histories from the same branches.

```mermaid
flowchart TB
    subgraph FF["Fast-forward"]
        direction LR
        a1((A)) --> b1((B)) --> c1((C)) --> d1((D))
        m1(["main"]) -.-> d1
    end
    subgraph TW["Three-way (--no-ff)"]
        direction LR
        a2((A)) --> b2((B)) --> e2((E)) --> M2((M))
        b2 --> c2((C)) --> d2((D)) --> M2
        m2(["main"]) -.-> M2
    end
    subgraph SQ["Squash"]
        direction LR
        a3((A)) --> b3((B)) --> e3((E)) --> S3(("S = C+D"))
        m3(["main"]) -.-> S3
    end
```

**What to notice:** Arrows here show order in time (left to right). A fast-forward just moves the pointer. A three-way merge creates M with two parents. A squash creates a brand-new single commit S, and the original C and D aren't part of main's history.

**Related:** [07-merging-and-conflicts](../modules/07-merging-and-conflicts.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
