<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Architecture Diagrams

30 diagrams covering Git internals, workflows, branching strategies, CI/CD, GitOps, security and disaster recovery. All are written in Mermaid, so they render directly on GitHub and GitLab, and you can copy them into your own docs and slides (please keep the DevOps Shack credit).

| # | Diagram | What it shows |
|---|---|---|
| 01 | [Git Architecture Overview](01-git-architecture-overview.md) | How your files move between the working tree, the index, your local repository and the remote. Every Git command is a move along one of these arrows. |
| 02 | [The Git Object Model](02-object-model.md) | Commits point to trees, trees point to blobs and other trees, tags point to commits. Every arrow is a content hash. |
| 03 | [History as a Directed Acyclic Graph](03-commit-dag.md) | Git history is a DAG: each commit points back to its parent(s). Merge commits have two parents. Nothing points forward. |
| 04 | [Branches, Tags, HEAD and Refs](04-refs-and-head.md) | Refs are files that hold hashes. HEAD usually points at a branch. In detached HEAD, it points straight at a commit. |
| 05 | [Local Branches vs Remote-Tracking Branches](05-local-vs-remote.md) | `origin/main` is your local snapshot of the remote, updated only when you fetch. |
| 06 | [Merge Types](06-merge-types.md) | Fast-forward, three-way merge commit, and squash merge produce three different histories from the same branches. |
| 07 | [Merge vs Rebase](07-merge-vs-rebase.md) | Same starting point, two different results. |
| 08 | [Interactive Rebase Workflow](08-interactive-rebase-flow.md) | From messy work-in-progress to a clean, reviewable series. |
| 09 | [git reset Modes](09-reset-modes.md) | What each mode does to the branch pointer, the index and the working tree. |
| 10 | [Pull Request Lifecycle](10-pull-request-lifecycle.md) | How a change moves from a developer's branch to production in a typical feature-branch workflow. |
| 11 | [Git Flow](11-git-flow.md) | Two permanent branches plus feature, release and hotfix branches. |
| 12 | [GitHub Flow](12-github-flow.md) | Main is always deployable. Short branches, PRs, merge, deploy. |
| 13 | [GitLab Flow (Environment Branches)](13-gitlab-flow.md) | Upstream first: changes land in main, then flow downstream to environment branches. |
| 14 | [Trunk-Based Development with Feature Flags](14-trunk-based.md) | Integrate daily, hide unfinished work behind flags, release by toggling. |
| 15 | [Release Branching with Backports](15-release-branching.md) | Fix on main first, cherry-pick into each supported release. |
| 16 | [Fork Workflow](16-fork-workflow.md) | Contributors without write access work in their own fork and open PRs upstream. |
| 17 | [Conflict Resolution Flow](17-conflict-resolution-flow.md) | What to do from the moment Git reports a conflict. |
| 18 | [git bisect: Binary Search](18-bisect.md) | Find the first bad commit among N commits in about log₂(N) steps. |
| 19 | [Recovering Lost Work with the Reflog](19-reflog-recovery.md) | Almost nothing in Git is deleted immediately. |
| 20 | [GitOps Delivery Flow](20-gitops-flow.md) | Git is the source of truth. An in-cluster agent pulls and reconciles. |
| 21 | [Git Events That Drive CI/CD](21-ci-cd-triggers.md) | Which Git event triggers which pipeline stage. |
| 22 | [Secret Leak Response](22-secret-leak-response.md) | The order matters: rotate first. |
| 23 | [Git Hooks Lifecycle](23-hooks-lifecycle.md) | Where client-side and server-side hooks run. |
| 24 | [Git LFS Architecture](24-lfs-architecture.md) | Large files are replaced by pointers. Content lives in a separate store. |
| 25 | [Shallow, Partial and Sparse](25-partial-sparse-clone.md) | Three ways to download or check out less. |
| 26 | [Submodule vs Subtree](26-submodule-vs-subtree.md) | A pointer versus a copy. |
| 27 | [Affected-Only CI in a Monorepo](27-monorepo-ci.md) | Build and test only what a change actually touches. |
| 28 | [Signed Commit Verification](28-signed-commit-verification.md) | How a platform shows a commit as Verified. |
| 29 | [Enterprise Git Platform Architecture](29-enterprise-git-platform.md) | How Git fits into a company's engineering platform. |
| 30 | [Git Disaster Recovery and Backup](30-disaster-recovery-backup.md) | What a clone backs up, and what it doesn't. |


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
