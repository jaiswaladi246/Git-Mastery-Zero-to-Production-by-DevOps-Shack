<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 19 · Hunting a Regression with git bisect

**Level:** Intermediate · **Time:** 25 minutes · **Module:** [14 · Investigating History](../../modules/14-history-investigation.md)

## Scenario

`./test.sh` passed at tag `v1.0`. It fails on `main` today. There are 100 commits in between, all named "refactor: tweak #N." The messages won't help you, so binary search will.

Every time you run `setup.sh`, the bug lands on a different random commit, so you can repeat this lab.

## Setup

```bash
bash setup.sh && cd playground
./test.sh; echo "exit code: $?"     # fails on HEAD
```

## Tasks

1. Start a bisect session with `HEAD` as bad and `v1.0` as good.
2. First do a few steps **manually**: run `./test.sh`, then mark `git bisect good` or `git bisect bad`.
3. Then automate the rest with `git bisect run ./test.sh`.
4. Write the full hash of the first bad commit into `BAD_COMMIT.txt` in the playground.
5. End the session with `git bisect reset`.

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- 100 commits need at most 7 tests (2⁷ = 128).
- After `bisect run`, the answer is in `refs/bisect/bad` until you reset.
- `git bisect log` shows your session.

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
