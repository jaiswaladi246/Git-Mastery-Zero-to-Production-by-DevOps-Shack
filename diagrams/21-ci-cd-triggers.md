<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git Events That Drive CI/CD

Which Git event triggers which pipeline stage.

```mermaid
flowchart TB
    E1[push: feature/*] --> P1[lint · unit tests · build]
    E2[pull_request / merge_request] --> P2[full tests · SAST · secret scan · preview env]
    E3[merge to main] --> P3[build image tagged with SHA · deploy staging]
    E4[tag v*.*.*] --> P4[release notes · publish artifacts · deploy prod]
    E5[schedule] --> P5[nightly e2e · dependency updates · history secret scan]
```

**What to notice:** Use path filters in monorepos so only affected services build.

**Related:** [18-git-in-cicd-and-gitops](../modules/18-git-in-cicd-and-gitops.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
