<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Git LFS Architecture

Large files are replaced by pointers. Content lives in a separate store.

```mermaid
flowchart LR
    W["Working tree<br/>video.mp4 (real 300 MB)"] -- "git add<br/>clean filter" --> P["Index / commit<br/>pointer file (130 bytes)"]
    P -- "git push" --> GR[(Git remote)]
    W -- "pre-push: upload" --> LS[(LFS store)]
    GR -- "git clone" --> P2[pointer]
    P2 -- "checkout<br/>smudge filter" --> LS
    LS --> W2["Working tree<br/>video.mp4 (real)"]
```

**What to notice:** Only the versions you check out are downloaded, so clones stay small. Set it up before large files enter history.

**Related:** [20-large-files-and-performance](../modules/20-large-files-and-performance.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
