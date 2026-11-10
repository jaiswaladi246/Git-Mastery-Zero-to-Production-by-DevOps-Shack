<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 25 · Migrating Big Binaries to Git LFS

**Level:** Advanced · 25 min · **Module:** [20 · Large Files & Performance](../../modules/20-large-files-and-performance.md)

## Scenario

A designer committed a demo video, then re-encoded it. Every clone now downloads every version forever. Move all `*.bin` files, across all history, into Git LFS.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Measure: `git count-objects -vH` and `git lfs migrate info --everything`.
2. Install LFS hooks for this repo: `git lfs install --local`.
3. Rewrite history so every `*.bin` becomes an LFS pointer: `git lfs migrate import --include="*.bin" --everything`.
4. Check `git cat-file -p HEAD:assets/demo.bin`. You should see a pointer, not binary noise.
5. On a real remote, you'd then force-push every branch and tag, and have the team re-clone.

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
