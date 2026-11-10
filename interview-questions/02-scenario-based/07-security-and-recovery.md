<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Security & Recovery Scenarios

Questions 301–350 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q301. A developer pushed an AWS access key to a public GitHub repo 10 minutes ago. What exactly do you do?**

<details>
<summary>Show answer</summary>

Deactivate and rotate the key in AWS immediately, check CloudTrail for misuse, and remove unauthorized resources. Then purge the key from history with `git filter-repo --replace-text`, force-push all refs, contact GitHub support to purge cached views, and add push protection plus gitleaks.

</details>

**Q302. A secret was committed locally but not pushed. How do you remove it?**

<details>
<summary>Show answer</summary>

If it's in the last commit: remove it, `git add`, `git commit --amend`. If it's deeper: `git rebase -i` and edit that commit. Since nothing was pushed, no rotation is strictly needed, but move the secret to a secrets manager.

</details>

**Q303. A secret is in a commit that's only in an open PR branch. Is deleting the branch enough?**

<details>
<summary>Show answer</summary>

No. The platform keeps PR refs (`refs/pull/N/head`) and caches, and anyone may have fetched it. Rotate the secret, then rewrite the branch and ask the platform to remove cached refs.

</details>

**Q304. You need to verify no secrets exist anywhere in your repo's history. How?**

<details>
<summary>Show answer</summary>

Run a history scanner: `gitleaks detect --source . --log-opts="--all"` or `trufflehog git file://. --since-commit ...`. Also enable platform secret scanning.

</details>

**Q305. Someone made commits pretending to be the CTO by setting user.email. How do you prevent it?**

<details>
<summary>Show answer</summary>

Require signed commits on protected branches and have developers register signing keys. Then commits without a valid signature from the claimed identity show as unverified and are blocked.

</details>

**Q306. Your signed commits show "Unverified" on GitHub. Why?**

<details>
<summary>Show answer</summary>

The signing key isn't uploaded to your account as a signing key, the commit email doesn't match a verified email on the account, or the key expired. Fix the account settings or Git config.

</details>

**Q307. Your organization wants to enforce signed commits but uses squash merges. Will platform merges fail?**

<details>
<summary>Show answer</summary>

No. GitHub and GitLab sign the commits they create during merges with their own key, so they show as verified. Developer commits on branches still need signing if the rules apply to those branches.

</details>

**Q308. A former employee still has write access to repositories. How do you handle offboarding properly?**

<details>
<summary>Show answer</summary>

Remove them from the org via SSO deprovisioning, revoke their PATs and SSH keys (org credential management), rotate shared secrets they knew, and review audit logs for recent activity.

</details>

**Q309. A personal access token with full repo scope leaked in a CI log. What do you do?**

<details>
<summary>Show answer</summary>

Revoke the token immediately, check audit logs for misuse, replace it with a fine-grained or app token with minimal scope and expiry, and mask secrets in CI logs.

</details>

**Q310. A fork PR could steal secrets from your CI. How do you prevent it?**

<details>
<summary>Show answer</summary>

Don't expose secrets to workflows triggered by forks, avoid running PR code with `pull_request_target`, require approval for first-time contributors, and use minimal `permissions:`.

</details>

**Q311. Your workflow uses `uses: some-org/action@v2`. Security asks for hardening. What do you change?**

<details>
<summary>Show answer</summary>

Pin to a full commit SHA (`@<40-char-sha> # v2.1.0`), let Dependabot or Renovate propose updates, and restrict allowed actions at the org level.

</details>

**Q312. You suspect a malicious commit was merged. How do you investigate in Git?**

<details>
<summary>Show answer</summary>

`git log --show-signature`, `git log -p <range>`, check the PR, approvals and author on the platform, check the audit log for pushes and force pushes, and diff against known-good tags.

</details>

**Q313. You need to ensure that only CI can create release tags. How?**

<details>
<summary>Show answer</summary>

Protected tags or tag rulesets for `v*`, restricted to a bot or release role. Optionally require signed tags and verify them in the release pipeline.

</details>

**Q314. Git says "detected dubious ownership" in your Docker build. Fix securely?**

<details>
<summary>Show answer</summary>

Add only that specific path: `git config --global --add safe.directory /app`. Better, run the container as the same user that owns the files. Avoid `safe.directory '*'` on shared machines.

</details>

**Q315. Security wants to know who approved and merged a production change last month. Where do you look?**

<details>
<summary>Show answer</summary>

The merged PR (approvals, reviewers, merge actor), the commit's metadata, the deployment record (environment approvals) and the platform audit log. Git alone doesn't record approvals.

</details>

**Q316. Someone force-pushed main and erased three commits. Nobody has a local copy with those commits. How do you recover?**

<details>
<summary>Show answer</summary>

Find the pre-push SHA in the platform's activity or events (GitHub's activity view or Events API, GitLab push events), or in CI logs that checked out that SHA. Fetch it if still available (platforms keep unreachable objects for a while) and restore with a PR or force-push, then enable force-push protection.

</details>

