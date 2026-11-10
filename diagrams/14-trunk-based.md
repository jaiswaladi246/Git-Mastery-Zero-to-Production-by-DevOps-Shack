<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Trunk-Based Development with Feature Flags

Integrate daily, hide unfinished work behind flags, release by toggling.

```mermaid
flowchart LR
    D1[Dev 1 small PR] --> T[(trunk / main)]
    D2[Dev 2 small PR] --> T
    D3[Dev 3 small PR] --> T
    T --> CI[CI < 10 min]
    CI --> CD[Deploy to prod<br/>flags OFF]
    CD --> FF{Feature flag}
    FF -->|internal| U1[Staff]
    FF -->|5%| U2[Canary users]
    FF -->|100%| U3[Everyone]
```

**What to notice:** Deploying and releasing become separate decisions. Code ships dark, and the flag controls who sees it.

**Related:** [04-trunk-based-development](../branching-strategies/04-trunk-based-development.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
