<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 14 · Trunk-Based Development with Feature Flags

**Level:** Intermediate · **Time:** 30 minutes · **Strategy guide:** [Trunk-Based Development](../../branching-strategies/04-trunk-based-development.md)

## Scenario

You're replacing the legacy checkout with a new one. In trunk-based development, you don't keep a long feature branch. You ship small changes to `main` continuously and hide unfinished work behind a flag.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

Do this as **three separate commits on main**, with linear history and no merge commits:

1. **Ship dark.** Using a short-lived branch merged with `--ff-only` (then deleted), or a direct commit, add `new_checkout()` and a flag `"new_checkout": false` in `flags.json`. `checkout()` should call the new function only when the flag is true.
2. **Release.** Flip the flag to `true` in its own commit. In real life this is often done in a flag service, without any deploy at all.
3. **Clean up.** Remove the flag from `flags.json`, delete `legacy_checkout`, and make `checkout()` simply `return new_checkout(cart)`.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Solution</b></summary>

See [`solution.sh`](solution.sh).

</details>

## Reflect

Step 3 is the one teams forget. Every flag left behind is a hidden code path nobody tests. Put an expiry date on every flag.


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
