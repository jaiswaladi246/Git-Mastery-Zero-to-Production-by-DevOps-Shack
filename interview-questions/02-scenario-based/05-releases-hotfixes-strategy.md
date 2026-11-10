<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Releases, Hotfixes & Branching Strategy Scenarios

Questions 201–250 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q201. Production v2.3.0 has a critical bug, and main already has unreleased features. How do you ship a fix fast?**

<details>
<summary>Show answer</summary>

Branch from the release tag (`git switch -c hotfix/2.3.1 v2.3.0`), fix, test, tag `v2.3.1`, deploy. Then make sure the fix reaches main: merge the hotfix back, or fix on main first and cherry-pick with `-x`.

</details>

**Q202. In Git Flow, a hotfix was merged to main but the bug reappeared in the next release. What went wrong?**

<details>
<summary>Show answer</summary>

The hotfix wasn't merged back into develop (or into the open release branch), so the next release cut from develop didn't have it. Always merge hotfixes into both, and automate the check in CI.

</details>

**Q203. Your team deploys 10 times a day and uses Git Flow. Releases feel slow. What do you recommend?**

<details>
<summary>Show answer</summary>

Move to GitHub Flow or trunk-based development: short-lived branches into main, feature flags for unfinished work, automated deploy on merge, and tags for traceability. Git Flow's develop and release branches add delay without value for continuous delivery.

</details>

**Q204. You support versions 3.1, 3.2 and 3.3 for enterprise customers. How do you manage fixes?**

<details>
<summary>Show answer</summary>

Keep `release/3.1`, `release/3.2` and `release/3.3` branches. Fix on main first, then cherry-pick `-x` into each supported release branch, tagging patch versions. Automate backports with a label-driven bot.

</details>

**Q205. A fix doesn't apply cleanly to an old release branch because the code changed a lot. What do you do?**

<details>
<summary>Show answer</summary>

Write a dedicated fix commit on the release branch that achieves the same result, referencing the original issue and commit, and test it against that version.

</details>

**Q206. How do you decide the next version number for a release?**

<details>
<summary>Show answer</summary>

Look at changes since the last tag. A breaking change bumps MAJOR, new features bump MINOR, and only fixes bump PATCH. With Conventional Commits, tools like semantic-release or release-please decide automatically.

</details>

**Q207. Someone tagged `v1.5.0` on the wrong commit and pushed it an hour ago. What do you do?**

<details>
<summary>Show answer</summary>

Prefer releasing `v1.5.1` from the correct commit and documenting the mistake. Only if nobody could have consumed it, delete and re-create it (`git push origin --delete v1.5.0`, then push the correct tag) and notify everyone to delete their local copy.

</details>

**Q208. You need to generate release notes for v2.0.0. Quick method?**

<details>
<summary>Show answer</summary>

`git log --pretty="- %s (%h)" --no-merges v1.9.0..v2.0.0`, grouped by type, or use the platform's "generate release notes" feature or a changelog tool driven by Conventional Commits.

</details>

**Q209. Your release branch is open for QA, and developers keep merging new features into it. How do you prevent that?**

<details>
<summary>Show answer</summary>

Protect `release/*` so only release managers or approved PRs labeled as fixes can merge. Document a feature freeze policy, and keep feature work on main.

</details>

**Q210. How do you make sure a release branch fix also lands on main in GitLab Flow?**

<details>
<summary>Show answer</summary>

Follow "upstream first": fix on main and cherry-pick down to the stable branch. If an urgent fix was made on the release branch, immediately open a PR to main too.

</details>

**Q211. A feature must ship in this week's release, but it isn't complete. Using trunk-based development, what do you do?**

<details>
<summary>Show answer</summary>

Merge the completed parts behind a feature flag set to off, release, and enable the flag later when the feature is done and tested.

</details>

**Q212. Management asks for a "code freeze" for two weeks before every release. What's your counter-proposal?**

<details>
<summary>Show answer</summary>

Cut a release branch for stabilization so main keeps moving, or invest in automated testing and feature flags so releases need no freeze. Long freezes signal low confidence in tests and slow down delivery.

</details>

**Q213. Your environment branches (dev, qa, prod) have drifted, and promoting causes conflicts. How do you fix the model?**

<details>
<summary>Show answer</summary>

Switch to building one immutable artifact from main and promoting that artifact through environments with approvals. Keep environment differences in config (Helm values or overlays), not branches.

</details>

**Q214. QA approved feature A but not feature B, and both are already in the qa branch. How do you release only A?**

<details>
<summary>Show answer</summary>

With environment branches this needs cherry-picks, which causes drift. The better long-term fix is feature flags: deploy both and enable only A. Short term, cherry-pick A's commits into the release path and test that exact build.

</details>

**Q215. How do you roll back a bad release quickly?**

<details>
<summary>Show answer</summary>

Redeploy the previous release artifact (tag v-previous), which is fastest. In Git, revert the release's changes on main. In GitOps, revert the commit that bumped the image tag.