**Q317. Your teammate ran `git push --force` on a shared feature branch and your commits vanished. Recovery?**

<details>
<summary>Show answer</summary>

Your local branch still has your commits. Fetch, then rebase or cherry-pick your commits onto the new remote tip, and push normally. Agree to use `--force-with-lease` in future.

</details>

**Q318. You ran `git reset --hard` with uncommitted, unstaged work. Can you recover it?**

<details>
<summary>Show answer</summary>

Not from Git, because those changes were never stored. Check editor local history (VS Code Timeline, JetBrains Local History) or OS backups. If you had ever staged them, `git fsck --lost-found` may find the blobs.

</details>

**Q319. You deleted a branch that was never pushed, three weeks ago. Recoverable?**

<details>
<summary>Show answer</summary>

Likely yes, within the reflog window (90 days for HEAD reflog entries). Search `git reflog` or `git log -g --grep` for its commits, then `git branch name <sha>`.

</details>

**Q320. The reflog doesn't show your lost commit. What next?**

<details>
<summary>Show answer</summary>

`git fsck --lost-found` or `git fsck --unreachable | grep commit`, then inspect candidates with `git show`. This works if GC hasn't pruned them yet.

</details>

**Q321. A rebase went wrong and you already ran `git gc --prune=now`. Is your old work gone?**

<details>
<summary>Show answer</summary>

Likely, for unreachable objects, unless reflog entries still reference them (gc keeps reflog-reachable objects). Check `git reflog` first; otherwise look for other clones, the remote or backups.

</details>

**Q322. Your repository got corrupted after a disk-full error. Steps?**

<details>
<summary>Show answer</summary>

Back up the folder, run `git fsck --full`, remove empty or corrupt object files, then fetch from the remote or copy packfiles from a healthy clone. Preserve unpushed commits, and re-clone if repair fails.

</details>

**Q323. A teammate's clone shows "error: object file is empty" for several objects. Why might this happen?**

<details>
<summary>Show answer</summary>

A crash or power loss during writes, a full disk, or a sync tool (Dropbox, OneDrive) modifying `.git`. Repair from a healthy remote and move the repo out of synced folders.

</details>

**Q324. Your GitHub organization was compromised and repos were deleted. What's your recovery plan?**

<details>
<summary>Show answer</summary>

Secure accounts (reset credentials, enforce SSO and MFA), restore repos from platform restore options or mirror backups (`git push --mirror`), restore issues and settings from exports, and audit what changed.

</details>

**Q325. How do you make sure secrets in Kubernetes manifests aren't stored in plain text in Git?**

<details>
<summary>Show answer</summary>

Use Sealed Secrets, SOPS-encrypted files or External Secrets Operator referencing a secrets manager. Never commit plain `Secret` manifests.

</details>

**Q326. A developer says "I'll just delete the secret in a new commit." Why is that insufficient?**

<details>
<summary>Show answer</summary>

The secret remains in history and in every clone and fork. Anyone can find it with `git log -p`. Rotation is required, and purging history reduces further exposure.

</details>

**Q327. You need to share encrypted credentials in a repo for a small team without a vault. Options?**

<details>
<summary>Show answer</summary>

SOPS with age or KMS keys, or git-crypt, which encrypts files transparently for authorized keys. Prefer a real secrets manager as the team grows.

</details>

**Q328. How do you detect secrets before they're committed on every developer machine?**

<details>
<summary>Show answer</summary>

A pre-commit hook with gitleaks or detect-secrets, distributed via the pre-commit framework, with the same scan in CI and platform push protection as backups.

</details>

**Q329. An audit requires proof that no one can push directly to production branches. What evidence do you provide?**

<details>
<summary>Show answer</summary>

Branch protection or ruleset configuration (exported or managed as Terraform code), audit logs showing no bypasses, and PR records with approvals for every change.

</details>

**Q330. Your CI bot needs to push version bumps to protected main. How do you allow it securely?**

<details>
<summary>Show answer</summary>

Use a GitHub App or dedicated bot identity with minimal scope, add it as a bypass actor in rulesets only for that action, or have it open PRs that auto-merge after checks.

</details>

**Q331. How do you prevent CI pipelines from being modified to exfiltrate secrets in a PR?**

<details>
<summary>Show answer</summary>

Require CODEOWNERS approval for CI files, don't run untrusted PR pipelines with secrets, use environment-scoped secrets with required reviewers, and audit workflow changes.

</details>

**Q332. You received a vulnerability report about Git itself (e.g. a submodule path traversal CVE). What do you do?**

<details>
<summary>Show answer</summary>

Update Git on developer machines, CI runners and servers. Until then, avoid cloning untrusted repos with `--recurse-submodules` and check for vendor advisories.

</details>

**Q333. A repository you clone from the internet has a `.githooks` folder and a setup script. Is cloning dangerous?**

<details>
<summary>Show answer</summary>

Cloning itself doesn't run hooks. Running the setup script (which might set `core.hooksPath`) or build scripts could execute code. Review before running anything.

</details>

**Q334. You need to rotate a deploy key used by 30 servers. Plan?**

<details>
<summary>Show answer</summary>

