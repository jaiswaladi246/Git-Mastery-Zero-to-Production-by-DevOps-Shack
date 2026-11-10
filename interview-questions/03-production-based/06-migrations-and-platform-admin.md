<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Migrations & Platform Administration

Questions 251–300 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q251. How would you migrate 300 repositories from Bitbucket Server to GitHub Enterprise?**

<details>
<summary>Show answer</summary>

Inventory repos, sizes, LFS, permissions and CI. Pilot a few repos with GitHub Enterprise Importer or mirror plus importers. Map users and teams, convert pipelines, recreate protections via Terraform, migrate in waves with a freeze window per wave, then archive the source repos read-only.

</details>

**Q252. What data doesn't move with `git clone --mirror` during a platform migration?**

<details>
<summary>Show answer</summary>

Pull requests and review comments, issues, wikis (separate repos), CI configuration in the platform UI, secrets, webhooks, branch protections, permissions and LFS objects (need `git lfs fetch --all` and push).

</details>

**Q253. How do you migrate Git LFS objects between platforms?**

<details>
<summary>Show answer</summary>

In a mirror clone, `git lfs fetch --all` to download all LFS objects, change the remote, then `git lfs push --all origin` along with `git push --mirror`.

</details>

**Q254. How do you migrate from SVN to Git with history?**

<details>
<summary>Show answer</summary>

Use `git svn clone --stdlayout --authors-file=authors.txt <svn-url>` (or SubGit or svn2git for large repos), convert SVN tags (which are branches) into Git tags, clean up branches, verify history, then push to the new remote and freeze SVN.

</details>

**Q255. What's the authors file in SVN migrations?**

<details>
<summary>Show answer</summary>

A mapping from SVN usernames to Git identities (`svnuser = Full Name <email>`), so commits get proper author names and emails that match platform accounts.

</details>

**Q256. How do you migrate from Perforce to Git?**

<details>
<summary>Show answer</summary>

`git p4` or commercial tools (Perforce Helix Git Connector, Git Fusion), often with a branch and depot mapping strategy. Large binary assets move to LFS, and history may be truncated to keep repos manageable.

</details>

**Q257. How do you minimize downtime during a Git platform migration?**

<details>
<summary>Show answer</summary>

Mirror continuously from source to target during preparation, migrate PR and issue data near cutover, freeze writes briefly for the final sync, switch CI and webhooks, and communicate the remote URL change with redirects or scripts.

</details>

**Q258. How do you update thousands of developer clones to a new remote URL?**

<details>
<summary>Show answer</summary>

Communicate `git remote set-url origin <new>`, provide a script that rewrites remotes matching the old host, or use URL rewriting (`url.<new>.insteadOf <old>`) distributed via system gitconfig.

</details>

**Q259. How do you migrate CI pipelines from GitLab CI to GitHub Actions?**

<details>
<summary>Show answer</summary>

Map stages and jobs to workflows and jobs, `rules` to `on`/`if`, variables to secrets and vars, runners to self-hosted or hosted runners, and artifacts and caches to actions. GitHub Actions Importer can automate a first pass. Run both in parallel until parity.

</details>

**Q260. How do you run self-hosted GitLab with high availability?**

<details>
<summary>Show answer</summary>

Multiple Rails nodes behind a load balancer, PostgreSQL with replication (Patroni), Redis HA, Gitaly Cluster (Praefect) for replicated Git storage, object storage for artifacts and LFS, plus Geo for DR across regions.

</details>

**Q261. What is Gitaly?**

<details>
<summary>Show answer</summary>

GitLab's service that handles all Git operations and storage via RPC. Gitaly Cluster (with Praefect) replicates repositories across nodes for fault tolerance.

</details>

**Q262. How do you back up a self-hosted GitLab instance?**

<details>
<summary>Show answer</summary>

The `gitlab-backup create` (or `backup-utility` on Kubernetes) for repositories, database and uploads, plus separate backup of config and secrets files (`gitlab.rb`, `gitlab-secrets.json`). Store off-site and test restores.

</details>

**Q263. Why must `gitlab-secrets.json` be backed up separately?**

<details>
<summary>Show answer</summary>

It contains encryption keys for CI variables, 2FA secrets and other encrypted data. Without it, restored databases can't decrypt those values.

</details>

**Q264. How do you upgrade a self-hosted Git platform safely?**

<details>
<summary>Show answer</summary>

Follow the vendor's upgrade path (required stops between versions), back up first, test in staging, check background migrations, schedule a maintenance window, and keep up with security releases.

</details>

**Q265. How do you handle Git server hooks on self-hosted GitLab?**

<details>
<summary>Show answer</summary>

Place server hooks per repository or globally via Gitaly config (`custom_hooks`), written as executables for `pre-receive`, `update` or `post-receive`. Prefer built-in push rules where possible.

</details>

**Q266. How would you enforce a commit message format on a self-hosted Git server without platform features?**

