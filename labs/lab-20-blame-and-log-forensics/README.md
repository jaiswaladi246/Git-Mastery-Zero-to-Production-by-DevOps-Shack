<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 20 · Blame and Log Forensics

**Level:** Intermediate · 25 min · **Module:** [14 · Investigating History](../../modules/14-history-investigation.md)

## Scenario

An auditor and your tech lead have questions about the billing service's history. Answer them using only Git.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

Create `answers.txt` with lines exactly like `Q1: answer`:

1. **Q1** · Who changed `MAX_RETRIES` to `5`? Give the author name. (`git blame`)
2. **Q2** · The short hash of the commit that **removed** the hardcoded `API_KEY`. (`git log -S`)
3. **Q3** · What was `services/billing.py` called originally? Give the full path. (`git log --follow`)
4. **Q4** · How many commits did Priya Sharma make? (`git shortlog -sn HEAD`. Without a revision, shortlog reads from stdin when not in a terminal)

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
