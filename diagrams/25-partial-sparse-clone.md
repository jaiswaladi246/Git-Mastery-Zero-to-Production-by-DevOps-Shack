<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Shallow, Partial and Sparse

Three ways to download or check out less.

```mermaid
flowchart TB
    subgraph Full["Full clone"]
        F1["All commits"] --- F2["All trees"] --- F3["All blobs, all versions"]
    end
    subgraph Shallow["--depth 1"]
        S1["Latest commit only"] --- S2["Its tree"] --- S3["Its blobs"]
    end
    subgraph Partial["--filter=blob:none"]
        P1["All commits"] --- P2["All trees"] --- P3["Blobs on demand"]
    end
    subgraph Sparse["+ sparse-checkout"]
        Q1["Working tree shows only<br/>services/payments + libs/shared"]
    end
    Partial --> Sparse
```

**What to notice:** Shallow suits throwaway CI. Partial plus sparse suits developers on huge monorepos.

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
