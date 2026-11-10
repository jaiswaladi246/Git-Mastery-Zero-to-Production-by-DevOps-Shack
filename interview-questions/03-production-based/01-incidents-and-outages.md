<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Production Incidents & Outages

Questions 1–50 of the production-based questions bank. Try answering each one out loud before opening the answer.

---

**Q1. A deployment from main broke production. The pipeline auto-deploys every merge. What's your first move with Git?**

<details>
<summary>Show answer</summary>

Restore service first: redeploy the previous known-good artifact (or let the CD tool roll back). Then `git revert` the offending commit or PR on main so main matches what's safe to deploy, and investigate on a branch.

</details>

**Q2. How do you quickly find which change caused a production regression when 40 PRs merged today?**

<details>
<summary>Show answer</summary>

Compare the last good deployment SHA with the bad one (`git log --oneline good..bad --first-parent`), correlate with error start times, and if unclear, `git bisect` on first-parent merges with an automated reproduction test.

</details>

**Q3. Production is running a build nobody can find in Git. How did that happen, and how do you prevent it?**

<details>
<summary>Show answer</summary>

Someone built and deployed from a local machine or an untracked branch. Prevent it by only deploying CI-built artifacts tagged with the commit SHA, blocking manual pushes to the registry, and recording deployment metadata.

</details>

**Q4. An engineer force-pushed main during an incident to "clean up" and wiped the hotfix. How do you handle it in the moment and afterwards?**

<details>
<summary>Show answer</summary>

In the moment, restore main from the deployed SHA or someone's clone with `--force-with-lease`, and verify the hotfix is present. Afterwards, block force pushes on main for everyone including admins, and run a blameless postmortem.

</details>

**Q5. During an outage, the Git platform itself (GitHub/GitLab) is down. How do you still ship a hotfix?**

<details>
<summary>Show answer</summary>

Every clone is a full repo: commit locally, build from the local clone through your break-glass pipeline or runbook, and push to a secondary mirror if your CD can read from it. Reconcile with the primary once it's back.

</details>

**Q6. Your CI started failing for every PR at 10 AM, but no code changed. How do you check whether Git is the cause?**

<details>
<summary>Show answer</summary>

Look for changes to shared refs: force pushes to main, a deleted tag CI depends on, submodule pointer changes, protected branch rule changes, a Git version upgrade on runners, or a new `.gitattributes`. Check audit logs and the runner image changelog.

</details>

**Q7. A Helm chart in your GitOps repo was changed directly in the cluster with kubectl during an incident. What happens next and what should you do?**

<details>
<summary>Show answer</summary>

Argo CD or Flux flags drift and, with self-heal on, reverts it. Commit the emergency change to Git through a fast-tracked PR so Git and the cluster agree, then review whether the emergency process needs a documented break-glass path.

</details>

**Q8. A bad config commit propagated to 200 clusters via GitOps. How do you roll back fastest?**

<details>
<summary>Show answer</summary>

`git revert` the commit on the GitOps repo's main branch and push (with emergency approval). All agents reconcile back. If sync waves or progressive rollout exist, pause them first.

</details>

**Q9. A release tag was deleted from the remote and the production deploy pipeline (which deploys by tag) failed. Recovery?**

<details>
<summary>Show answer</summary>

Recreate the tag from a clone that has it or from the deploy record's SHA (`git tag -a vX <sha> -m ...`, then push). Then protect `v*` tags against deletion.

</details>

**Q10. An engineer accidentally merged a 10,000-file auto-generated change into main, slowing every clone and CI job. What do you do?**

<details>
<summary>Show answer</summary>

Revert it on main immediately. If clone size is the problem and the change is fresh, coordinate a history rewrite only if the business impact justifies it. Otherwise rely on partial clone, and add CI checks for change size and generated files.

</details>

**Q11. Your merge queue is stuck and nobody can merge. What do you check?**

<details>
<summary>Show answer</summary>

