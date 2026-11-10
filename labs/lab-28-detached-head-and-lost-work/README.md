<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 28 · Detached HEAD and Lost Work

**Level:** Intermediate · 15 min · **Module:** [06 · Branching](../../modules/06-branching.md)

## Scenario

You checked out tag `v1.0` to try an idea, made two commits, then switched back to `main`. Git warned you, but you didn't read it. Now `git log --all` doesn't show the experiment.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Explain why the commits disappeared from `git log --all`. (Nothing points to them.)
2. Find them in `git reflog`.
3. Create the branch `experiment/cache` at the experiment's last commit (`experiment: cache ttl`).
4. Bonus: how would you have avoided this? (`git switch -c` before committing in detached HEAD.)

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh). Try it yourself first. Breaking things and fixing them is the point.

</details>


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
