<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Scale, Performance & Monorepos

Questions 201–250 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q201. Your company is debating monorepo vs polyrepo. How do you frame the decision?**

<details>
<summary>Show answer</summary>

A monorepo wins on atomic cross-project changes, shared tooling and dependency consistency, but needs affected-only CI, ownership controls and Git scaling. A polyrepo wins on autonomy, simple access control and simple CI, but makes cross-repo changes and dependency drift harder. Decide based on coupling between projects and tooling maturity.

</details>

**Q202. What tooling does a large monorepo need?**

<details>
<summary>Show answer</summary>

A build system with dependency graphs and caching (Bazel, Nx, Turborepo, Pants), affected-only CI, CODEOWNERS, sparse checkout and partial clone, merge queues, and remote build caches.

</details>

**Q203. How do you make a 20 GB monorepo usable for developers?**

<details>
<summary>Show answer</summary>

`scalar clone` (or partial clone plus sparse checkout), FSMonitor, commit-graph and background maintenance, plus documentation on sparse profiles per team.

</details>

**Q204. Developers report `git fetch` takes minutes. What do you look at?**

<details>
<summary>Show answer</summary>

The number of refs (thousands of branches or tags; prune and pack refs), server-side bitmaps and repacking, network or proxy issues, missing commit-graph, and protocol version (use protocol v2, default in modern Git).

</details>

**Q205. What is Git protocol v2, and why does it matter at scale?**

<details>
<summary>Show answer</summary>

A newer wire protocol (default since Git 2.26) where clients request only the refs they need instead of the server advertising all refs. It greatly speeds up fetches in repos with many refs.

</details>

**Q206. How do you handle a repository with 100,000 tags?**

<details>
<summary>Show answer</summary>

Use packed refs, protocol v2, avoid fetching all tags in CI (`--no-tags` or specific refspecs), archive old tags if policy allows, and use maintenance to keep ref storage efficient.

</details>

**Q207. How do you keep CI fast in a monorepo with 300 services?**

<details>
<summary>Show answer</summary>

Affected-only builds from the dependency graph, remote caching of build outputs, sparse checkouts of only the needed paths, shallow or treeless clones, and parallel jobs per affected target.

</details>

**Q208. What's a treeless clone and when would you use it?**

<details>
<summary>Show answer</summary>

`git clone --filter=tree:0` downloads commits but fetches trees and blobs on demand. It's great for CI that builds one commit, but slow for interactive history browsing.

</details>

**Q209. What's a blobless clone and when would you use it?**

<details>
<summary>Show answer</summary>

`--filter=blob:none` downloads all commits and trees but fetches file contents on demand. It's the recommended default for developers on large repos, since history commands remain fast.

</details>

**Q210. How does sparse checkout cone mode differ from non-cone mode?**

<details>
<summary>Show answer</summary>

Cone mode restricts patterns to directories, which is much faster and the recommended default. Non-cone mode allows arbitrary gitignore-style patterns but scales poorly.

</details>

**Q211. How do you speed up `git status` on a repo with 500k files?**

<details>
<summary>Show answer</summary>

Enable `core.fsmonitor` (built-in daemon on macOS and Windows, or Watchman), `core.untrackedCache true`, `feature.manyFiles true` (index v4, untracked cache), and sparse checkout to reduce tracked working files.

</details>

**Q212. What does `feature.manyFiles` enable?**

<details>
<summary>Show answer</summary>

It enables index version 4 (path compression) and the untracked cache, which speed up commands on working trees with many files.

</details>

**Q213. How do you speed up `git blame` and `git log -- path` at scale?**

<details>
<summary>Show answer</summary>

Commit-graph with changed-path Bloom filters (`git commit-graph write --reachable --changed-paths`), regularly maintained by `git maintenance`.

</details>

**Q214. How do you handle server-side performance for a heavily cloned repo?**

<details>
<summary>Show answer</summary>

Bitmap indexes and regular repacking, pack caching (e.g. GitHub's or GitLab Gitaly's pack-objects cache), CDN or bundle URIs for initial clones, read replicas or geo nodes, and rate limiting abusive CI.

</details>

**Q215. What are bundle URIs?**

<details>
<summary>Show answer</summary>

A Git feature (2.39+) where the server advertises pre-built bundle files (often on a CDN) that clients download first, then fetch only the remaining objects. It speeds up initial clones and reduces server load.

</details>

**Q216. How do you cut CI clone traffic for a popular monorepo?**

<details>
<summary>Show answer</summary>

Caching proxies or mirrors near runners, persistent workspaces with `git fetch` instead of fresh clones, shallow or treeless clones, and reference repositories (`--reference`) on runners.

</details>

**Q217. How do you structure CODEOWNERS for a large monorepo?**

