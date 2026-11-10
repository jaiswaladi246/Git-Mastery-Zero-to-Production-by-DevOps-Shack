<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git Architecture Overview

How your files move between the working tree, the index, your local repository and the remote. Every Git command is a move along one of these arrows.

```mermaid
flowchart LR
    subgraph Local["Your machine"]
        WT["Working Tree<br/>files on disk"]
        IX["Index / Staging Area<br/>.git/index"]
        LR[("Local Repository<br/>.git/objects + refs")]
        ST[("Stash<br/>refs/stash")]
    end
    subgraph Remote["Remote (GitHub / GitLab)"]
        RR[("Remote Repository<br/>bare repo")]
    end
    WT -- "git add" --> IX
    IX -- "git commit" --> LR
    LR -- "git push" --> RR
    RR -- "git fetch" --> LR
    RR -- "git pull = fetch + merge/rebase" --> WT
    LR -- "git switch / restore" --> WT
    IX -- "git restore --staged" --> WT
    WT -- "git stash" --> ST
    ST -- "git stash pop" --> WT
    RR -- "git clone" --> LR
```

**What to notice:** `fetch` only updates the local repository (remote-tracking branches). `pull` goes all the way to your working tree. `clone` creates the local repository and checks out a working tree in one step.

**Related:** [01-version-control-overview](../modules/01-version-control-overview.md) · [03-core-workflow](../modules/03-core-workflow.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