</details>

**Q216. Your release pipeline triggers on tags. A tag was pushed from a branch with untested code. How do you prevent this?**

<details>
<summary>Show answer</summary>

Protect release tags so only CI or release managers can create them, and have the pipeline verify that the tagged commit is on main or a release branch (`git merge-base --is-ancestor $TAG origin/main`) and passed CI.

</details>

**Q217. You need to build a version string in CI that's unique for every commit. How?**

<details>
<summary>Show answer</summary>

`git describe --tags --always --dirty` (e.g. `v2.3.1-14-g3f9a1c2`), or combine SemVer with the short SHA. Make sure the CI checkout fetches tags.

</details>

**Q218. What would you choose for a mobile app released through app stores every two weeks?**

<details>
<summary>Show answer</summary>

Trunk-based or GitHub Flow on main with feature flags, plus release branches cut per store submission (`release/2026.11.2`) for stabilization and store-review fixes. Some teams use Git Flow for the same reasons.

</details>

**Q219. What branching strategy would you choose for a small team building a SaaS API with good tests?**

<details>
<summary>Show answer</summary>

GitHub Flow (moving toward trunk-based): short branches, PR review, CI, squash merge, auto-deploy main, feature flags for longer work.

</details>

**Q220. What strategy suits an open-source library used by thousands with LTS versions?**

<details>
<summary>Show answer</summary>

Fork-based PRs into main, plus release branching (`release/x.y`) for supported versions, with automated backports and a published support policy.

</details>

**Q221. How do you migrate a team from Git Flow to trunk-based development?**

<details>
<summary>Show answer</summary>

Reduce branch lifetimes first, introduce feature flags and improve CI speed and coverage, make main the integration branch (retire develop), keep release branches only if needed, and track branch age and lead time to measure progress.

</details>

**Q222. You maintain a GitOps repo, and production must always match a specific approved commit. How do you promote?**

<details>
<summary>Show answer</summary>

CI updates the image tag in `overlays/staging` via PR. After verification, a promotion PR changes `overlays/prod` to the same tag, requiring CODEOWNERS approval. Argo CD or Flux syncs prod from main.

</details>

**Q223. You need to hotfix production, but CI takes 50 minutes. What do you do now and later?**

<details>
<summary>Show answer</summary>

Now: run the critical test subset and follow your documented emergency change process with approval. Later: speed up CI (parallelism, caching, affected-only tests), because slow pipelines make every hotfix risky.

</details>

**Q224. A hotfix went straight into prod via an environment branch and was never merged to main. The next release overwrote it. How do you prevent this?**

<details>
<summary>Show answer</summary>

Enforce "upstream first" with branch protection (production accepts merges only from main or pre-production), and require a main PR link in every hotfix.

</details>

**Q225. How do you keep release branches buildable years later?**

<details>
<summary>Show answer</summary>

Run scheduled CI on active release branches, pin toolchain versions and base images, mirror dependencies in an internal registry, and archive build environments.

</details>

**Q226. Your changelog shows internal commit noise like "fix typo". How do you improve it?**

<details>
<summary>Show answer</summary>

Squash-merge PRs with meaningful PR titles in Conventional Commit format, generate changelogs from those, and exclude types like `chore` and `test`.

</details>

**Q227. You need to know which customer versions contain the fix for CVE-2026-1234. How?**

<details>
<summary>Show answer</summary>

Find the fix commit (and backports via `-x` trailers), then `git tag --contains <sha>` for each fix commit to list affected and fixed release tags.

</details>

**Q228. How do you handle database migrations with feature flags and trunk-based development?**

<details>
<summary>Show answer</summary>

Use expand-and-contract migrations: add new schema in a backward-compatible way, deploy code that writes both, migrate data, switch reads behind a flag, then remove old columns in a later release.

</details>

**Q229. Your team wants release candidates. How do you tag them?**

<details>
<summary>Show answer</summary>

Use SemVer pre-release tags: `v3.0.0-rc.1`, `v3.0.0-rc.2`, then `v3.0.0` on the approved RC commit. Pre-release versions sort before the final release.

</details>

**Q230. Two teams share a monorepo but release independently. How do you tag?**

<details>
<summary>Show answer</summary>

Use prefixed tags per component (`payments/v1.4.0`, `orders/v2.1.3`), with tooling (release-please or changesets) configured per package path.

</details>

**Q231. Your release process requires two approvals for production deploys. How do you implement it with Git and CI?**

<details>
<summary>Show answer</summary>

Use protected environments (GitHub Environments with required reviewers, GitLab protected environments with approval rules) on the production deploy job, triggered from main or tags.

</details>

**Q232. A release went out with a debug flag enabled. The fix is a one-line config change. What's the right Git flow?**

<details>
<summary>Show answer</summary>

Commit the change on main via a PR (or a hotfix branch from the release tag if main has unreleased work), tag a patch release, deploy, and add a CI check that blocks debug flags in production configs.

</details>

