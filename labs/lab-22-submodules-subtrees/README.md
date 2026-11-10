<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 22 · Submodules and Subtrees

**Level:** Advanced · 35 min · **Module:** [16 · Submodules, Subtrees & Monorepos](../../modules/16-submodules-subtrees-monorepos.md)

## Scenario

Your app needs code from a shared library repo. You'll try both ways of embedding it and feel the difference.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Add `../shared-lib.git` as a **submodule** at `libs/shared`, and commit. Local file URLs need `git -c protocol.file.allow=always submodule add ...` (a security default since Git 2.38.1).
2. Run `bash ../bump-upstream.sh` to simulate the library team pushing v2.
3. Update the submodule to the latest upstream commit and commit the new pointer. Inspect it with `git ls-tree HEAD libs/shared`: it's a commit hash (mode 160000), not files.
4. Add the same library as a **subtree** at `vendor/shared` with `--squash`.
5. Compare: clone the playground somewhere else. Which folder is empty until you run `git submodule update --init`?

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
