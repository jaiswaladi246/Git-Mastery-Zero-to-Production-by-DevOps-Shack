<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git Hooks Lifecycle

Where client-side and server-side hooks run.

```mermaid
sequenceDiagram
    participant Dev as Developer
    participant C as Client hooks
    participant S as Server hooks
    Dev->>C: git commit
    C->>C: pre-commit (lint, secrets)
    C->>C: prepare-commit-msg (ticket ID)
    C->>C: commit-msg (format check)
    C->>C: post-commit
    Dev->>C: git push
    C->>C: pre-push (tests)
    C->>S: send packfile
    S->>S: pre-receive (policy, can reject)
    S->>S: update (per ref)
    S->>S: post-receive (CI, notify)
```

**What to notice:** Client hooks can be skipped with `--no-verify`. Server hooks and branch protection can't.

**Related:** [17-hooks-and-automation](../modules/17-hooks-and-automation.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
