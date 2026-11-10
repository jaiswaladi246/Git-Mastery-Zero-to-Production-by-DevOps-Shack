<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# git bisect: Binary Search

Find the first bad commit among N commits in about log₂(N) steps.

```mermaid
flowchart TD
    S["git bisect start<br/>bad = HEAD, good = v2.3.0<br/>(512 commits)"] --> T1["test midpoint → bad"]
    T1 --> T2["256 left → test → good"]
    T2 --> T3["128 left → test → bad"]
    T3 --> T4["... 9 steps total ..."]
    T4 --> R["first bad commit found"]
    R --> E["git bisect reset"]
    S -.->|"automate"| A["git bisect run ./test.sh<br/>exit 0 good · 1-127 bad · 125 skip"]
```

**What to notice:** 512 commits need at most 9 tests. With `bisect run`, Git does all of them unattended.

**Related:** [14-history-investigation](../modules/14-history-investigation.md)

← [All diagrams](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
