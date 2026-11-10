<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 23 · Git Hooks

**Level:** Intermediate · 35 min · **Module:** [17 · Hooks & Automation](../../modules/17-hooks-and-automation.md)

## Scenario

Your team keeps pushing messages like "updated stuff," and last month someone committed an AWS key. Build shared hooks that every developer gets from the repo.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Create `.githooks/commit-msg` that rejects messages not following Conventional Commits (`type(scope)?: subject`). Allow messages starting with `Merge`, `Revert`, `fixup!` and `squash!`.
2. Create `.githooks/pre-commit` that blocks any staged line matching `AKIA[0-9A-Z]{16}`.
3. Make both executable and commit them, so the hooks travel with the repo.
4. Point Git at them: `git config core.hooksPath .githooks`.
5. Test both hooks yourself. Then try `--no-verify`, and note why CI must run the same checks.

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
