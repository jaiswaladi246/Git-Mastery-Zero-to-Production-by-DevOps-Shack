<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 24 · Signed Commits and Tags

**Level:** Intermediate · 25 min · **Module:** [19 · Security](../../modules/19-security.md)

## Scenario

Your company is turning on "Require signed commits" for main. Set up SSH-based signing (Git 2.34+), sign a commit and a release tag, and verify both locally.

## Setup

```bash
bash setup.sh && cd playground
```

## Tasks

1. Generate a lab key: `ssh-keygen -t ed25519 -N "" -f ../lab_signing_key`
2. Configure the playground repo: `gpg.format ssh`, `user.signingkey ../lab_signing_key.pub` (use the absolute path).
3. Create an allowed-signers file (`<email> <public key>`) and set `gpg.ssh.allowedSignersFile`.
4. Make a new commit signed with `-S`, then create a signed tag `v1.0.0` with `git tag -s`.
5. Verify with `git verify-commit HEAD`, `git verify-tag v1.0.0` and `git log --show-signature`.
6. On a real account, you'd upload the public key to GitHub or GitLab as a **signing key** so commits show "Verified."

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