**Q233. How do you test that a hotfix doesn't conflict with the next release before merging?**

<details>
<summary>Show answer</summary>

Merge the hotfix into the current release or main branch in a test worktree (or run CI on the PR targeting main) to catch conflicts and test failures early.

</details>

**Q234. Your main branch is broken and blocks everyone. What's the policy?**

<details>
<summary>Show answer</summary>

Treat a red main as the top priority. Revert the offending commit immediately (don't debug on main), restore green, then fix forward on a branch. Merge queues prevent most of these situations.

</details>

**Q235. How do you ensure every production deployment can be traced to a commit?**

<details>
<summary>Show answer</summary>

Tag images with the commit SHA, add OCI labels for revision and source, record deployments (GitHub deployments API, Argo CD history, or git notes), and keep tags for releases.

</details>

**Q236. You must deliver a custom version for one enterprise customer. How do you avoid a permanent fork?**

<details>
<summary>Show answer</summary>

Prefer configuration or feature flags over code branches. If a branch is unavoidable, keep it short-lived, rebase it regularly on the release branch, and plan to upstream the changes.

</details>

**Q237. Your release tags are lightweight. Why might that be a problem?**

<details>
<summary>Show answer</summary>

Lightweight tags have no tagger, date, message or signature. `git describe` ignores them by default, and they're harder to audit. Use annotated (ideally signed) tags for releases.

</details>

**Q238. How do you protect against accidental deletion of release tags?**

<details>
<summary>Show answer</summary>

Protected tags or tag rulesets on the platform (only CI or release managers can create or delete `v*`), plus regular mirror backups.

</details>

**Q239. Your product needs a long-term support (LTS) line. How do you structure Git?**

<details>
<summary>Show answer</summary>

Create `release/lts-2026` from the chosen version, accept only security and critical fixes via backports from main, and tag LTS patch releases with a clear end-of-life date.

</details>

**Q240. You need to deliver a hotfix while a release branch is open in Git Flow. Where does the hotfix merge?**

<details>
<summary>Show answer</summary>

Into main (tagged), and into the open release branch instead of develop. The release branch will later merge into develop, carrying the fix.

</details>

**Q241. What's a release train, and how does Git support it?**

<details>
<summary>Show answer</summary>

Releases leave on a fixed schedule with whatever is ready. Git supports it with a release branch cut at a fixed time from main, and anything not ready stays behind flags or waits for the next train.

</details>

**Q242. Your team can't agree between merge commits and squash merges. How do you decide?**

<details>
<summary>Show answer</summary>

Squash suits product teams wanting one revertable commit per PR and clean changelogs. Merge commits suit cases where individual commits matter (large contributions, long-lived release branches). Choose one default, document it, and configure the platform.

</details>

**Q243. A developer insists on using a long-lived personal branch for months. How do you address it?**

<details>
<summary>Show answer</summary>

Explain the integration risk, help split the work into small mergeable pieces behind flags, set a branch age alert, and enforce regular integration with main.

</details>

**Q244. How do you verify that a release tag's commit passed CI?**

<details>
<summary>Show answer</summary>

Check the commit status or checks via the platform API (`gh api repos/org/repo/commits/<sha>/status`), and make the release pipeline require a successful status before publishing.

</details>

**Q245. You need to cherry-pick ten fix commits to a release branch in order. Efficient command?**

<details>
<summary>Show answer</summary>

`git cherry-pick -x A^..J` for a contiguous range, or list the SHAs in order. Resolve conflicts with `--continue` as needed.

</details>

**Q246. How do you find all commits on main that are not yet in the release branch?**

<details>
<summary>Show answer</summary>

`git log --oneline --no-merges release/2.3..main` (or `git cherry -v release/2.3 main` to account for already cherry-picked patches).

</details>

**Q247. Your team wants automated version bumps on merge to main without humans tagging. What do you set up?**

<details>
<summary>Show answer</summary>

Conventional Commits enforced in CI plus release-please or semantic-release in the main pipeline, which open release PRs or create tags, changelogs and platform releases automatically.

</details>

**Q248. How do you announce a breaking change in your commit history so tools catch it?**

<details>
<summary>Show answer</summary>

Use `feat!:` or add a `BREAKING CHANGE: <description>` footer in the commit (or PR title for squash merges). Release tools then bump the major version.

</details>

**Q249. A customer reports a bug in v1.8.2. How do you reproduce the exact code?**

<details>
<summary>Show answer</summary>

`git switch --detach v1.8.2` (or `git worktree add ../v182 v1.8.2`), build with the pinned dependencies from that commit, and reproduce. Bisect between earlier good tags if needed.

</details>

**Q250. A release was tagged, but the build artifact in the registry doesn't match the tag's code. How do you prevent this?**

<details>
<summary>Show answer</summary>

Build artifacts only in CI from the tagged commit, label them with the commit SHA (OCI revision label), make the registry tags immutable, and attach build provenance (SLSA or artifact attestations) linking artifact to commit.

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
