<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · GitOps & Infrastructure as Code

Questions 101–150 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q101. How do you structure Git repositories for GitOps in a company with 50 microservices?**

<details>
<summary>Show answer</summary>

Typically, app repos (source and Dockerfile, CI) are separate from a GitOps config repo (or a few per domain) holding Kubernetes manifests with base and overlays per environment and cluster. Argo CD ApplicationSets or Flux Kustomizations generate apps from folder structure.

</details>

**Q102. Why separate application source repos from GitOps config repos?**

<details>
<summary>Show answer</summary>

Config changes shouldn't trigger app builds, the reviewers differ (developers vs platform/SRE), the audit trail of what's deployed stays clean, and CI bots can update image tags without touching app history.

</details>

**Q103. How does an image tag get updated in the GitOps repo after CI builds?**

<details>
<summary>Show answer</summary>

CI opens a PR (or commits) changing the tag in the target overlay, or an image automation controller (Argo CD Image Updater, Flux image automation) writes the change back to Git.

</details>

**Q104. How do you promote a release from staging to production in GitOps?**

<details>
<summary>Show answer</summary>

Open a PR that copies the image tag (or chart version) from `overlays/staging` to `overlays/prod`. CODEOWNERS for prod approve, merge, and the agent syncs prod.

</details>

**Q105. Why are environment branches discouraged for GitOps?**

<details>
<summary>Show answer</summary>

They drift, require cherry-picks, make it hard to see differences between environments, and complicate promotion. Folders per environment on one branch give a clear diff and simple PR-based promotion.

</details>

**Q106. How do you roll back a production deployment in GitOps?**

<details>
<summary>Show answer</summary>

`git revert` the promotion commit on the GitOps repo and merge. The agent reconciles to the previous state. Argo CD's UI rollback is temporary unless Git is also updated.

</details>

**Q107. What happens if someone changes a resource with kubectl in a GitOps-managed cluster?**

<details>
<summary>Show answer</summary>

The agent detects drift. With self-heal enabled, it reverts the change to match Git; without it, the app shows OutOfSync until someone reconciles.

</details>

**Q108. How do you handle secrets in a GitOps repo?**

<details>
<summary>Show answer</summary>

Never store plain secrets. Use Sealed Secrets (encrypted for the cluster), SOPS with KMS or age (decrypted by Flux or Argo plugins), or External Secrets Operator referencing a secrets manager.

</details>

**Q109. How do you manage many clusters with Argo CD from Git?**

<details>
<summary>Show answer</summary>

An app-of-apps or ApplicationSet with cluster generators or Git directory generators, plus folder conventions like `clusters/<name>/` and `apps/<app>/overlays/<env>`, so adding a cluster or app is a Git change.

</details>

**Q110. How do you review Kubernetes changes effectively in PRs?**

<details>
<summary>Show answer</summary>

Render manifests in CI (`kustomize build`, `helm template`), post a diff against the live or target state (e.g. Argo CD diff, `kubectl diff`), and run policy checks (Kyverno, Conftest).

</details>

**Q111. What's the difference between push-based and pull-based deployment?**

<details>
<summary>Show answer</summary>

Push-based: CI applies changes to the cluster with cluster credentials. Pull-based (GitOps): an in-cluster agent pulls desired state from Git, so CI needs no cluster access and drift is continuously corrected.

</details>

**Q112. Your Argo CD application keeps flapping between Synced and OutOfSync. Common Git-related causes?**

<details>
<summary>Show answer</summary>

Fields mutated by controllers (replicas by HPA, injected sidecars) that differ from Git. Use `ignoreDifferences`, or don't set those fields in Git. Also check for non-deterministic rendering (timestamps, random suffixes).

</details>

**Q113. How do you structure Terraform code in Git for multiple environments?**

<details>
<summary>Show answer</summary>

Reusable modules in a `modules/` folder or separate versioned repos, with environment root configurations (`envs/dev`, `envs/prod`) referencing module versions via Git tags or a registry. Remote state is kept per environment.

</details>

**Q114. Why reference Terraform modules by Git tag rather than branch?**

<details>
<summary>Show answer</summary>

A branch reference changes underneath you, so the same code can produce different plans. A tag (`?ref=v1.4.0`) or registry version pins exactly reviewed code and makes upgrades deliberate.

</details>

**Q115. What should be in `.gitignore` for Terraform repos?**

<details>
<summary>Show answer</summary>

`.terraform/`, `*.tfstate`, `*.tfstate.backup`, `crash.log`, `*.tfvars` containing secrets, and override files. Do commit `.terraform.lock.hcl`.

</details>

**Q116. How do you implement PR-based Terraform workflows?**

<details>
<summary>Show answer</summary>

CI runs `fmt -check`, `validate`, `tflint`, security scans (tfsec, Checkov) and `plan`, posting the plan to the PR. After approval and merge, `apply` runs from main, or Atlantis or Terraform Cloud applies on PR commands with locking.

