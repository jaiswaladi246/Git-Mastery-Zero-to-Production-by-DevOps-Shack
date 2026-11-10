<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 15 · Tags and Releases

**Level:** Intermediate · **Time:** 30 minutes · **Module:** [12 · Tags & Releases](../../modules/12-tags-and-releases.md)

## Scenario

You're the release manager. The last release was `v1.2.0`. Someone created a lightweight tag `v1.3.0-rc` on the wrong commit. Your job is to cut the next release properly.

## Setup

```bash
bash setup.sh && cd playground
git log --oneline --decorate
```

## Tasks

1. Delete the wrong tag `v1.3.0-rc`.
2. Look at the Conventional Commits since `v1.2.0` and decide the next SemVer version. (Hint: there's a `feat` and no breaking change.)
3. Generate `CHANGELOG.md` from the history between `v1.2.0` and `HEAD`, with Features and Fixes sections.
4. Update `VERSION` to the new version, and commit both files as `chore(release): <version>`.
5. Create an **annotated** tag `v1.3.0` on that commit.
6. Run `git describe` to confirm.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `git log --format='- %s (%h)' v1.2.0..HEAD --grep='^feat'`
- In a real repo you'd also run `git push origin v1.3.0` (tags aren't pushed by default) and `git push origin --delete v1.3.0-rc` if the bad tag had been pushed.

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
