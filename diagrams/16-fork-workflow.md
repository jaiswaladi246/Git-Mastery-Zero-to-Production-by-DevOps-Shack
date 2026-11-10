<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Fork Workflow

Contributors without write access work in their own fork and open PRs upstream.

```mermaid
flowchart LR
    UP[("upstream<br/>devopsshack/project")] -->|fork on platform| FK[("origin<br/>you/project")]
    FK -->|git clone| LC[(local clone)]
    UP -->|git fetch upstream| LC
    LC -->|git push origin feature| FK
    FK -->|pull request| UP
```

**What to notice:** Keep your fork's main in sync with `git fetch upstream && git rebase upstream/main`, and never commit directly to your fork's main.

**Related:** [10-collaboration-workflows](../modules/10-collaboration-workflows.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