</details>

**Q117. Two PRs change the same Terraform environment. How do you avoid conflicting applies?**

<details>
<summary>Show answer</summary>

State locking (DynamoDB or a backend lock), serialized applies (Atlantis locks, CI concurrency groups), and replanning after merge so applies use the latest main.

</details>

**Q118. How do you detect infrastructure drift from Git?**

<details>
<summary>Show answer</summary>

Scheduled `terraform plan -detailed-exitcode` in CI alerting on non-empty plans, plus GitOps sync status for Kubernetes. Fix drift by updating Git or reverting the manual change.

</details>

**Q119. An engineer applied Terraform from their laptop with uncommitted changes. What's the problem and how do you prevent it?**

<details>
<summary>Show answer</summary>

Infrastructure no longer matches Git, and the change is unreviewed. Restrict apply credentials to CI, use remote backends with RBAC, and run drift detection.

</details>

**Q120. How do you version Helm charts in Git?**

<details>
<summary>Show answer</summary>

Bump `version` in `Chart.yaml` per change (SemVer), tag releases, publish to a chart repository (OCI registry or GitHub Pages via chart-releaser), and reference pinned chart versions in GitOps.

</details>

**Q121. How do you test GitOps changes before merging to the production folder?**

<details>
<summary>Show answer</summary>

Apply to dev and staging first through the same pipeline, use preview environments for app config, run policy and render checks in PR CI, and keep prod changes as separate promotion PRs.

</details>

**Q122. How would you design a GitOps repo so teams can self-serve without breaking others?**

<details>
<summary>Show answer</summary>

Per-team folders with CODEOWNERS, AppProjects in Argo CD restricting namespaces and resources, templates for new apps, policy checks in CI, and platform-owned base layers.

</details>

**Q123. What's an Argo CD sync wave and how does Git relate?**

<details>
<summary>Show answer</summary>

An annotation ordering resource application within a sync (e.g. CRDs before CRs, databases before apps). The ordering is defined in Git manifests, so rollout order is versioned and reviewable.

</details>

**Q124. How do you handle a hotfix in GitOps when the normal promotion flow takes hours?**

<details>
<summary>Show answer</summary>

Use a documented expedited path: a PR directly to the prod overlay with emergency approval, merge, verify, then backfill lower environments so they don't fall behind prod.

</details>

**Q125. How do you prevent someone from deploying an unscanned image via GitOps?**

<details>
<summary>Show answer</summary>

Policy in CI (block PRs with images not from your registry or without scan results), admission control in the cluster (Kyverno or Gatekeeper verifying signatures and attestations), and image references by digest.

</details>

**Q126. How do you keep GitOps commits readable when bots make hundreds of tag updates?**

<details>
<summary>Show answer</summary>

Consistent bot commit messages (`chore(deploy): payments 3f9a1c2 → staging`), squash or group updates, a dedicated bot identity, and links to the source PR or commit in the message.

</details>

**Q127. How do you audit "what was running in production last Tuesday at 14:00"?**

<details>
<summary>Show answer</summary>

Check out the GitOps repo at that time (`git rev-list -1 --before="2026-11-03 14:00" main`) and inspect the prod overlays. Argo CD's history and Git commit times confirm when syncs happened.

</details>

**Q128. How do you onboard a new cluster with GitOps?**

<details>
<summary>Show answer</summary>

Bootstrap the agent (`flux bootstrap` or Argo CD install pointing at the repo), add a `clusters/<name>` folder with cluster-specific values, and let ApplicationSets or Kustomizations deploy the standard platform stack from Git.

</details>

**Q129. How do you handle CRD upgrades safely through Git?**

<details>
<summary>Show answer</summary>

Manage CRDs separately (their own app or sync wave first), review breaking schema changes, test in lower environments, and avoid pruning CRDs automatically, since that deletes custom resources.

</details>

**Q130. What branch protection settings would you put on a GitOps production repo?**

<details>
<summary>Show answer</summary>

Required PRs and approvals, CODEOWNERS for prod paths, required CI (render, policy, diff), signed commits, no force pushes or deletions, and restricted bot bypass.

</details>

**Q131. How do you manage Ansible code in Git for a team?**

<details>
<summary>Show answer</summary>

Roles in separate repos or a `roles/` folder with versions pinned via `requirements.yml` (Git refs or tags), inventories per environment, `ansible-lint` and Molecule tests in CI, and vault-encrypted secrets or external lookups.

</details>

**Q132. How do you implement GitOps for Terraform?**

<details>
<summary>Show answer</summary>

Tools like Atlantis (PR comments run plan and apply), Terraform Cloud VCS-driven workspaces, or Flux's Terraform controller (tofu-controller), all treating Git as the source of truth with review before apply.

</details>

**Q133. Your GitOps repo grew to 100k files and Argo CD sync is slow. How do you improve it?**

<details>
<summary>Show answer</summary>

