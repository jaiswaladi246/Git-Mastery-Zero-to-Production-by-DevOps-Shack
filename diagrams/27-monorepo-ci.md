<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Affected-Only CI in a Monorepo

Build and test only what a change actually touches.

```mermaid
flowchart LR
    PR[PR changes libs/shared] --> DG[Dependency graph<br/>Nx / Bazel / Turborepo]
    DG --> A1[payments-svc ✔ build]
    DG --> A2[orders-svc ✔ build]
    DG --> A3[web-app ✖ skipped]
    DG --> A4[admin-app ✖ skipped]
```

**What to notice:** Without this, every commit rebuilds everything and CI time grows with the size of the repo.

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