Add the new key alongside the old one (or a new deploy key per server), roll it out to servers via config management, verify access, then remove the old key. Consider per-environment keys for smaller blast radius.

</details>

**Q335. Someone committed a customer's personal data (PII) to the repo. What do you do?**

<details>
<summary>Show answer</summary>

Treat it as a data incident: notify security and privacy teams per policy, purge from history with filter-repo, force-push, request platform cache purge, delete forks and clones, and document it for compliance.

</details>

**Q336. How do you lock down who can change branch protection settings?**

<details>
<summary>Show answer</summary>

Limit admin roles, manage protections as code (Terraform) with PR review, alert on audit-log events for protection changes, and use org-level rulesets that repo admins can't override.

</details>

**Q337. A developer complains that signed-commit enforcement breaks their rebase workflow. How do you help?**

<details>
<summary>Show answer</summary>

Configure `commit.gpgsign true` so rebased commits are re-signed automatically, use SSH signing for simplicity, and cache the passphrase with ssh-agent or gpg-agent.

</details>

**Q338. You need to verify a release tag before deploying it. How?**

<details>
<summary>Show answer</summary>

`git verify-tag v3.2.0` against trusted keys (allowed signers or keyring), plus checking that the tag points to a commit on the protected branch, and fail the pipeline if either check fails.

</details>

**Q339. Your company wants keyless commit signing to avoid managing GPG keys. Option?**

<details>
<summary>Show answer</summary>

Sigstore gitsign: commits are signed with short-lived certificates tied to the developer's OIDC identity and recorded in a transparency log. Verify with gitsign tooling in CI.

</details>

**Q340. You accidentally pushed a private repository's content to a public fork. What now?**

<details>
<summary>Show answer</summary>

Make the fork private or delete it immediately, assess what was exposed, rotate any secrets, contact platform support to purge caches, and follow your incident process.

</details>

**Q341. How do you recover a file overwritten by a bad merge last week?**

<details>
<summary>Show answer</summary>

Find the last good version: `git log -p -- file` or `git log --all -- file`, then `git restore --source=<good-sha> file` and commit with an explanation.

</details>

**Q342. You notice someone rewrote history on main (force push). How do you assess the damage?**

<details>
<summary>Show answer</summary>

Compare old and new tips: `git range-diff old..new` or `git log --oneline new..old` for commits lost from main. Check the platform audit log for who did it, restore missing commits, then lock down force pushes.

</details>

**Q343. Your remote server disk failed and the bare repos are gone. Developers have clones. How do you rebuild?**

<details>
<summary>Show answer</summary>

Create new bare repos and push from the most complete clone (`git push --mirror` from a mirror clone, or push all branches and tags). Ask others to push any branches missing from that clone, and reconfigure hooks and permissions.

</details>

**Q344. How do you make backups of Git repos consistent while people are pushing?**

<details>
<summary>Show answer</summary>

Use `git clone --mirror` or `git bundle create --all` from the server (both produce consistent snapshots of refs at a point in time), or platform-native backup tools, not raw filesystem copies of live repos.

</details>

**Q345. You need to scan all repos in the org for a specific leaked token string. How?**

<details>
<summary>Show answer</summary>

Use the platform's secret scanning or code search, or script `git clone --mirror` of all repos with `git log --all -S "<token>"` or gitleaks over each. Rotate the token regardless.

</details>

**Q346. A teammate's laptop with SSH keys was stolen. What Git-related actions do you take?**

<details>
<summary>Show answer</summary>

Revoke their SSH keys and tokens on the platform, rotate any secrets stored in local clones (like `.env` files), check audit logs for pushes since the theft, and issue new keys after re-provisioning.

</details>

**Q347. How do you make sure deleted branches with sensitive code can't be recovered from the platform?**

<details>
<summary>Show answer</summary>

Deleting a branch isn't enough, because objects may persist in PR refs and caches. Rewrite history if needed and ask platform support to run garbage collection and remove cached refs.

</details>

**Q348. What would you put in a "Git incident runbook" for your team?**

<details>
<summary>Show answer</summary>

Steps for leaked secrets (rotate first), force-push recovery, accidental deletions, corruption repair, compromised accounts and tokens, contacts for platform support, and post-incident prevention (protections, scanning, backups).

</details>

**Q349. You find a `.env` with production database credentials in a repo from three years ago. The file was removed long ago. What do you do?**

<details>
<summary>Show answer</summary>

Assume the credentials are compromised: rotate them now and check database access logs. Then purge the file from history with filter-repo (coordinated force-push and re-clone), and add `.env` to `.gitignore` plus secret scanning so it can't recur.

</details>

**Q350. Your team accidentally ran `git clean -fdx` and deleted local untracked config files needed for development. How do you prevent it from hurting again?**

<details>
<summary>Show answer</summary>

Keep templates like `config/.env.example` in Git and document regeneration. Store real local secrets in a secrets manager or password vault, and use `git clean -n` (dry run) habitually or alias clean to require `-i` (interactive).

</details>

---

← [Back to Scenario-Based Questions](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
