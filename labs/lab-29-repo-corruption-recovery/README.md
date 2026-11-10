<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 29 · Repository Corruption Recovery

**Level:** Advanced · 30 min · **Module:** [21 · Troubleshooting & Disaster Recovery](../../modules/21-troubleshooting-and-recovery.md)

## Scenario

Your laptop ran out of disk mid-write. Now Git complains that an object file is empty. You also have one unpushed commit that you must not lose.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. **Back up the folder first** (`cp -r playground playground-backup`).
2. Diagnose with `git fsck --full`. Which object is broken, and which file does it belong to?
3. Remove the empty object file(s): `find .git/objects -type f -empty -delete`.
4. Restore the missing objects from a healthy copy. Mirror-clone `../server.git` to a temp folder with `--no-local` (so Git builds a packfile instead of hard-linking loose objects) and copy its packfiles into `.git/objects/pack/`.
5. Confirm `git fsck --full` is clean and your unpushed commit survived.
6. Lesson: never keep repos in Dropbox/OneDrive sync folders, and push often.

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