<details>
<summary>Show answer</summary>

A `pre-receive` or `update` hook that inspects each new commit (`git rev-list old..new`) and rejects pushes with non-compliant messages, printing guidance.

</details>

**Q267. How do you scale CI runners for a busy Git platform?**

<details>
<summary>Show answer</summary>

Autoscaling runners (Kubernetes executors, GitHub Actions Runner Controller, GitLab runner autoscaling on cloud VMs), separate runner pools by trust level and workload, and caching close to runners.

</details>

**Q268. What's Actions Runner Controller (ARC)?**

<details>
<summary>Show answer</summary>

A Kubernetes operator that autoscales self-hosted GitHub Actions runners as pods based on job demand, often using ephemeral runners per job.

</details>

**Q269. How do you administer GitHub organizations as code?**

<details>
<summary>Show answer</summary>

The Terraform GitHub provider for repos, teams, memberships, branch protections, rulesets and secrets, plus scheduled drift detection and PR-based changes to org settings.

</details>

**Q270. How do you manage team permissions in GitHub at scale?**

<details>
<summary>Show answer</summary>

Use SSO-synced teams (team sync or SCIM groups), nested teams, repository roles (read, triage, write, maintain, admin, or custom), and grant access to teams instead of individuals.

</details>

**Q271. What repository roles does GitLab have, and what can each do?**

<details>
<summary>Show answer</summary>

Guest (view issues), Reporter (read code), Developer (push to non-protected branches, create MRs), Maintainer (manage protected branches, settings, merge), and Owner (full control including deletion and visibility).

</details>

**Q272. How do you migrate repository settings (protections, webhooks) consistently?**

<details>
<summary>Show answer</summary>

Script via APIs or define them in Terraform for the target platform, apply per wave, and validate with automated checks comparing desired versus actual settings.

</details>

**Q273. How do you rename an organization or group without breaking everything?**

<details>
<summary>Show answer</summary>

Platforms redirect old URLs for a while, but you should update remotes, CI configs, submodule URLs, package registry references, Terraform module sources, GitOps repo URLs and webhooks. Search all repos for the old name.

</details>

**Q274. How do you transfer a repository between organizations?**

<details>
<summary>Show answer</summary>

Use the platform's transfer feature (keeps issues, PRs and stars; redirects URLs), check team permissions, secrets, Actions settings and integrations in the new org, and update references.

</details>

**Q275. How do you handle a mass change across all repos, like adding a SECURITY.md file?**

<details>
<summary>Show answer</summary>

Automate with a script or tool (multi-gitter, GitHub CLI loops, Sourcegraph Batch Changes) that opens PRs in each repo, track merge status, and follow up with owners.

</details>

**Q276. How do you clean up inactive repositories?**

<details>
<summary>Show answer</summary>

Report on repos without commits or activity beyond a threshold, contact owners, archive (read-only) rather than delete, keep mirror backups, and document the archive policy.

</details>

**Q277. What's the difference between archiving and deleting a repository?**

<details>
<summary>Show answer</summary>

Archiving makes it read-only but keeps it visible and searchable. Deleting removes it (with only a short restore window). Archive for compliance and history; delete only when required.

</details>

**Q278. How do you set up repository mirroring from GitLab to GitHub?**

<details>
<summary>Show answer</summary>

GitLab push mirroring with a GitHub token or deploy key (Settings → Repository → Mirroring), which updates the GitHub repo on each push. Or use a scheduled CI job doing `git push --mirror`.

</details>

**Q279. How do you mirror an external open-source repo internally for supply-chain safety?**

<details>
<summary>Show answer</summary>

Pull-mirror it into your internal platform on a schedule, pin builds to internal mirror refs or tags, and review upstream changes before syncing if needed.

</details>

**Q280. How do you manage webhooks across many repos?**

<details>
<summary>Show answer</summary>

Org-level webhooks or GitHub Apps where possible (one integration, many repos), managed via Terraform or app manifests, with secrets for verification and monitoring of delivery failures.

</details>

**Q281. How do you troubleshoot webhook delivery failures from GitHub to Jenkins?**

<details>
<summary>Show answer</summary>

Check recent deliveries in repo or org webhook settings (status codes, responses), verify network reachability and TLS, check the secret, the Jenkins plugin logs and proxy settings, then redeliver.

</details>

**Q282. How do you handle Git authentication for automation in a corporate proxy environment?**

<details>
<summary>Show answer</summary>

Configure `http.proxy` and `https.proxy` (or environment variables), trust the corporate CA (`http.sslCAInfo`), use SSH over port 443 if SSH is blocked (`ssh.github.com:443`), and use app tokens.

</details>

**Q283. What's the role of `http.sslCAInfo` and why not use `http.sslVerify false`?**

<details>
<summary>Show answer</summary>

`sslCAInfo` points Git to a CA bundle that includes your corporate CA, so TLS verification keeps working. Disabling verification exposes credentials and code to man-in-the-middle attacks.

