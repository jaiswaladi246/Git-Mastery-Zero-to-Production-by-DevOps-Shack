<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 12 · Fork Workflow

**Level:** Intermediate · **Time:** 25 minutes · **Module:** [10 · Collaboration Workflows](../../modules/10-collaboration-workflows.md)

## Scenario

You forked an open-source project to contribute a docs fix. Since you forked, the maintainers pushed two new commits. Your fork is out of date, and a PR from a stale fork means extra work for reviewers.

The playground has three repos: `upstream.git` (the original project), `fork.git` (your fork, which is `origin` for your clone), and `local/` (your working clone).

## Setup

```bash
bash setup.sh
cd playground/local
```

## Tasks

1. Add the original project as a remote named `upstream`.
2. Sync your fork's `main` with `upstream/main`, and push it to `origin`.
3. Create `fix/docs-typo` from the updated main, commit one small fix, and push it to your fork.
4. (On a real platform, you'd now open a PR from `fork:fix/docs-typo` to `upstream:main`.)

## Verify

```bash
bash ../../verify.sh
```

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Good habit

Never commit to your fork's `main`. Keep it as a clean mirror of upstream, and do all work on branches.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
