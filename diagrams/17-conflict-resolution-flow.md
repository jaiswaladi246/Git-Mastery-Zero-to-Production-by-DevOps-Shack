<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Conflict Resolution Flow

What to do from the moment Git reports a conflict.

```mermaid
flowchart TD
    A["CONFLICT reported"] --> B["git status<br/>list 'both modified'"]
    B --> C{Conflict type}
    C -->|content| D["Edit file, read ancestor with zdiff3,<br/>remove markers"]
    C -->|modify/delete| E["Decide: git add (keep) or git rm (delete)"]
    C -->|binary| F["git checkout --ours / --theirs"]
    C -->|lock file| G["Take one side, regenerate with package manager"]
    D & E & F & G --> H["git add file"]
    H --> I{All resolved?}
    I -->|no| B
    I -->|yes| J{Operation}
    J -->|merge| K[git commit]
    J -->|rebase| L[git rebase --continue]
    J -->|cherry-pick| M[git cherry-pick --continue]
    A -.->|give up| Z["--abort"]
```

**What to notice:** During a rebase, ours and theirs are swapped. Read the file instead of trusting the labels.

**Related:** [07-merging-and-conflicts](../modules/07-merging-and-conflicts.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
