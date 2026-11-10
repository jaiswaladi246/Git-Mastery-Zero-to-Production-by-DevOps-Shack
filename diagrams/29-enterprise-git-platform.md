<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Enterprise Git Platform Architecture

How Git fits into a company's engineering platform.

```mermaid
flowchart TB
    IdP[SSO / IdP + MFA] --> GP
    subgraph GP["Git platform (GitHub / GitLab)"]
        Repos[(Repositories)]
        Rules[Rulesets · CODEOWNERS · protections]
        Sec[Secret scanning · code scanning]
        Audit[Audit log]
    end
    TF[Terraform: settings as code] --> Rules
    Repos --> CI[CI runners]
    CI --> Reg[(Artifact / image registry)]
    Repos --> GO[GitOps agents] --> Clusters[(Kubernetes clusters)]
    Audit --> SIEM[SIEM]
    Repos --> Backup[(Mirror backups)]
```

**What to notice:** Owning Git at scale means owning identity, policy, automation, backups and audit around the repositories, not just the repositories.

**Related:** [24-git-at-scale](../modules/24-git-at-scale.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
