<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 13 · Git Flow End to End

**Level:** Intermediate · **Time:** 45 minutes · **Strategy guide:** [Git Flow](../../branching-strategies/01-git-flow.md)

## Scenario

You maintain a versioned product released as `v1.0.0`. Run one complete Git Flow cycle: a feature, a release and a hotfix.

## Setup

```bash
bash setup.sh && cd playground
git log --oneline --graph --all
```

## Tasks

1. **Feature**: branch `feature/login` from `develop`, add `login.sh`, and merge it back into `develop` with `--no-ff`. Delete the feature branch.
2. **Release**: branch `release/1.1.0` from `develop`, and set `VERSION` to `1.1.0` in a commit. Merge into `main` (`--no-ff`) and create the **annotated** tag `v1.1.0`. Merge the release back into `develop`. Delete the release branch.
3. **Hotfix**: branch `hotfix/1.1.1` from `main`, and set `VERSION` to `1.1.1` (pretend it also fixes a bug). Merge into `main`, tag `v1.1.1` (annotated), and merge into `develop`. Delete the hotfix branch.
4. Look at `git log --oneline --graph --all` and match it to the diagram in the strategy guide.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- Annotated tag: `git tag -a v1.1.0 -m "Release 1.1.0"`.
- If merging the hotfix into develop conflicts on `VERSION`, keep `1.1.1`.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Interview connection

"Why does a hotfix merge into both main and develop?" Because otherwise the next release, cut from develop, would reintroduce the bug.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
