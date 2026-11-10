<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Interactive Rebase Workflow

From messy work-in-progress to a clean, reviewable series.

```mermaid
flowchart LR
    A["5 messy commits<br/>wip, typo, fix review"] --> B["git rebase -i main"]
    B --> C{"Edit todo list"}
    C -->|pick| K[Keep]
    C -->|reword| R[New message]
    C -->|squash / fixup| S[Combine]
    C -->|edit| E[Stop and amend or split]
    C -->|drop| X[Remove]
    K & R & S & E & X --> D{Conflict?}
    D -->|yes| F["resolve → git add → git rebase --continue"]
    D -->|no| G["2 clean commits"]
    F --> G
    G --> H["git push --force-with-lease"]
```

**What to notice:** Use `git commit --fixup=<sha>` during review, then `git rebase -i --autosquash main` to fold fixes into the right commits automatically.

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