<details>
<summary>Show answer</summary>

Team-based ownership per directory, more specific paths later in the file (last match wins), a default owner, and validation in CI that every path has an owner and every team exists.

</details>

**Q218. How do you handle versioning and releases inside a monorepo?**

<details>
<summary>Show answer</summary>

Either a single version for everything (simple, coordinated releases) or independent package versions with tools like Changesets, release-please manifest mode, or Lerna, using path-prefixed tags.

</details>

**Q219. How do you prevent a monorepo from becoming a tangled dependency mess?**

<details>
<summary>Show answer</summary>

Enforce module boundaries with build-system visibility rules (Bazel visibility, Nx module boundary lint rules), dependency graph checks in CI, and clear ownership.

</details>

**Q220. A team wants to split its service out of the monorepo. How do you do it cleanly?**

<details>
<summary>Show answer</summary>

Extract history with `git filter-repo --subdirectory-filter`, publish shared libs as packages, set up the new repo's CI and permissions, delete the folder from the monorepo with a pointer README, and update dependency references.

</details>

**Q221. How do you merge 20 polyrepos into a monorepo while keeping history?**

<details>
<summary>Show answer</summary>

For each repo: `git filter-repo --to-subdirectory-filter <name>`, then fetch into the monorepo and merge with `--allow-unrelated-histories`. Rename tags with prefixes, then update CI to path-based triggers.

</details>

**Q222. How do you manage dependency updates across hundreds of repos?**

<details>
<summary>Show answer</summary>

Renovate or Dependabot with shared presets, grouping and scheduling, auto-merge for low-risk updates with green CI, and dashboards tracking outdated dependencies.

</details>

**Q223. What problems arise when many repos depend on a shared library via Git submodules?**

<details>
<summary>Show answer</summary>

Version skew, forgotten submodule updates, CI auth complexity, and painful cross-repo changes. Publishing versioned packages or moving to a monorepo usually works better.

</details>

**Q224. How do you measure Git performance across developer machines?**

<details>
<summary>Show answer</summary>

Opt-in telemetry via trace2 (`GIT_TRACE2_EVENT` to a collector), which records command timings and regions. Analyze slow commands and tune configs or rollout settings.

</details>

**Q225. What is trace2?**

<details>
<summary>Show answer</summary>

Git's structured tracing framework that emits command timings, child processes and regions in JSON or performance formats, configurable via `trace2.*` settings or environment variables. It's useful for fleet-wide performance analysis.

</details>

**Q226. How do you manage Git configuration consistently across thousands of developer machines?**

<details>
<summary>Show answer</summary>

System-level gitconfig shipped by MDM or devcontainer images, Scalar for large repos, managed hooks via the pre-commit framework, and documented dotfiles defaults.

</details>

**Q227. Why are huge PRs a scale problem, not just a review problem?**

<details>
<summary>Show answer</summary>

They increase merge conflicts, CI time and risk, slow merge queues, and make rollbacks harder. Enforcing PR size limits and stacking keeps throughput high.

</details>

**Q228. What are stacked PRs and how do they help at scale?**

<details>
<summary>Show answer</summary>

A chain of small dependent PRs (A → B → C) reviewed and merged in order. They keep reviews small without blocking progress. Tools like Graphite, ghstack, `git rebase --update-refs` and GitLab stacked diffs help manage them.

</details>

**Q229. How do you keep main green with 500 merges per day?**

<details>
<summary>Show answer</summary>

A merge queue with batching and bisection on failure, fast pre-merge checks, a reliable test suite (quarantine flaky tests), and ownership-based automatic reverts for breakages.

</details>

**Q230. How does a merge queue with batching work?**

<details>
<summary>Show answer</summary>

It groups several queued PRs and tests them together on top of main. If the batch passes, all merge. If it fails, the queue bisects the batch to find and eject the failing PR.

</details>

**Q231. What's the cost of `git gc --aggressive`, and when should you use it?**

<details>
<summary>Show answer</summary>

It recomputes deltas with a large window, which is very CPU- and time-intensive. Use it rarely (e.g. after a major history rewrite or import), not routinely. Background maintenance is better for ongoing upkeep.

</details>

**Q232. How do you deal with a repository that has millions of loose objects?**

<details>
<summary>Show answer</summary>

Run `git gc` or `git repack -ad` to pack them, check why they accumulate (disabled auto-gc, tools creating objects), and enable `git maintenance` for incremental repacking.

</details>

**Q233. How do you handle binary assets in a game or ML monorepo?**

<details>
<summary>Show answer</summary>

Git LFS with locking for unmergeable assets, or specialized tools (Perforce for game assets, DVC for datasets). Keep source code in Git and large assets in storage designed for them.

</details>

