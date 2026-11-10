<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Git in CI/CD Pipelines

Questions 51–100 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q51. How do you design Git triggers for a typical CI/CD pipeline?**

<details>
<summary>Show answer</summary>

PRs run build, tests, linting and security scans. A merge to main builds the image tagged with the SHA and deploys to staging. Tags `v*` create releases and deploy to production. Schedules run nightly e2e tests and history scans.

</details>

**Q52. Why does a GitHub Actions `pull_request` run check out a commit that doesn't exist on your branch?**

<details>
<summary>Show answer</summary>

It checks out a temporary merge commit of the PR head into the base branch (`refs/pull/N/merge`) to test the merge result. Use `github.event.pull_request.head.sha` when you need the PR's own commit.

</details>

**Q53. What's the risk of `pull_request_target` in GitHub Actions?**

<details>
<summary>Show answer</summary>

It runs in the base repo context with secrets and write tokens. If the workflow checks out and runs the PR's code, a malicious fork can steal secrets. Only use it for trusted metadata tasks like labeling.

</details>

**Q54. Your CI needs full history for SonarQube blame and changelog generation, but clones are slow. What do you do?**

<details>
<summary>Show answer</summary>

Use `fetch-depth: 0` only in jobs that need it, or partial clone (`--filter=blob:none`) to keep full history without all blob contents. Keep other jobs shallow.

</details>

**Q55. CI changelog generation outputs nothing. Why?**

<details>
<summary>Show answer</summary>

The clone is shallow and tags weren't fetched, so the range `lastTag..HEAD` can't be computed. Fetch tags and enough history (`fetch-depth: 0` or `git fetch --tags --unshallow`).

</details>

**Q56. How do you run CI jobs only when specific folders change?**

<details>
<summary>Show answer</summary>

GitHub Actions `on.push.paths` / `pull_request.paths` or `dorny/paths-filter`; GitLab `rules: changes:`; Jenkins `changeset` conditions. In monorepos, use Nx, Turborepo or Bazel "affected" commands.

</details>

**Q57. Path filters made a required check never run, so PRs are blocked forever. How do you fix it?**

<details>
<summary>Show answer</summary>

Required checks must report a status. Use a job that always runs and decides internally (skipped jobs report success), or a paths-filter step with conditional steps, instead of workflow-level path filters for required checks.

</details>

**Q58. How do you compute a version in CI from Git?**

<details>
<summary>Show answer</summary>

Use `git describe --tags --always` for snapshot builds, SemVer from tags for releases, or tools like GitVersion, semantic-release and release-please. Always include the short SHA for traceability.

</details>

**Q59. How should container images be tagged in CI?**

<details>
<summary>Show answer</summary>

With the immutable commit SHA (`app:3f9a1c2`), plus a SemVer tag for releases and optionally a moving `main` tag for convenience. Add OCI labels for source and revision.

</details>

**Q60. Your pipeline commits a version bump back to main, which triggers the pipeline again, endlessly. Fix?**

<details>
<summary>Show answer</summary>

Skip CI for bot commits (`[skip ci]` in the message, or filter `github.actor`), use a token that doesn't trigger workflows, or have the bot open a PR instead.

</details>

**Q61. Why doesn't a push made with `GITHUB_TOKEN` trigger other workflows?**

<details>
<summary>Show answer</summary>

GitHub deliberately prevents events created with the default `GITHUB_TOKEN` from triggering new workflow runs (except `workflow_dispatch` and `repository_dispatch`) to avoid recursion. Use a GitHub App token if triggering is required.

</details>

**Q62. How do you give CI read access to private dependency repos (submodules, Go modules, Terraform modules)?**

<details>
<summary>Show answer</summary>

Use a GitHub App installation token or deploy keys scoped to those repos, and configure Git URL rewriting: `git config --global url."https://x-access-token:$TOKEN@github.com/".insteadOf "https://github.com/"`.

</details>

**Q63. How does GitLab CI's `CI_JOB_TOKEN` relate to Git access?**

<details>
<summary>Show answer</summary>

It's a short-lived token per job that can clone the project and, if allowed by the target project's job token allowlist, other projects' repos and packages, with no long-lived credentials needed.

</details>

**Q64. What's the difference between `GIT_STRATEGY: clone`, `fetch` and `none` in GitLab CI?**

<details>
<summary>Show answer</summary>

`clone` makes a fresh clone per job (clean, slower), `fetch` reuses the existing working copy and fetches updates (faster), and `none` skips Git entirely (for jobs using only artifacts).

</details>

**Q65. How do you speed up checkout in Jenkins for a large repo?**

<details>
<summary>Show answer</summary>

Shallow clone with depth, reference repositories (local mirror with `--reference`), sparse checkout paths, disabled tag fetching where possible, and persistent agents with workspace reuse.

</details>

**Q66. How do you make CI fail when commit messages don't follow conventions?**

