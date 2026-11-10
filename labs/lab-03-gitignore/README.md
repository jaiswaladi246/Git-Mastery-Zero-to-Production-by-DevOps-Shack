<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 03 · .gitignore Deep Dive

**Level:** Beginner · **Time:** 25 minutes · **Module:** [03 · The Core Workflow](../../modules/03-core-workflow.md)

## Scenario

A teammate committed `.env` (with a password) and never created a `.gitignore`. Now `git status` is full of `node_modules`, build output, logs and macOS junk.

## Setup

```bash
bash setup.sh && cd playground
git status
```

## Tasks

1. Create a `.gitignore` that ignores `node_modules/`, `dist/`, `logs/` (and any `*.log`), `.DS_Store` and `.env`.
2. Make sure `config/.env.example` stays tracked. It's the template new developers copy.
3. Stop tracking `.env` **without deleting it from disk**.
4. Commit the result. `git status` must be completely clean.
5. Use `git check-ignore -v logs/app.log` to see which rule matched.
6. Think about it: `.env` is still in the history of the earlier commit. What would you do in a real company? (Answer: rotate the password, then see [Lab 21](../lab-21-remove-secrets/README.md).)

## Verify

```bash
bash ../verify.sh
```

<details>
<summary><b>Hints</b></summary>

- `.gitignore` never untracks files that are already committed. You need `git rm --cached`.
- A `!pattern` line re-includes a file excluded by an earlier rule.

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
