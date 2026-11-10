<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Release Engineering & Team Process

Questions 301–350 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q301. Walk through your ideal release process for a SaaS product.**

<details>
<summary>Show answer</summary>

Small PRs merge to main through a merge queue. CI builds an immutable image tagged with the SHA, which deploys automatically to staging and then progressively to production (canary, then full) with automated checks. Feature flags control exposure, and release notes are generated from Conventional Commits.

</details>

**Q302. How do you release a versioned product (e.g. an on-prem installer) monthly?**

<details>
<summary>Show answer</summary>

Cut `release/x.y` from main at code-complete, stabilize with fixes landed on main first and cherry-picked, tag RCs, run full QA, tag the final version (signed), publish artifacts and notes, and maintain patch releases on the branch.

</details>

**Q303. How do you decide who can create releases?**

<details>
<summary>Show answer</summary>

Release managers or CI automation only, enforced with protected tags and release environment approvals, documented in a release runbook.

</details>

**Q304. What's a release runbook, and what's in it?**

<details>
<summary>Show answer</summary>

A documented, repeatable procedure covering preconditions (green main, frozen scope), branch and tag commands, artifact building and signing, deployment steps, verification, rollback steps, and communication templates.

</details>

**Q305. How do you automate changelogs and release notes reliably?**

<details>
<summary>Show answer</summary>

Enforce Conventional Commit PR titles, squash-merge, run release-please or semantic-release to generate CHANGELOG.md and platform releases, and categorize with labels for nuances.

</details>

**Q306. How do you handle hotfix releases without disrupting ongoing development?**

<details>
<summary>Show answer</summary>

Branch from the production tag, apply the minimal fix (preferably cherry-picked from main), run targeted tests, tag a patch version, deploy, and confirm the fix is on main.

</details>

**Q307. How do you track which features are in which release?**

<details>
<summary>Show answer</summary>

Link PRs to tickets, generate release notes from PRs between tags, label tickets with the fix version automatically (e.g. Jira integration from commit messages), and keep a feature flag inventory.

</details>

**Q308. How do you coordinate a release across 10 microservices?**

<details>
<summary>Show answer</summary>

Prefer independently deployable services with backward-compatible APIs. When coordination is required, use a release manifest (GitOps repo commit or umbrella chart) pinning compatible versions, and promote that manifest through environments.

</details>

**Q309. How do you keep backward compatibility between services during rolling deploys?**

<details>
<summary>Show answer</summary>

Expand-and-contract changes, versioned APIs, consumer-driven contract tests in CI, and feature flags to switch behavior after all services are upgraded.

</details>

**Q310. What's your branching approach for a team of 40 engineers on one product?**

<details>
<summary>Show answer</summary>

Trunk-based or GitHub Flow with short-lived branches (under 2 days), required reviews, a merge queue, feature flags, release tags or late-cut release branches, and strict "main is always releasable".

</details>

**Q311. How do you introduce trunk-based development to a team used to long-lived branches?**

<details>
<summary>Show answer</summary>

Start by measuring branch age, set a target (e.g. merge within 2 days), add feature flag tooling, improve CI speed, pair on splitting work, celebrate small PRs, and retire develop.

</details>

**Q312. How do you deal with "my PR has been waiting for review for days"?**

<details>
<summary>Show answer</summary>

Set review SLAs, auto-assign reviewers via CODEOWNERS with load balancing, keep PRs small, track review latency dashboards, and make reviewing a recognized part of the job.

</details>

**Q313. What makes a good PR description?**

<details>
<summary>Show answer</summary>

What changed, why, how it was tested (with evidence), risks and rollout or rollback notes, linked tickets, and screenshots for UI changes, so reviewers can review without a meeting.

</details>

**Q314. How do you keep commit history useful for future engineers?**

<details>
<summary>Show answer</summary>

Meaningful PR titles (squash) or clean commit series, messages explaining why, ticket links, `.git-blame-ignore-revs` for formatting commits, and never "fix stuff" messages on main.

</details>

**Q315. How do you handle a contributor who keeps force-pushing during review, losing comments?**

<details>
<summary>Show answer</summary>

Agree on a review workflow: add fixup commits during review, then squash at merge (or autosquash right before merge). Platforms' "compare changes since last review" helps too.

</details>

**Q316. Your team frequently breaks main. What process changes do you make?**

<details>
<summary>Show answer</summary>

A merge queue, required up-to-date checks, faster and more reliable tests, ownership of flaky tests, automatic reverts for red main, and a culture where fixing main is top priority.

</details>

**Q317. How do you onboard new engineers to your Git workflow?**

<details>
<summary>Show answer</summary>