<details>
<summary>Show answer</summary>

Run commitlint against `origin/main..HEAD` in the PR pipeline, and validate PR titles if squash-merging. Make it a required check.

</details>

**Q67. How do you prevent secrets from entering the repo via CI?**

<details>
<summary>Show answer</summary>

Run gitleaks or trufflehog on PR diffs as a required check, enable platform push protection, and scan full history on a schedule.

</details>

**Q68. Your monorepo's CI runs all 80 service pipelines for every PR. How do you redesign it?**

<details>
<summary>Show answer</summary>

Compute changed paths against the merge base (`git diff --name-only origin/main...HEAD`), map them to services with a dependency graph, and trigger only affected pipelines (child pipelines or matrix jobs).

</details>

**Q69. How do you compute changed files reliably in a PR pipeline?**

<details>
<summary>Show answer</summary>

Fetch the base branch and use the merge base: `git fetch origin main --depth=100 && git diff --name-only $(git merge-base origin/main HEAD)...HEAD`, deepening the fetch if the merge base isn't found.

</details>

**Q70. What's a merged-results pipeline, and why use it?**

<details>
<summary>Show answer</summary>

A GitLab feature that runs MR pipelines on the result of merging the MR into the target branch. It catches integration breakages before merge; merge trains extend this to queued MRs.

</details>

**Q71. How do you protect production deploy jobs so only main can trigger them?**

<details>
<summary>Show answer</summary>

GitHub Environments with deployment branch policies (only `main` or tags) and required reviewers; GitLab protected environments and `rules: if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH`.

</details>

**Q72. How do you publish a GitHub release automatically when a tag is pushed?**

<details>
<summary>Show answer</summary>

A workflow on `push: tags: ['v*.*.*']` that builds artifacts and uses `gh release create` or a release action with generated notes, with `permissions: contents: write`.

</details>

**Q73. How do you ensure the tag being released points to a commit that passed CI on main?**

<details>
<summary>Show answer</summary>

In the release job, verify `git merge-base --is-ancestor $GITHUB_SHA origin/main`, and query the commit's check status via API before publishing. Better still, let CI create tags only after green builds.

</details>

**Q74. What does `actions/checkout` do by default regarding credentials?**

<details>
<summary>Show answer</summary>

It persists the token in the local Git config so later steps can push. Set `persist-credentials: false` if later steps don't need to push, reducing exposure to third-party actions.

</details>

**Q75. How do you handle Git LFS in CI efficiently?**

<details>
<summary>Show answer</summary>

Enable LFS only in jobs that need the files, cache `.git/lfs` between runs, and use `git lfs pull --include` for specific paths. Watch bandwidth quotas.

</details>

**Q76. Your CI caches `node_modules` keyed on branch name, and builds randomly break. Better key?**

<details>
<summary>Show answer</summary>

Key caches on the lockfile hash (`hashFiles('package-lock.json')`), with restore-keys for fallbacks, not on branch names.

</details>

**Q77. How do you run linting only on changed files in a PR for speed?**

<details>
<summary>Show answer</summary>

Compute changed files from the merge base and pass them to linters (e.g. `lint-staged` style or `pre-commit run --from-ref origin/main --to-ref HEAD`), while running full lint on main nightly.

</details>

**Q78. How can you reuse the same quality checks locally and in CI?**

<details>
<summary>Show answer</summary>

The pre-commit framework: developers install hooks locally, and CI runs `pre-commit run --all-files` (or `--from-ref/--to-ref`), keeping one source of truth.

</details>

**Q79. Your CI builds on every branch push, overloading runners. How do you reduce load?**

<details>
<summary>Show answer</summary>

Run full pipelines only on PRs and main, cancel superseded runs (concurrency groups with cancel-in-progress, GitLab interruptible jobs), and skip draft PRs or docs-only changes.

</details>

**Q80. How do you implement preview environments per PR with Git?**

<details>
<summary>Show answer</summary>

On PR open or update, deploy to a namespace or URL derived from the PR number or branch name (sanitized). On close or merge, tear it down. Post the URL to the PR.

</details>

**Q81. How does Jenkins Multibranch Pipeline use Git?**

<details>
<summary>Show answer</summary>

It scans the repository for branches (and PRs with a plugin) containing a Jenkinsfile and creates a job per branch automatically, building on pushes via webhooks.

</details>

**Q82. Why use webhooks instead of polling Git in CI?**

<details>
<summary>Show answer</summary>

Webhooks trigger builds immediately on push or PR events and avoid load from frequent polling. Verify webhook signatures and keep polling only as a fallback.

</details>

**Q83. A pipeline should run only when a commit message contains `[deploy]`. Good idea?**

<details>
<summary>Show answer</summary>

It works (`if: contains(github.event.head_commit.message, '[deploy]')`), but deployment decisions are better controlled by branches, tags, environments and approvals, which are auditable and harder to trigger accidentally.

</details>

