<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Security, Compliance & Governance

Questions 151–200 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q151. What Git controls would you implement for SOC 2 change management?**

<details>
<summary>Show answer</summary>

Protected main with required PRs and independent approvals, required CI and security checks, CODEOWNERS for sensitive areas, no force pushes or deletions, signed commits where feasible, audit-log retention, and traceability from ticket to commit to deployment.

</details>

**Q152. How do you enforce separation of duties in Git?**

<details>
<summary>Show answer</summary>

Require approval from someone other than the author (platforms don't count self-approval), dismiss stale approvals on new pushes, require CODEOWNERS for critical paths, and include admins in protection rules.

</details>

**Q153. An auditor asks for evidence that every production change was reviewed. How do you produce it at scale?**

<details>
<summary>Show answer</summary>

Export merged PRs with reviewers and approvals via the platform API for the period, join them with deployment records (SHAs per release), and show protection settings managed as code with their change history.

</details>

**Q154. How do you manage branch protection across 500 repositories?**

<details>
<summary>Show answer</summary>

Org-level rulesets (GitHub) or group-level push rules and protected branch defaults (GitLab), plus the Terraform GitHub/GitLab providers for repo-specific settings, with drift detection.

</details>

**Q155. What's the difference between GitHub branch protection rules and rulesets?**

<details>
<summary>Show answer</summary>

Classic protection rules apply per repo and branch pattern. Rulesets can be defined at the org level across many repos, target branches and tags, layer together, support bypass lists, and can run in evaluate mode before enforcing.

</details>

**Q156. How do you secure developer authentication to Git platforms?**

<details>
<summary>Show answer</summary>

SSO with enforced MFA, SSH keys or certificates with expiry (SSH CAs), fine-grained short-lived tokens, IP allow lists where needed, and automatic deprovisioning via SCIM.

</details>

**Q157. Why use a GitHub App instead of a personal access token for automation?**

<details>
<summary>Show answer</summary>

Apps have fine-grained, repo-scoped permissions, short-lived installation tokens, aren't tied to a person's account (survive offboarding), and their actions are clearly attributed in audit logs.

</details>

**Q158. How do you protect against malicious code in third-party GitHub Actions?**

<details>
<summary>Show answer</summary>

Allow-list approved actions at the org level, pin to full SHAs, review action code, use Dependabot for updates, restrict `GITHUB_TOKEN` permissions, and monitor advisories.

</details>

**Q159. How would you implement secret prevention organization-wide?**

<details>
<summary>Show answer</summary>

Enable platform secret scanning and push protection for all repos, provide a standard pre-commit config with gitleaks, scan history in CI, define a rotation runbook, and provide a secrets manager so developers don't need secrets in code.

</details>

**Q160. How do you handle a request to make a private repo public?**

<details>
<summary>Show answer</summary>

Review the full history for secrets, PII and internal references (gitleaks, manual review). If anything is found, publish a fresh repo with rewritten or squashed history rather than flipping visibility, and get legal and security approval.

</details>

**Q161. How do you ensure only signed commits reach main?**

<details>
<summary>Show answer</summary>

Rulesets or protection requiring signed commits, developer onboarding for SSH, GPG or gitsign signing, and CI verification for critical repos. Platform-generated merge commits are signed by the platform.

</details>

**Q162. How do you verify the integrity of what you deploy back to Git?**

<details>
<summary>Show answer</summary>

Sign tags or commits, build in CI from verified refs, generate provenance attestations (SLSA, GitHub artifact attestations) linking artifacts to commit and workflow, and verify at deploy or admission time.

</details>

**Q163. What is SLSA, and how does Git relate?**

<details>
<summary>Show answer</summary>

Supply-chain Levels for Software Artifacts is a framework for build integrity. Source requirements include version control with verified history, two-person review and retention, which Git platforms with protections satisfy.

</details>

**Q164. How do you limit who can create or delete repositories?**

<details>
<summary>Show answer</summary>

Restrict repo creation to admins or specific teams, require creation through templates or Terraform, and restrict deletion and visibility changes to org owners, with audit alerts.

</details>

**Q165. How do you stream Git platform audit logs for security monitoring?**

<details>
<summary>Show answer</summary>

Use GitHub Enterprise audit log streaming (to Splunk, Datadog, S3, Azure Event Hubs) or GitLab audit event streaming, and alert on force pushes, protection changes, new deploy keys, token creation and repo visibility changes.

</details>

**Q166. What are high-risk events in a Git audit log?**

<details>
<summary>Show answer</summary>

Branch protection or ruleset changes, force pushes to protected branches, visibility changed to public, repo deletion or transfer, new admins, new deploy keys or webhooks, disabled secret scanning, and unusual clone volumes.

</details>

**Q167. How do you secure webhooks from your Git platform?**

<details>
<summary>Show answer</summary>

Use HTTPS, verify signatures (HMAC `X-Hub-Signature-256`, GitLab secret token), restrict source IPs if possible, and limit what the receiving service can do.

</details>

**Q168. How do you approach license compliance in Git repos?**

<details>
<summary>Show answer</summary>

Keep a LICENSE file, use automated license scanning of dependencies (FOSSA, ORT, GitHub dependency review), require DCO or CLA for contributions where needed, and record third-party code provenance.

</details>

**Q169. How do you protect intellectual property when contractors need repo access?**

<details>
<summary>Show answer</summary>

Least privilege (only needed repos, read-only where possible), time-bound access, separate teams, outside-collaborator review, audit logs, and disabled forking of private repos.

</details>

**Q170. How do you prevent private repo forks from leaking code?**

<details>
<summary>Show answer</summary>

Disable private repository forking at the org level, restrict outside collaborators, and monitor audit logs for forks and clones.

</details>

**Q171. How do you handle a GDPR "right to erasure" request for data in Git history?**

<details>
<summary>Show answer</summary>

Identify where personal data appears (commits, files, metadata), purge it with filter-repo where legally required, coordinate force-push and re-clones, and update `.mailmap` for author identity concerns. Document the process with legal.

</details>

**Q172. How do you write a Git usage policy for a company?**

<details>
<summary>Show answer</summary>

Cover branching strategy, commit message conventions, PR rules (size, review, approvals), protection settings, secrets handling, signing, release and tagging, and access management, with links to templates and automation that enforce it.

</details>

**Q173. What goes into a secure repository template?**

<details>
<summary>Show answer</summary>

SECURITY.md, CODEOWNERS, `.gitignore`, `.gitattributes`, a pre-commit config with secret scanning, Dependabot or Renovate config, CI with security scans, PR templates, and a branch protection baseline applied on creation.

</details>

**Q174. How do you manage access reviews for repositories?**

<details>
<summary>Show answer</summary>

A quarterly export of members and permissions per repo or team, owner attestation, removal of unused access, team-based permissions instead of individual grants, and evidence retention for auditors.

</details>

**Q175. How do you protect release tags in GitLab?**

<details>
<summary>Show answer</summary>

Protected tags with patterns like `v*`, allowing creation only by Maintainers or a specific bot, combined with release jobs that run only on protected tags.

</details>

**Q176. What are GitLab push rules, and what would you enable?**

<details>
<summary>Show answer</summary>

Server-side checks on push: commit message regex, branch name regex, reject unsigned commits, prevent secrets (known file patterns), max file size, and verify that the committer email matches a user. Enable message and branch naming rules, secret prevention and size limits.

</details>

**Q177. How do you ensure CI secrets aren't exposed to unprotected branches?**

<details>
<summary>Show answer</summary>

GitLab protected variables (available only to protected branches and tags), GitHub environment secrets with branch policies, and never printing secrets in logs (masking).

</details>

**Q178. How do you implement OIDC from CI to AWS and why is it better?**

<details>
<summary>Show answer</summary>

Configure an IAM OIDC identity provider for GitHub or GitLab, and a role whose trust policy restricts the `sub` claim to specific repos and branches or environments. CI gets short-lived credentials, so no long-lived keys are stored in Git or CI.

</details>

**Q179. How do you restrict the OIDC role so only main can deploy to production?**

<details>
<summary>Show answer</summary>

In the IAM trust policy, condition on the token's `sub` claim (e.g. `repo:org/app:ref:refs/heads/main` or `repo:org/app:environment:prod`).

</details>

**Q180. What is OpenSSF Scorecard, and how would you use it?**

<details>
<summary>Show answer</summary>

An automated tool that scores repos on security practices (branch protection, pinned dependencies, token permissions, signed releases, SAST). Run it in CI across your org to prioritize hardening.

</details>

**Q181. How do you handle security vulnerability reports for your repositories?**

<details>
<summary>Show answer</summary>

Publish SECURITY.md with a private reporting channel (GitHub private vulnerability reporting), triage in private forks or security advisories, coordinate fixes and backports, then publish an advisory with fixed versions.

</details>

**Q182. How do you secure self-hosted Git servers?**

<details>
<summary>Show answer</summary>

Patch promptly, restrict network exposure, enforce SSO and MFA, use HTTPS and SSH hardening, run backups with restore tests, enable audit logs, limit admin accounts, and run separate runners for untrusted code.

</details>

**Q183. How do you isolate CI runners that build untrusted PRs?**

<details>
<summary>Show answer</summary>

Use ephemeral, isolated runners (fresh VM or container per job) without access to internal networks or secrets, separate from runners used for deployments.

</details>

**Q184. How do you enforce that all repos have CODEOWNERS?**

<details>
<summary>Show answer</summary>

Include it in repo templates, check for it via an org-wide compliance script or Scorecard-like scanning, and fail onboarding checks for repos without it.

</details>

**Q185. How do you prevent an attacker who steals a developer's token from rewriting history?**

<details>
<summary>Show answer</summary>

Force-push protection on main and release branches (for everyone), signed commits required, short token lifetimes, SSO session limits, and alerting on unusual pushes.

</details>

**Q186. What is the "two-person rule" and how do you enforce it in Git?**

<details>
<summary>Show answer</summary>

Every change to production code needs at least one approver other than the author. Enforce it with required approvals, disallowing self-approval, dismissing stale reviews, and including admins.

</details>

**Q187. How do you secure a GitOps setup against Git compromise?**

<details>
<summary>Show answer</summary>

Protected branches with reviews, signed commits with agent-side verification (Flux verifies commit signatures, Argo CD supports GPG verification), least-privilege agent permissions, and admission policies.

</details>

**Q188. What compliance issues come with squash merges?**

<details>
<summary>Show answer</summary>

Individual commit authorship is collapsed (co-authors preserved only via trailers), and original commits aren't on main. Traceability relies on the PR record, so make sure PR data is retained and exported.

</details>

**Q189. How do you ensure commit history is retained for the required period (e.g. 7 years)?**

<details>
<summary>Show answer</summary>

Prevent history rewriting on protected branches, keep mirror backups with retention policies, archive repos rather than deleting them, and export platform metadata (PRs and reviews) regularly.

</details>

**Q190. How do you handle dependencies vendored into the repo from a security perspective?**

<details>
<summary>Show answer</summary>

Track their source and version (manifest or SBOM), scan them for vulnerabilities, update via automated PRs, and prefer package managers with lockfiles over vendoring when possible.

</details>

**Q191. How do you produce an SBOM tied to a Git commit?**

<details>
<summary>Show answer</summary>

Generate it in CI (Syft, CycloneDX) for the build of a specific SHA, attach it to the release or attestation, and label it with the commit SHA and tag.

</details>

**Q192. How do you monitor for accidental public exposure of internal code?**

<details>
<summary>Show answer</summary>

Alerts on repo visibility changes, code-search monitoring for unique internal strings on public platforms, secret scanning partner programs, and DLP tools.

</details>

**Q193. What should a CONTRIBUTING.md cover in an enterprise repo?**

<details>
<summary>Show answer</summary>

How to set up locally, branching and commit conventions, PR expectations, testing requirements, code owners and review SLAs, release process, and where to ask for help.

</details>

**Q194. How do you enforce branch naming conventions?**

<details>
<summary>Show answer</summary>

Server-side rules (GitLab push rules branch regex, GitHub rulesets with metadata or branch name patterns), CI checks on PR source branch names, and hook-based reminders locally.

</details>

**Q195. How do you prevent unreviewed changes via the platform's web editor?**

<details>
<summary>Show answer</summary>

The same protections apply: web edits on protected branches require PRs. Ensure "require PR" is on and don't grant bypass to people editing via the UI.

</details>

**Q196. How would you respond to a compromised maintainer account on an open-source project you run?**

<details>
<summary>Show answer</summary>

Revoke sessions and tokens, remove the account's access, audit recent pushes, releases and tags, revert malicious changes, re-sign or yank compromised releases, publish an advisory and enforce MFA for all maintainers.

</details>

**Q197. How do you keep track of which repos are business-critical for stricter controls?**

<details>
<summary>Show answer</summary>

Repository custom properties or topics (GitHub), labels or groups (GitLab), and targeted rulesets for critical tiers, plus inventory managed as code.

</details>

**Q198. What's your approach to enforcing policies without slowing developers down?**

<details>
<summary>Show answer</summary>

Automate everything (templates, rulesets, pre-commit, CI checks), keep checks fast, give clear error messages with fixes, use evaluate mode before enforcing, and provide documented exception paths.

</details>

**Q199. How do you protect the `.github` or CI config of all repos centrally?**

<details>
<summary>Show answer</summary>

Org-level required workflows or rulesets (GitHub), compliance pipelines and security policies (GitLab), plus CODEOWNERS on CI paths in templates.

</details>

**Q200. How do you test new repository rules before enforcing them org-wide?**

<details>
<summary>Show answer</summary>

Use ruleset evaluate (dry-run) mode or apply to a pilot group of repos first, review insights on what would have been blocked, fix false positives, then switch to active enforcement with communication.

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
