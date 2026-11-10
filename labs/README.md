<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Hands-on Labs

30 labs that put you into real Git situations, from your first commit to a 2 AM production incident.

## How every lab works

```bash
cd labs/lab-07-merge-conflicts
bash setup.sh        # builds the scenario in ./playground (safe to re-run anytime)
cd playground
# ...solve the tasks in README.md...
bash ../verify.sh    # automatic checks tell you whether you got it right
```

Each lab also ships a `solution.sh` with one correct path. Try on your own first. Every solution is tested to pass its verifier.

**Requirements:** Git 2.30+ and bash (Linux, macOS, WSL or Git Bash). Lab 21 needs `git-filter-repo`, Lab 24 needs `ssh-keygen`, and Lab 25 needs `git-lfs`.

The scripts never touch your global Git config or your real projects. Everything happens inside each lab's `playground` folder.

| # | Lab | Level |
|---|---|---|
| 01 | [Your First Repository](lab-01-first-repository/README.md) | Beginner |
| 02 | [Mastering the Staging Area](lab-02-staging-area/README.md) | Beginner |
| 03 | [.gitignore Deep Dive](lab-03-gitignore/README.md) | Beginner |
| 04 | [Exploring Git Objects](lab-04-git-objects/README.md) | Intermediate |
| 05 | [Undo Everything](lab-05-undo-everything/README.md) | Beginner–Intermediate |
| 06 | [Reflog Rescue](lab-06-reflog-rescue/README.md) | Intermediate |
| 07 | [Merge Conflicts](lab-07-merge-conflicts/README.md) | Intermediate |
| 08 | [Rebase Basics](lab-08-rebase-basics/README.md) | Intermediate |
| 09 | [Interactive Rebase](lab-09-interactive-rebase/README.md) | Intermediate |
| 10 | [Rebase Conflicts](lab-10-rebase-conflicts/README.md) | Intermediate–Advanced |
| 11 | [Remotes and Upstream](lab-11-remotes-and-upstream/README.md) | Intermediate |
| 12 | [Fork Workflow](lab-12-fork-workflow/README.md) | Intermediate |
| 13 | [Git Flow End to End](lab-13-git-flow/README.md) | Intermediate |
| 14 | [Trunk-Based Development with Feature Flags](lab-14-trunk-based/README.md) | Intermediate |
| 15 | [Tags and Releases](lab-15-tags-and-releases/README.md) | Intermediate |
| 16 | [Stash Scenarios](lab-16-stash/README.md) | Intermediate |
| 17 | [Cherry-pick and Backports](lab-17-cherry-pick/README.md) | Intermediate |
| 18 | [Worktrees](lab-18-worktrees/README.md) | Intermediate |
| 19 | [Hunting a Regression with git bisect](lab-19-bisect/README.md) | Intermediate |
| 20 | [Blame and Log Forensics](lab-20-blame-and-log-forensics/README.md) | Intermediate |
| 21 | [Remove a Secret from History](lab-21-remove-secrets/README.md) | Advanced |
| 22 | [Submodules and Subtrees](lab-22-submodules-subtrees/README.md) | Advanced |
| 23 | [Git Hooks](lab-23-hooks/README.md) | Intermediate |
| 24 | [Signed Commits and Tags](lab-24-signed-commits/README.md) | Intermediate |
| 25 | [Migrating Big Binaries to Git LFS](lab-25-git-lfs/README.md) | Advanced |
| 26 | [Sparse Checkout + Partial Clone](lab-26-sparse-and-partial-clone/README.md) | Advanced |
| 27 | [rerere: Reuse Recorded Resolution](lab-27-rerere/README.md) | Advanced |
| 28 | [Detached HEAD and Lost Work](lab-28-detached-head-and-lost-work/README.md) | Intermediate |
| 29 | [Repository Corruption Recovery](lab-29-repo-corruption-recovery/README.md) | Advanced |
| 30 | [Production Incident Drill (Capstone)](lab-30-production-incident-drill/README.md) | Advanced |


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