**Q84. How do you make CI reproducible for a given commit?**

<details>
<summary>Show answer</summary>

Pin tool versions and images by digest, use lockfiles, avoid fetching "latest" anything, record the commit SHA, and keep pipeline definitions in the same repo (pipeline as code).

</details>

**Q85. How do you enforce that the CI configuration file itself can't be changed without DevOps approval?**

<details>
<summary>Show answer</summary>

CODEOWNERS on `.github/workflows/` or `.gitlab-ci.yml`, required code owner review, and, on GitLab, a compliance pipeline or external CI config that projects can't override.

</details>

**Q86. How do you handle a requirement to deploy a specific commit to production manually?**

<details>
<summary>Show answer</summary>

A `workflow_dispatch` (or manual GitLab job) with a SHA or tag input, validating that it's on main and passed CI, plus environment approval.

</details>

**Q87. How do you detect that a PR changes infrastructure code and require an extra approval?**

<details>
<summary>Show answer</summary>

Path-based CODEOWNERS for `terraform/` or `k8s/`, and a CI job that posts `terraform plan` to the PR with a required "infra" check.

</details>

**Q88. What is pipeline as code, and how does Git enable it?**

<details>
<summary>Show answer</summary>

Defining CI/CD pipelines in versioned files (Jenkinsfile, `.gitlab-ci.yml`, workflow YAML) in the repo. Git gives pipelines review, history, branching and rollback like application code.

</details>

**Q89. Your pipeline runs `git push` to a protected branch and gets rejected. How should it be designed?**

<details>
<summary>Show answer</summary>

Have the pipeline open a PR, or give its app identity a narrowly scoped bypass in rulesets. Avoid giving broad admin tokens to CI.

</details>

**Q90. How do you add a "deployed to production" record to Git history without changing commits?**

<details>
<summary>Show answer</summary>

Use git notes (`git notes --ref=deploys add -m "prod 2026-11-10" <sha>`), a lightweight tag per deployment (`deploy/prod/2026-11-10-1`), or the platform's deployments API.

</details>

**Q91. How do you validate Kubernetes manifests in CI before they reach the GitOps repo?**

<details>
<summary>Show answer</summary>

Run `kubeconform` or `kubeval`, policy checks (OPA Conftest, Kyverno CLI), `kustomize build` or `helm template` rendering, and diff previews against the live state.

</details>

**Q92. How do you implement trunk-based CI that keeps main always releasable?**

<details>
<summary>Show answer</summary>

Fast PR checks (under 10 minutes), a merge queue, full test suites on main with immediate revert on failure, feature flags, and automated deploys with canaries.

</details>

**Q93. How do you speed up `git fetch` in long-lived CI workspaces?**

<details>
<summary>Show answer</summary>

Enable `fetch.writeCommitGraph`, run periodic maintenance on runner caches, fetch only needed refs (`git fetch origin main --depth 50`), and prune stale refs.

</details>

**Q94. How do you ensure CI uses the same Git version everywhere?**

<details>
<summary>Show answer</summary>

Pin it in runner images (or install a specific version in the job), and track Git security releases so you can update quickly.

</details>

**Q95. How do you pass the commit SHA into an application at build time?**

<details>
<summary>Show answer</summary>

Build args or env vars (`--build-arg GIT_SHA=$(git rev-parse HEAD)`), a generated `version.json`, and OCI labels, exposing it via a `/version` endpoint.

</details>

**Q96. How do you enforce linear history from CI if the platform setting isn't available?**

<details>
<summary>Show answer</summary>

A CI check that fails if the PR contains merge commits (`git rev-list --merges origin/main..HEAD` non-empty) and squash or rebase merges only.

</details>

**Q97. How do you prevent CI from running on forks without approval in GitHub?**

<details>
<summary>Show answer</summary>

Configure "require approval for first-time contributors" (or for all outside contributors) in Actions settings, and keep secrets unavailable to fork PR workflows.

</details>

**Q98. How would you migrate CI from Jenkins to GitHub Actions while keeping Git workflows stable?**

<details>
<summary>Show answer</summary>

Keep branch and tag conventions unchanged, run both pipelines in parallel on PRs, map triggers (webhooks to `on:`), use GitHub Actions Importer to bootstrap, then switch required checks and retire Jenkins jobs.

</details>

**Q99. How do you test a pipeline change without breaking main for everyone?**

<details>
<summary>Show answer</summary>

Change it in a PR. Most platforms run the PR's version of the pipeline. Use branch-specific test deploys and `workflow_dispatch` on the branch before merging.

</details>

**Q100. How do you stop a long-running CI pipeline from deploying an outdated commit after a newer one merged?**

<details>
<summary>Show answer</summary>

Use concurrency controls (GitHub `concurrency` groups with cancel-in-progress, GitLab `resource_group` and interruptible jobs), and have the deploy job verify that its SHA is still the tip of the target branch before applying.

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
