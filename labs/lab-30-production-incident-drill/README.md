<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 30 · Production Incident Drill (Capstone)

**Level:** Advanced · 45 min · **Module:** [21 · Troubleshooting & Disaster Recovery](../../modules/21-troubleshooting-and-recovery.md)

## Scenario

It's 2 AM and three things are wrong at once. This drill combines remotes, force-push recovery, revert and secret hygiene. Do it without looking anything up and you're production-ready.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

Work inside `playground/you`.

1. **Restore main on the server.** Someone force-pushed it back three commits. Your local `main` still has them. Restore the server safely with `--force-with-lease`.
2. **Revert** `feat: enable debug mode in prod` on main and push. History is shared, so don't reset.
3. **Clean the secret.** Your unpushed `feature/payment-gateway` has a hardcoded key. Change it to read from the environment, *amend* so the key never reaches the server, rebase onto main, and push the branch. (In real life: rotate the key first.)
4. Write a three-line incident summary for yourself: what happened, how you fixed it, and how to prevent it (branch protection blocking force pushes, push protection for secrets).

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
