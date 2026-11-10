<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 21 · Remove a Secret from History

**Level:** Advanced · 30 min · **Module:** [15 · Rewriting History](../../modules/15-rewriting-history.md)

## Scenario

An AWS access key was committed in `config.py`. A later commit "removed" it by reading from an environment variable, but the key still sits in history, and anyone with a clone can see it.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

Step 0 in real life is **rotate the key in AWS immediately**. Then:

1. Prove the leak: `git log -p --all | grep AKIA` and `git log -S AKIA --oneline`.
2. Install filter-repo if needed: `pip install git-filter-repo`.
3. Replace every `AKIA` key in all history with `***REMOVED***`, using `git filter-repo --replace-text` (use `--force`, since this isn't a fresh clone).
4. Confirm the commit count is unchanged and that every hash after the leak changed.
5. Write down what you'd do next on a real remote: force-push all branches and tags, ask the platform to purge cached refs, have everyone re-clone, and add gitleaks to pre-commit.

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
