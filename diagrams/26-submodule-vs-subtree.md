<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Submodule vs Subtree

A pointer versus a copy.

```mermaid
flowchart LR
    subgraph Sub["Submodule"]
        PA[(parent repo)] -->|"gitlink 160000<br/>commit abc123"| CH[(shared-lib repo)]
        PA --- GM[".gitmodules<br/>url + path"]
    end
    subgraph Tree["Subtree"]
        PB[(parent repo)] --- FD["libs/shared/<br/>real files + history"]
        FD -.->|"subtree pull / push"| CH2[(shared-lib repo)]
    end
```

**What to notice:** Submodules pin exactly but need extra commands. Subtrees just work for consumers but make the parent bigger.

**Related:** [16-submodules-subtrees-monorepos](../modules/16-submodules-subtrees-monorepos.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
