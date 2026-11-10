<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git Disaster Recovery and Backup

What a clone backs up, and what it doesn't.

```mermaid
flowchart LR
    subgraph InGit["Recoverable from any clone"]
        G1[Commits] --- G2[Branches] --- G3[Tags]
    end
    subgraph NotInGit["NOT in Git: back up separately"]
        N1[PRs / MRs + reviews] --- N2[Issues] --- N3[CI settings + secrets]
        N3 --- N4[Branch protection] --- N5[Webhooks]
    end
    Job["Scheduled job:<br/>git clone --mirror + remote update"] --> OS[(Object storage /<br/>second platform)]
    API["Platform export / API backup"] --> OS
```

**What to notice:** Test restores regularly. A backup you've never restored is just a hope.

**Related:** [21-troubleshooting-and-recovery](../modules/21-troubleshooting-and-recovery.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
