<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# GitLab Flow (Environment Branches)

Upstream first: changes land in main, then flow downstream to environment branches.

```mermaid
flowchart LR
    F1[feature/a] -->|MR| M[main → staging]
    F2[feature/b] -->|MR| M
    M -->|"MR (ff-only)"| P[pre-production → pre-prod]
    P -->|"MR (ff-only)"| PR[production → prod]
    HF[hotfix] -.->|"never directly"| PR
    HF -->|MR| M
```

**What to notice:** Even hotfixes go to main first and are promoted. Promotion by fast-forward keeps each environment branch an exact earlier state of main.

**Related:** [03-gitlab-flow](../branching-strategies/03-gitlab-flow.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
