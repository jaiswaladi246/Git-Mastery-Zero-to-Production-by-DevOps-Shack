<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Signed Commit Verification

How a platform shows a commit as Verified.

```mermaid
sequenceDiagram
    participant Dev
    participant Git
    participant Platform as GitHub/GitLab
    Dev->>Git: git commit -S (SSH or GPG key)
    Git->>Git: signature embedded in commit object
    Dev->>Platform: git push
    Platform->>Platform: look up signer's public key on account
    Platform->>Platform: verify signature + email match
    Platform-->>Dev: Verified ✔ (or Unverified)
    Note over Platform: branch rule "require signed commits" rejects unverified
```

**What to notice:** Signing proves who created the commit. `user.email` alone proves nothing.

**Related:** [19-security](../modules/19-security.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