A CONTRIBUTING.md and workflow doc, setup scripts (hooks, config), a first-PR checklist, a buddy for the first reviews, and labs covering conflicts, rebase and recovery.

</details>

**Q318. How do you define "done" for a change in a Git-centric workflow?**

<details>
<summary>Show answer</summary>

Merged to main via an approved PR with green CI, deployed (or behind a flag) to production, monitored, docs updated, and feature flag cleanup ticketed.

</details>

**Q319. What's your approach to feature flag lifecycle management?**

<details>
<summary>Show answer</summary>

Every flag has an owner, a ticket and an expiry. Dashboards list stale flags, cleanup PRs remove flag and dead code after full rollout, and lint rules or CI warn on expired flags.

</details>

**Q320. How do you release mobile apps with Git when app store review takes days?**

<details>
<summary>Show answer</summary>

Cut a release branch per submission, keep main moving, ship fixes during review on the release branch (cherry-picked from main), use remote config or flags to disable features without resubmission, and tag each store build.

</details>

**Q321. How do you handle versioning for an internal library used by 30 teams?**

<details>
<summary>Show answer</summary>

SemVer with automated releases, deprecation periods for breaking changes, release notes, automated upgrade PRs (Renovate), and supporting the previous major version for a defined time.

</details>

**Q322. How do you roll out a breaking change in a shared library?**

<details>
<summary>Show answer</summary>

Add the new API alongside the old one (minor release), deprecate the old one with warnings, migrate consumers via automated PRs, then remove it in a major release with clear notes.

</details>

**Q323. How do you make release decisions data-driven?**

<details>
<summary>Show answer</summary>

Track DORA metrics (deployment frequency, lead time, change failure rate, MTTR), canary analysis results and error budgets. Gate releases on SLO health rather than calendar dates alone.

</details>

**Q324. How do you compute lead time for changes from Git data?**

<details>
<summary>Show answer</summary>

For each deployment, take the commits included (diff between deployed SHAs), compute the time from first commit (or PR open) to deployment, and aggregate the median per service.

</details>

**Q325. How do you handle versioning when you deploy continuously?**

<details>
<summary>Show answer</summary>

Use the commit SHA or a build number as the deployable version, and tag SemVer releases only for external-facing APIs or SDKs. Communicate changes via changelogs per deploy or per week.

</details>

**Q326. What is a "release branch cut" checklist?**

<details>
<summary>Show answer</summary>

Main is green, the scope is confirmed, feature flags are set for unfinished work, the version is bumped, the branch is created and protected, CI is configured for it, the QA plan is ready and stakeholders are notified.

</details>

**Q327. How do you handle documentation versioning alongside code?**

<details>
<summary>Show answer</summary>

Docs-as-code in the same repo (or a docs repo with matching tags), published per version from release tags, with PR checks for broken links and docs updates required for user-facing changes.

</details>

**Q328. How do you make sure database migrations and code deploy together safely?**

<details>
<summary>Show answer</summary>

Migrations live in the repo alongside code, backward-compatible migrations run before code deploys, CI tests migrations against production-like snapshots, and destructive steps are separated into later releases.

</details>

**Q329. How do you handle a freeze period (e.g. holidays) with Git?**

<details>
<summary>Show answer</summary>

Use ruleset or protection changes to restrict merges to main (or require release manager approval) during the freeze, communicate exceptions, and keep CI running to catch issues in open PRs.

</details>

**Q330. How do you support multiple customers on different versions without branching per customer?**

<details>
<summary>Show answer</summary>

Use a single codebase with configuration and feature flags per tenant, plus release channels (stable, beta) and supported version windows, rather than customer branches.

</details>

**Q331. How do you enforce that every commit references a ticket?**

<details>
<summary>Show answer</summary>

A commit-msg hook (or prepare-commit-msg adding the ticket from the branch name), CI checks on PR titles or commits, and platform push rules (GitLab regex). Allow exceptions for chore commits if your policy permits.

</details>

**Q332. How do you run a release retrospective using Git data?**

<details>
<summary>Show answer</summary>

Review the PRs and commits in the release (`git log vPrev..vNew --first-parent`), hotfixes after release, reverted commits, PR sizes and review times, and incidents linked to commits, then agree on improvements.

</details>

**Q333. How do you design a Git workflow for a regulated healthcare product?**

<details>
<summary>Show answer</summary>

Protected branches with two approvals, CODEOWNERS for safety-critical modules, signed commits and tags, traceability from requirement to ticket to commit to test evidence to release, release branches with formal sign-off, and immutable audit retention.

</details>

**Q334. How do you keep an open-source project's release process sustainable?**