A failing required check on the queue's combined build, a flaky test, a changed required-check name, runner capacity, or a PR blocking the head of the queue. Remove the blocking PR, fix the check config, then re-queue.

</details>

**Q12. Two teams merged incompatible changes within minutes, and main is red. How would you have prevented this?**

<details>
<summary>Show answer</summary>

A merge queue (or merge trains) that tests each PR on top of main plus queued PRs, or "require branches up to date before merging". Main CI must run on every merge.

</details>

**Q13. A production hotfix was made on a release branch at 3 AM and never merged to main. Two weeks later the bug returned. What's the systemic fix?**

<details>
<summary>Show answer</summary>

Automate forward-merges or backport tracking: a bot opens PRs from release branches to main, CI fails if a release-only commit lacks a main counterpart, and hotfix checklists require the main PR link.

</details>

**Q14. Your on-call engineer needs to know exactly what changed in production in the last 24 hours. How do you give them that from Git?**

<details>
<summary>Show answer</summary>

Deploy records (SHAs per environment), then `git log --first-parent <prev-sha>..<current-sha>` showing merged PRs with links. GitOps repos make this even easier, since every environment change is a commit.

</details>

**Q15. A config change was made directly on the server and later overwritten by a deploy. How do you stop configuration drift?**

<details>
<summary>Show answer</summary>

Keep all config in Git (IaC/GitOps), deploy only via pipelines, use drift detection (`terraform plan` in CI, GitOps diff), and block manual changes with RBAC.

</details>

**Q16. The deploy pipeline uses `git pull` on production servers. Why is that risky, and what's better?**

<details>
<summary>Show answer</summary>

It can deploy unreviewed or partially fetched states, needs Git credentials on servers, and leaves no artifact traceability. Build immutable artifacts in CI and deploy those (container images, packages), or use GitOps agents that pull declarative state.

</details>

**Q17. A developer committed directly to the production config repo and it auto-applied. What controls were missing?**

<details>
<summary>Show answer</summary>

Branch protection with required PR review on the config repo, CODEOWNERS for production paths, a required plan/diff check, and environment approvals before apply.

</details>

**Q18. Your release automation created duplicate tags `v4.2.0` and `v4.2.0-2` due to a race. How do you fix the process?**

<details>
<summary>Show answer</summary>

Serialize release jobs (concurrency groups or locks), generate versions in a single job on main only, and fail the job if the tag already exists instead of auto-suffixing.

</details>

**Q19. A Terraform state file was committed to Git and contains secrets. What do you do?**

<details>
<summary>Show answer</summary>

Rotate the exposed secrets, purge the state file from history, add `*.tfstate*` to `.gitignore`, move state to a remote backend (S3 + DynamoDB lock, Terraform Cloud) with encryption, and add a pre-commit block.

</details>

**Q20. After a major incident, leadership asks "which commit and who approved it?" How do you answer reliably?**

<details>
<summary>Show answer</summary>

From the deployment record SHA, open the commit and its PR (author, reviewers, approvals, CI results), plus the environment approval in CD and the platform audit log. Keep this traceability standardized so it takes minutes, not hours.

</details>

**Q21. A flaky test in main CI makes engineers re-run pipelines constantly. How do you handle it with Git workflow controls?**

<details>
<summary>Show answer</summary>

Quarantine the flaky test (track in an issue), don't disable required checks globally, make the merge queue retry once, and assign ownership via CODEOWNERS for test areas.

</details>

**Q22. An engineer accidentally deleted the `main` branch on the remote. How do you restore it?**

<details>
<summary>Show answer</summary>

Push it back from any up-to-date clone (`git push origin <sha>:refs/heads/main`), restore it as the default branch if needed, and protect it against deletion. Platforms often allow restoring deleted branches from the UI shortly after.

</details>

**Q23. Production started failing after a dependency bump PR from Renovate merged automatically. What changes do you make?**

<details>
<summary>Show answer</summary>

Require CI to cover the affected area before auto-merge, restrict auto-merge to patch versions or low-risk packages, group updates, and add canary deployments.

