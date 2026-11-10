<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Recovering Lost Work with the Reflog

Almost nothing in Git is deleted immediately.

```mermaid
flowchart TD
    A["Accident:<br/>reset --hard / bad rebase / deleted branch"] --> B["git reflog"]
    B --> C["Find the entry before the accident<br/>e.g. HEAD@{3}"]
    C --> D{"Restore how?"}
    D -->|"move current branch"| E["git reset --hard HEAD@{3}"]
    D -->|"safer: inspect first"| F["git branch rescue HEAD@{3}"]
    B -->|"not in reflog (dropped stash)"| G["git fsck --no-reflogs --lost-found"]
    G --> F
```

**What to notice:** Reflog entries last 90 days (30 for unreachable). Objects survive until `gc` prunes them after the grace period.

**Related:** [05-undoing-changes](../modules/05-undoing-changes.md) · [21-troubleshooting-and-recovery](../modules/21-troubleshooting-and-recovery.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