<details>
<summary>Show answer</summary>

Automate releases (tags trigger builds and publishing), use labels for changelog categories, a published support policy, backport bots, multiple maintainers with release permissions, and documented release steps.

</details>

**Q335. How do you reduce "works on my machine" issues related to Git?**

<details>
<summary>Show answer</summary>

Commit `.gitattributes` and `.editorconfig`, pin tool versions (`.tool-versions`, lockfiles), provide devcontainers, run the same pre-commit checks in CI, and avoid committing local config.

</details>

**Q336. How do you introduce Conventional Commits to an existing team?**

<details>
<summary>Show answer</summary>

Explain the benefits (automated versions and changelogs), start with PR titles if squash merging, add commitlint in warning mode, provide commitizen for guidance, then enforce once the habit forms.

</details>

**Q337. How do you structure a repo's README for operational use?**

<details>
<summary>Show answer</summary>

Purpose, architecture overview, local setup, how to run tests, deployment and release process, configuration, owners and on-call, runbooks and troubleshooting links.

</details>

**Q338. How do you share Git knowledge so one person isn't the "Git hero"?**

<details>
<summary>Show answer</summary>

Document workflows and recovery steps, run internal workshops and labs, rotate release manager duties, pair on tricky merges and rebases, and automate as much as possible.

</details>

**Q339. How do you handle pair or mob programming commits?**

<details>
<summary>Show answer</summary>

Rotate who commits, add `Co-authored-by` trailers for all participants (tools can automate it), and keep commits small during sessions.

</details>

**Q340. How do you keep long-running migration work (e.g. framework upgrade) from blocking feature teams?**

<details>
<summary>Show answer</summary>

Branch by abstraction and incremental migration on main behind flags or adapters, codemods applied in small PRs, and compatibility layers. Avoid a months-long upgrade branch.

</details>

**Q341. What does a healthy Git workflow look like in metrics?**

<details>
<summary>Show answer</summary>

Median PR under about 200 lines, time to first review under a few hours, time to merge under a day or two, main green over 95% of the time, branch age measured in days, and frequent deployments with low change failure rate.

</details>

**Q342. How do you decide between squash merge and rebase merge for your team?**

<details>
<summary>Show answer</summary>

Squash if PRs should be atomic units on main and commit hygiene within PRs varies. Rebase merge if developers curate meaningful commit series and you want them preserved linearly.

</details>

**Q343. How do you ensure releases are reproducible months later?**

<details>
<summary>Show answer</summary>

Tag release commits, pin dependencies and base images by digest, store build provenance and SBOMs, archive release artifacts, and keep the build pipeline definition versioned with the code.

</details>

**Q344. How do you handle security patches across all supported release lines quickly?**

<details>
<summary>Show answer</summary>

Prepare fixes in private (security advisories or private forks), merge to main and backport to all supported branches simultaneously, run release pipelines in parallel, and publish advisories with fixed versions.

</details>

**Q345. What's your approach when a stakeholder demands a feature be "added to the release" at the last minute?**

<details>
<summary>Show answer</summary>

Assess risk. Prefer merging behind a flag on main and enabling later. If it must ship, require full review and tests, and accept that it may delay the release.

</details>

**Q346. How do you keep your CHANGELOG readable for customers rather than developers?**

<details>
<summary>Show answer</summary>

Categorize by user impact (features, fixes, breaking changes, security), write PR titles in user language, curate release notes with a human pass for major releases, and link to docs.

</details>

**Q347. How do you manage Git workflow differences between platform and product teams in one company?**

<details>
<summary>Show answer</summary>

Set a common baseline (protections, conventions, security), allow team-level strategy choices within it, and document each repo's workflow in CONTRIBUTING.md.

</details>

**Q348. How do you measure the success of a Git workflow change (e.g. moving to trunk-based)?**

<details>
<summary>Show answer</summary>

Compare before and after metrics: lead time, deployment frequency, change failure rate, merge conflicts or rework, PR size and review time, plus developer satisfaction surveys.

</details>

**Q349. If you joined a company with chaotic Git practices, what would you fix first?**

<details>
<summary>Show answer</summary>

Protect main (PRs, reviews, CI, no force push), stop secrets entering the repo (scanning, push protection), set up backups, then standardize the branching strategy and PR size and introduce automation for releases.

</details>

**Q350. How do you explain Git workflow decisions to non-technical stakeholders?**

<details>
<summary>Show answer</summary>

Frame them in outcomes: faster safe releases, fewer outages, quicker rollbacks, audit readiness. Show metrics, and avoid jargon like rebase or squash unless asked.

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
