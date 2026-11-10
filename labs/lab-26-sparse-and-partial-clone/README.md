<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 26 · Sparse Checkout + Partial Clone

**Level:** Advanced · 20 min · **Module:** [20 · Large Files & Performance](../../modules/20-large-files-and-performance.md)

## Scenario

You joined the payments team in a big monorepo. You only need `services/payments` and `libs/shared`, not the whole repository.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Clone `file://<playground>/monorepo.git` into `dev-clone` as a **partial clone** (`--filter=blob:none`) with `--sparse`. The `file://` prefix matters: plain local paths skip the filter.
2. Use `git sparse-checkout set` so only `services/payments` and `libs/shared` appear on disk.
3. Compare `du -sh dev-clone/.git` with `du -sh monorepo.git`.
4. Try `git sparse-checkout add services/orders`, look, then remove it again with `set`.

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