**Q234. How do you manage Git LFS at scale?**

<details>
<summary>Show answer</summary>

Monitor storage and bandwidth, use an LFS server with object storage (Artifactory, GitLab, self-hosted), cache LFS in CI, prune old local LFS objects (`git lfs prune`), and avoid tracking frequently changing huge files.

</details>

**Q235. How does Microsoft handle the Windows monorepo in Git?**

<details>
<summary>Show answer</summary>

They built VFS for Git and later Scalar, plus Git improvements like partial clone, sparse checkout, commit-graph, multi-pack index and FSMonitor, many of which are now upstream in Git.

</details>

**Q236. How do you speed up checkouts when switching branches in a big repo?**

<details>
<summary>Show answer</summary>

Sparse checkout to reduce files, avoid switching by using worktrees for parallel branches, keep `core.preloadIndex` on (the default), and use fast storage (avoid network drives and antivirus on `.git`).

</details>

**Q237. Why might antivirus software slow Git dramatically on Windows?**

<details>
<summary>Show answer</summary>

It scans every file Git touches, especially many small object files. Exclude repo and `.git` directories (per security policy), or use a Dev Drive or WSL filesystem.

</details>

**Q238. How do you scale code review across many teams?**

<details>
<summary>Show answer</summary>

CODEOWNERS with team auto-assignment and load balancing, review SLAs, small PRs, automated checks handling style and lint, and dashboards for review latency.

</details>

**Q239. How do you enforce PR size limits?**

<details>
<summary>Show answer</summary>

A CI check that warns or fails above a line or file threshold (excluding generated files), with labels for exceptions and guidance to split work.

</details>

**Q240. How do you handle code generation outputs in a large repo?**

<details>
<summary>Show answer</summary>

Prefer generating in the build and not committing outputs. If committed, mark them as generated in `.gitattributes`, regenerate in CI to verify consistency, and exclude them from PR size limits.

</details>

**Q241. What metrics indicate your Git workflow is becoming a bottleneck?**

<details>
<summary>Show answer</summary>

Rising time to merge, merge queue wait times, CI duration, PR size, branch age, rebase or conflict frequency, and developer survey feedback on Git pain points.

</details>

**Q242. How do you reduce merge conflicts in high-churn files (e.g. route tables, dependency manifests)?**

<details>
<summary>Show answer</summary>

Split them into per-module files, use auto-registration patterns, sort entries deterministically, use union merge drivers where safe (changelogs), and regenerate lockfiles instead of merging them.

</details>

**Q243. How would you set up Git mirrors for teams in multiple continents?**

<details>
<summary>Show answer</summary>

Geo-replicated read replicas (GitLab Geo, GitHub Enterprise repository caching) or local mirrors updated on push. Developers and CI fetch locally and push to primary (or replicas proxy pushes).

</details>

**Q244. How do you handle repositories that exceed hosting platform limits?**

<details>
<summary>Show answer</summary>

Check the limits (file size, push size, repo size recommendations), move large files to LFS or artifact storage, split repos, and purge large history if needed.

</details>

**Q245. What's a multi-pack index (MIDX)?**

<details>
<summary>Show answer</summary>

An index spanning multiple packfiles, so Git can look up objects without repacking everything into one pack. It enables incremental repacking strategies at scale.

</details>

**Q246. How do you onboard a new developer to a huge monorepo quickly?**

<details>
<summary>Show answer</summary>

A scripted setup (Scalar clone with a team sparse profile, prebuilt devcontainer or dev environment, prefetched dependencies), plus docs explaining sparse checkout and build tooling.

</details>

**Q247. How do you handle cross-team changes in a polyrepo world, like an API change used by 30 services?**

<details>
<summary>Show answer</summary>

Version the API, deploy backward-compatible changes first, automate PRs across consumer repos (multi-gitter, Sourcegraph Batch Changes, Renovate), track adoption, then remove old versions.

</details>

**Q248. What's your approach to deleting stale branches automatically at scale?**

<details>
<summary>Show answer</summary>

Enable auto-delete on merge, run a scheduled job that reports and removes branches merged into main or inactive beyond a threshold (with protected exceptions), and notify owners before deletion.

</details>

**Q249. How do you keep Git hooks fast in large repos?**

<details>
<summary>Show answer</summary>

Run checks only on staged files (lint-staged, pre-commit's file filtering), cache tool environments, move heavy checks to pre-push or CI, and parallelize (Lefthook).

</details>

**Q250. How do you keep `git clone` times predictable for a growing repository?**

<details>
<summary>Show answer</summary>

Track clone time and repo size as metrics, keep binaries out (LFS), repack and maintain server-side, offer bundle URIs or mirrors, and default developers to partial clone via documented setup or Scalar.

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