Split into multiple repos or apps by domain, use path-scoped applications and webhooks instead of polling, tune repo-server caching, and avoid rendering huge Helm charts unnecessarily.

</details>

**Q134. What's the benefit of tagging GitOps repo states for releases?**

<details>
<summary>Show answer</summary>

Tags mark known-good combinations of service versions across environments, making it easy to roll back an entire platform release or reproduce a past state.

</details>

**Q135. How do you manage multi-tenant GitOps where teams shouldn't see each other's configs?**

<details>
<summary>Show answer</summary>

Separate repos per tenant with their own access controls, Argo CD AppProjects per team, and a platform repo referencing tenant repos.

</details>

**Q136. An Argo CD app points at `HEAD` of a branch. What's the risk?**

<details>
<summary>Show answer</summary>

Any merge immediately deploys, and you lose an explicit promotion step. That's fine for dev, but for prod, many teams point at a specific tag or folder updated only via approved promotion PRs.

</details>

**Q137. How do you test Terraform modules before releasing a new tag?**

<details>
<summary>Show answer</summary>

Run `terraform validate`, tflint, Terratest or `terraform test` in CI against ephemeral accounts, then create a SemVer tag. Consumers upgrade by changing the `ref`.

</details>

**Q138. How do you handle environment-specific values without duplicating manifests?**

<details>
<summary>Show answer</summary>

Kustomize bases with overlays (patches per environment), or Helm with values files per environment, so shared config lives once and differences are small, reviewable files.

</details>

**Q139. How do you make sure IaC changes in Git have cost visibility?**

<details>
<summary>Show answer</summary>

Run Infracost (or similar) in PR CI, posting cost diffs to the PR, and require approval above thresholds.

</details>

**Q140. How do you prevent `terraform destroy` from being triggered by a Git change?**

<details>
<summary>Show answer</summary>

Lifecycle `prevent_destroy` on critical resources, plan review rules that block plans with deletions of protected resources, separate credentials for destructive actions, and required approvals.

</details>

**Q141. How should a platform team version shared GitHub Actions or GitLab CI templates?**

<details>
<summary>Show answer</summary>

Keep them in a dedicated repo, release with SemVer tags, and have consumers reference tags or SHAs (`uses: org/actions/build@v2` or `include: project: ref: v2.1.0`), with release notes for breaking changes.

</details>

**Q142. How do you handle a GitOps repo outage (platform down)?**

<details>
<summary>Show answer</summary>

Agents keep running the last synced state. Changes wait until Git is back, or a mirror is used if agents are configured with fallback sources. A Git outage is a delivery outage, not a runtime outage.

</details>

**Q143. What does "everything as code" mean for a DevOps team using Git?**

<details>
<summary>Show answer</summary>

Application code, infrastructure, Kubernetes config, pipelines, policies, dashboards, alerts and even repo settings all live in Git, reviewed via PRs and applied by automation, giving one auditable workflow.

</details>

**Q144. How do you ensure secrets referenced in GitOps exist before deployment?**

<details>
<summary>Show answer</summary>

Use External Secrets with health checks, sync waves so secrets reconcile before workloads, and CI validation that referenced secret names exist in the secrets manager.

</details>

**Q145. How do you migrate from push-based Helm deploys in CI to GitOps?**

<details>
<summary>Show answer</summary>

Export current releases' values into Git, create Argo CD or Flux apps pointing at those values with the same chart versions, adopt existing resources, then remove CI deploy steps and cluster credentials from CI.

</details>

**Q146. How do you do canary deployments with GitOps?**

<details>
<summary>Show answer</summary>

Use Argo Rollouts or Flagger. Git defines the Rollout strategy, and a new image tag commit triggers progressive traffic shifting with automated analysis and rollback.

</details>

**Q147. How do you keep Terraform provider and module upgrades under control in Git?**

<details>
<summary>Show answer</summary>

Commit `.terraform.lock.hcl`, use Dependabot or Renovate for provider and module bumps, run plan in PRs to review the impact, and upgrade one environment at a time.

</details>

**Q148. How do you structure GitOps for a disaster recovery region?**

<details>
<summary>Show answer</summary>

A cluster folder for the DR region referencing the same app bases with DR-specific overlays. Rebuilding DR is pointing a fresh agent at the repo, and periodic DR drills validate it.

</details>

**Q149. What's the most common GitOps anti-pattern you'd look for in an interview?**

<details>
<summary>Show answer</summary>

Plain secrets in Git, environment branches with cherry-picks, manual kubectl changes, mutable image tags like `latest`, and CI holding cluster-admin credentials, which defeats the pull model.

</details>

**Q150. How do you make GitOps promotion PRs safe to auto-merge for non-production environments?**

<details>
<summary>Show answer</summary>

Require green render, policy and diff checks, restrict auto-merge to bot-authored tag bumps in dev/staging paths via CODEOWNERS and rulesets, and keep production paths requiring human approval.

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
