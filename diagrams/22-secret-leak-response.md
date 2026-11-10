<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Secret Leak Response

The order matters: rotate first.

```mermaid
flowchart TD
    A[Secret found in Git] --> B[Rotate / revoke immediately]
    B --> C[Review access logs for misuse]
    C --> D{Pushed to shared remote?}
    D -->|no| E[amend / rebase locally]
    D -->|yes| F[git filter-repo --replace-text]
    F --> G[force-push all branches + tags]
    G --> H[Platform support: purge caches and PR refs]
    H --> I[Everyone re-clones]
    E & I --> J[Prevent: pre-commit gitleaks + push protection + CI scan]
```

**What to notice:** Purging history is cleanup. Rotation is the fix.

**Related:** [15-rewriting-history](../modules/15-rewriting-history.md) · [19-security](../modules/19-security.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
