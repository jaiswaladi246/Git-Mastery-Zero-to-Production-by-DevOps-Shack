<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# GitOps Delivery Flow

Git is the source of truth. An in-cluster agent pulls and reconciles.

```mermaid
flowchart LR
    Dev[Developer] -->|PR + merge| App[(App repo)]
    App -->|CI: build, test, scan| Img[(Registry<br/>app:3f9a1c2)]
    App -->|CI bot opens PR<br/>bump image tag| Cfg[(GitOps repo<br/>overlays/dev, staging, prod)]
    Rev[Reviewer] -->|approve promotion PR| Cfg
    Agent["Argo CD / Flux<br/>(inside cluster)"] -->|pull| Cfg
    Agent -->|apply| K8s[(Kubernetes)]
    K8s -->|status / drift| Agent
```

**What to notice:** CI never needs cluster credentials. Rollback is `git revert` on the GitOps repo.

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