</details>

**Q24. How do you correlate application errors to specific commits in production?**

<details>
<summary>Show answer</summary>

Inject the commit SHA into builds (env var, build info endpoint, OCI label), send it as the release version to error tracking (e.g. Sentry release), and link it back to Git and the PR.

</details>

**Q25. Your deployment rollback via `git revert` conflicts because later commits depend on the bad one. What do you do?**

<details>
<summary>Show answer</summary>

Roll back by redeploying the previous artifact first (fast and conflict-free), then revert the dependent commits together or fix forward on main.

</details>

**Q26. A GitOps sync was paused during an incident and forgotten for a week. What risk does that create?**

<details>
<summary>Show answer</summary>

Git and the cluster drift: merged changes aren't applied, and someone later resuming sync deploys a week of changes at once. Alert on paused or out-of-sync applications.

</details>

**Q27. A secret scanner alert fires on main for an old commit. Is it an incident?**

<details>
<summary>Show answer</summary>

Treat it as one until proven otherwise: validate whether the credential is real and active, rotate it if so, document the result, and purge history if the exposure risk warrants it.

</details>

**Q28. How do you handle a situation where CI was green but the merge commit on main fails?**

<details>
<summary>Show answer</summary>

The PR was tested against an older main. Revert or fix forward quickly, and adopt merge queues or "require up to date" to test the actual merge result.

</details>

**Q29. Your team discovered that a production server was running code from a feature branch for weeks. How do you prevent unapproved branches from deploying?**

<details>
<summary>Show answer</summary>

Restrict production deploys to main or tags with environment protection rules (deployment branch policies), and require approvals and audit for production environments.

</details>

**Q30. An incident requires temporarily disabling a feature. Is a Git revert the best tool?**

<details>
<summary>Show answer</summary>

Usually a feature flag toggle is faster and safer: no deploy, instant and reversible. Use Git reverts when no flag exists, and add flags for risky features afterwards.

</details>

**Q31. After an outage caused by a merge conflict resolved badly, what review practice would you introduce?**

<details>
<summary>Show answer</summary>

Require reviewing merge resolutions (`git show --remerge-diff`), prefer small PRs and frequent integration, and run full CI on merge commits.

</details>

**Q32. How do you write a blameless postmortem that involves a Git mistake?**

<details>
<summary>Show answer</summary>

Focus on the system: why the force push was possible, why review didn't catch it, missing protections or automation. Record a timeline with SHAs and add corrective actions like protections, hooks, docs or training.

</details>

**Q33. Your rollback to the previous image failed because the previous tag was overwritten in the registry. What's the lesson?**

<details>
<summary>Show answer</summary>

Use immutable image tags (commit SHA), enable registry tag immutability, and never re-use version tags.

</details>

**Q34. A developer reverted a commit on main, but the revert itself broke something. Then they reverted the revert. How do you keep this from becoming chaos?**

<details>
<summary>Show answer</summary>

Pause merges to main, identify the last good state, apply one clear corrective PR with tests, and communicate in the incident channel. Use a merge queue to serialize changes.

</details>

**Q35. An incident requires checking whether a vulnerable library version was ever deployed. How do you use Git history?**

<details>
<summary>Show answer</summary>

Search lockfile history: `git log -S "lib@1.2.3" -- package-lock.json` across release tags, map those commits to deployment records, and identify affected releases.

</details>

**Q36. Your team's "hotfix" bypasses PR review for speed. How do you balance speed and control?**

<details>
<summary>Show answer</summary>

Allow an expedited path with one approver and a reduced test set, but never bypass protection silently. Use emergency change labels and post-incident review, and tune CI so the normal path is fast enough.

</details>

**Q37. A cron job in production uses scripts pulled from a Git repo's main branch at runtime. What can go wrong?**

<details>
<summary>Show answer</summary>

Any merge immediately changes production behavior without a deploy step, and if the platform is down, jobs fail. Pin to tags or SHAs, and package scripts into versioned artifacts.

