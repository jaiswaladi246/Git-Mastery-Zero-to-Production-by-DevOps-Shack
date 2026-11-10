<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 27 · rerere: Reuse Recorded Resolution

**Level:** Advanced · 20 min · **Module:** [23 · Advanced Configuration](../../modules/23-advanced-configuration.md)

## Scenario

You test-merge long-running branches often, and resolve the same conflict every time. Let Git remember the resolution.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Enable rerere for this repo: `git config rerere.enabled true`.
2. Merge `feature/dark` into `main`, resolve the conflict to `theme=orange-dark`, and commit. Watch for "Recorded resolution."
3. Undo the merge with `git reset --hard HEAD~1`.
4. Merge again. Git prints "Resolved site.conf using previous resolution." Check the file, `git add` it and commit.
5. End with exactly one merge commit on main.

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
