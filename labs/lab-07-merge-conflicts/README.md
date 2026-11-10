<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 07 · Merge Conflicts

**Level:** Intermediate · **Time:** 30 minutes · **Module:** [07 · Merging & Conflicts](../../modules/07-merging-and-conflicts.md)

## Scenario

`main` and `feature/retry` both changed the service timeout and the README. The feature branch also deleted `legacy.txt`, which `main` patched in the meantime. You'll hit three kinds of conflict in one merge: two content conflicts and a modify/delete conflict.

The team agreed on these outcomes:

- `timeout` must be **60** and `retries` **5** (the feature's values, because retries need longer timeouts).
- The README must keep **both** new lines (Monitoring and Retries).
- `legacy.txt` must be **deleted**. The endpoint is being removed.

## Setup

```bash
bash setup.sh && cd playground
```

The playground has `merge.conflictstyle = zdiff3` set, so you'll see the common ancestor inside the conflict markers.

## Tasks

1. From `main`, merge `feature/retry`.
2. Run `git status` and identify each conflict type.
3. Resolve each file as agreed above. Remove every conflict marker.
4. Mark files resolved (`git add` / `git rm`) and complete the merge commit.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- The `|||||||` section shows the original value (`timeout: 10`). It helps you see what each side intended.
- For modify/delete, `git rm legacy.txt` resolves it in favour of deletion.
- `git diff --name-only --diff-filter=U` lists unresolved files.
- Made a mess? `git merge --abort` and start again.

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