</details>

**Q284. How do you enforce minimum Git versions for security across the company?**

<details>
<summary>Show answer</summary>

Track Git CVEs, update via MDM or package management, check versions in onboarding scripts or pre-commit (`git --version`), and update CI images promptly.

</details>

**Q285. How do you provide a self-service "new repo" workflow?**

<details>
<summary>Show answer</summary>

A template repo plus automation (Backstage software templates, Terraform PR workflow, or an internal portal) that creates the repo with standard settings, CODEOWNERS, CI and protections, and registers it in the service catalog.

</details>

**Q286. How does Backstage relate to Git?**

<details>
<summary>Show answer</summary>

Backstage catalogs services using `catalog-info.yaml` files stored in Git repos, scaffolds new repos via templates, and surfaces repo metadata, CI status and ownership in one portal.

</details>

**Q287. How do you migrate from `master` to `main` across hundreds of repos?**

<details>
<summary>Show answer</summary>

Script the rename via platform APIs (GitHub renames redirect PRs and protections automatically), update CI configs and docs referencing `master`, notify teams, and provide a local update snippet.

</details>

**Q288. How do you manage Git LFS storage costs on a hosted platform?**

<details>
<summary>Show answer</summary>

Monitor usage per repo, prune unnecessary LFS history (requires rewriting), move large datasets to object storage, cache in CI to reduce bandwidth, and set guidelines on what belongs in LFS.

</details>

**Q289. How do you handle a repo size warning from your hosting platform?**

<details>
<summary>Show answer</summary>

Find large objects, move binaries to LFS or artifact storage, purge them from history if necessary (coordinated rewrite), and add size checks to prevent recurrence.

</details>

**Q290. How do you ensure CI system access to repos survives employee turnover?**

<details>
<summary>Show answer</summary>

Use app or bot identities and deploy keys, not personal accounts or tokens, with ownership by a team and secrets stored in a secrets manager.

</details>

**Q291. How do you audit which deploy keys and tokens have access to your repos?**

<details>
<summary>Show answer</summary>

Use platform APIs to list deploy keys, installed apps, PAT authorizations (SSO credential management) and webhooks per repo, and review them regularly, removing unused ones.

</details>

**Q292. How do you set up Git for a regulated air-gapped environment?**

<details>
<summary>Show answer</summary>

A self-hosted Git server inside the network, updates and repos imported via reviewed bundles or one-way transfer, internal mirrors for dependencies, and signed artifacts verified on import.

</details>

**Q293. What's the process to restore a single repository from a GitLab backup?**

<details>
<summary>Show answer</summary>

Restore the backup into a staging instance (full restores are instance-wide), then export the project or push the repo to production. Alternatively, keep per-repo mirror backups for granular restores.

</details>

**Q294. How do you handle legal hold requirements for repositories?**

<details>
<summary>Show answer</summary>

Prevent deletion (archive instead), retain audit logs and platform data exports, preserve mirrors with immutable storage (object lock), and document chain of custody.

</details>

**Q295. How do you integrate Git platform events with chat (Slack/Teams) without noise?**

<details>
<summary>Show answer</summary>

Subscribe to specific events (releases, failed main builds, PRs needing review) per channel, use digest summaries, and route by CODEOWNERS or team.

</details>

**Q296. How do you migrate from Jenkins-based Git polling to event-driven triggers?**

<details>
<summary>Show answer</summary>

Configure platform webhooks to Jenkins (GitHub or GitLab plugins), use multibranch pipelines with webhook-triggered scans, and disable SCM polling once webhooks are reliable.

</details>

**Q297. How do you provide Git training at scale in a company?**

<details>
<summary>Show answer</summary>

Role-based paths (basics for everyone, advanced for leads and platform engineers), hands-on labs with broken scenarios (like this repository's labs), a recovery cheat sheet, and office hours.

</details>

**Q298. What's your checklist after migrating a repository to a new platform?**

<details>
<summary>Show answer</summary>

Verify branches and tags count, LFS objects, CI runs green, protections and CODEOWNERS active, webhooks and integrations working, permissions correct, docs and badges updated, and the old repo archived with a pointer.

</details>

**Q299. How do you validate that a migrated repository's history is identical to the source?**

<details>
<summary>Show answer</summary>

Compare all refs and their SHAs (`git for-each-ref` output on both sides, or `git ls-remote` of source and target), run `git fsck` on the target, and verify LFS object counts with `git lfs ls-files --all`.

</details>

**Q300. How do you migrate GitHub Actions secrets and variables to a new organization?**

<details>
<summary>Show answer</summary>

Secret values can't be read back via the API, so re-create them from your secrets manager (the source of truth) with Terraform or the CLI, use OIDC where possible to eliminate static secrets, and verify by running pipelines.

</details>

---

← [Back to Production-Based Questions](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
