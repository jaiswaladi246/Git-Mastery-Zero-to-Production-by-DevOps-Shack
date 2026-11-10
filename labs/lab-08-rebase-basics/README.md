<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 08 · Rebase Basics

**Level:** Intermediate · **Time:** 20 minutes · **Module:** [08 · Rebasing](../../modules/08-rebasing.md)

## Scenario

You built `feature/search` while `main` moved ahead with two new commits. The team wants a **linear history**: no merge commits on `main`.

## Setup

```bash
bash setup.sh && cd playground
git log --oneline --graph --all
```

Note the hashes of the two search commits before you start.

## Tasks

1. Rebase `feature/search` onto the latest `main`.
2. Compare the search commits' hashes with the ones you noted. Why did they change?
3. Fast-forward `main` to include the feature (`--ff-only`).
4. Confirm the history is a straight line with five commits.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- Rebase creates *new* commits (same changes, new parents, so new hashes).
- `git merge --ff-only` refuses to create a merge commit, which is a good safety net.

</details>

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