</details>

**Q38. A large customer reports a regression introduced "sometime last month". How do you narrow it with Git?**

<details>
<summary>Show answer</summary>

Identify the customer's deployed version history, list releases between good and bad (`git log --oneline vGood..vBad --first-parent`), and bisect across release tags first, then within the bad release.

</details>

**Q39. Your CD tool deployed an older commit because a branch was reset. How could this happen?**

<details>
<summary>Show answer</summary>

The CD tool tracks a branch, and someone moved that branch backward (reset plus force push). Protect deployment branches against force pushes and have CD deploy immutable SHAs or tags.

</details>

**Q40. An engineer committed a change to `.gitattributes` and suddenly all files appear modified for everyone. What happened and how do you resolve it?**

<details>
<summary>Show answer</summary>

Changed `text`/`eol` rules alter normalization, so Git sees line-ending differences. Revert the change, or commit a renormalization (`git add --renormalize .`) in a coordinated PR and tell everyone to pull.

</details>

**Q41. How do you prove to auditors that an emergency production change was later reviewed?**

<details>
<summary>Show answer</summary>

Link the emergency commit or PR to a retroactive review PR or ticket with approvals, keep an emergency change log with SHAs, and show audit-log entries for any bypasses.

</details>

**Q42. Your release branch build fails because a base image tag used two years ago was deleted. How do you prevent this?**

<details>
<summary>Show answer</summary>

Pin base images by digest, mirror them to an internal registry, and run scheduled builds on supported release branches to detect breakage early.

</details>

**Q43. Monitoring shows a spike right after a commit labeled "minor refactor". How do you verify causality?**

<details>
<summary>Show answer</summary>

Confirm the commit is in the deployed SHA range, deploy the parent commit to a canary or staging to compare, check the diff for performance-sensitive changes, and use `git bisect` with a benchmark if needed.

</details>

**Q44. A merge to main triggered deployments to all regions at once and caused a global outage. How should the delivery be redesigned?**

<details>
<summary>Show answer</summary>

Progressive delivery: deploy to canary, then one region, then the rest, with automated analysis gates. In GitOps, promote per region via separate folders or ApplicationSets with sync waves.

</details>

**Q45. During an incident, multiple engineers push fixes to the same branch simultaneously. How do you coordinate?**

<details>
<summary>Show answer</summary>

Assign one incident commander and one person who merges. Others open PRs or share patches. Keep fixes small and use `--force-with-lease` never on shared branches.

</details>

**Q46. A bot account with write access was compromised and pushed malicious commits. What controls limit the blast radius?**

<details>
<summary>Show answer</summary>

Least-privilege tokens (fine-grained, single repo), required PR reviews even for bots on main, signed commits required, rulesets restricting bot bypass, token expiry, and audit-log alerting.

</details>

**Q47. How do you test your Git disaster recovery plan?**

<details>
<summary>Show answer</summary>

Periodically restore a repo from the mirror backup into a sandbox org, run its CI, verify branches, tags and LFS objects, measure time to restore, and document the gaps.

</details>

**Q48. Production configuration lives in a branch per environment, and prod is missing a change that staging has. How do you find the gap?**

<details>
<summary>Show answer</summary>

`git log --oneline prod..staging` and `git diff prod staging -- config/`. Longer term, move to folder-per-environment on one branch so differences are explicit.

</details>

**Q49. A post-incident review shows engineers didn't know how to recover with reflog. What do you do?**

<details>
<summary>Show answer</summary>

Add reflog recovery to onboarding, run a hands-on lab (like this repository's reflog and incident labs), and add a recovery cheat sheet to your engineering handbook.

</details>

**Q50. What Git-related metrics would you monitor to catch problems early?**

<details>
<summary>Show answer</summary>

Main branch CI success rate, time-to-merge, PR size, merge queue wait, branch age, force-push events on protected branches, secret scanning alerts, repo size growth and LFS usage.

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
