<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Remotes, Collaboration, Power Tools & Production Git

Questions 251–300 of the concept-based questions bank. Try answering each one out loud before opening the answer.

---

**Q251. What is a remote-tracking branch?**

<details>
<summary>Show answer</summary>

A read-only local ref like `origin/main` that records where a branch was on the remote at your last fetch. It's updated by `fetch`, `pull` and `push`, never by committing.

</details>

**Q252. What is a refspec?**

<details>
<summary>Show answer</summary>

A mapping between remote and local refs, such as `+refs/heads/*:refs/remotes/origin/*`. It tells fetch and push what to transfer and where to store it; `+` allows non-fast-forward updates.

</details>

**Q253. How do you fetch a GitHub pull request locally?**

<details>
<summary>Show answer</summary>

`git fetch origin pull/123/head:pr-123` then `git switch pr-123`. On GitLab, use `merge-requests/45/head`. The `gh pr checkout 123` CLI does this for you.

</details>

**Q254. What does `git fetch --prune` do?**

<details>
<summary>Show answer</summary>

It deletes remote-tracking branches whose branches no longer exist on the remote. `fetch.prune true` makes it automatic.

</details>

**Q255. Why is a push rejected as "non-fast-forward"?**

<details>
<summary>Show answer</summary>

The remote branch has commits your local branch doesn't contain, so accepting your push would discard them. Fetch and integrate (merge or rebase) first, then push.

</details>

**Q256. What is a fork?**

<details>
<summary>Show answer</summary>

A server-side copy of a repository under another account, used to contribute without write access to the original. You push to your fork (`origin`) and open PRs to the original (`upstream`).

</details>

**Q257. What is the difference between a pull request and a merge request?**

<details>
<summary>Show answer</summary>

Nothing conceptually: GitHub and Bitbucket call it a pull request, GitLab calls it a merge request. Both are a request to merge a branch, with review, discussion and CI.

</details>

**Q258. What are the three PR merge methods?**

<details>
<summary>Show answer</summary>

Merge commit (keeps all commits plus a merge commit), squash and merge (one new commit per PR), and rebase and merge (replays commits linearly without a merge commit).

</details>

**Q259. What is CODEOWNERS?**

<details>
<summary>Show answer</summary>

A file mapping path patterns to owners (users or teams) who are automatically requested for review. Combined with branch protection, their approval becomes mandatory. The last matching pattern wins.

</details>

**Q260. What are branch protection rules?**

<details>
<summary>Show answer</summary>

Platform rules on branches like main: required PRs and approvals, required status checks, CODEOWNERS review, signed commits, linear history, blocking force pushes and deletions, and whether admins are included.

</details>

**Q261. What is a merge queue?**

<details>
<summary>Show answer</summary>

A system that serializes merges: it tests each approved PR on top of the target plus PRs ahead of it, and merges only when the combined result passes. GitHub merge queue and GitLab merge trains keep main green at high volume.

</details>

**Q262. What is Git Flow?**

<details>
<summary>Show answer</summary>

A branching model with permanent `main` and `develop` branches plus `feature/*`, `release/*` and `hotfix/*` branches. Releases and hotfixes merge into both main and develop. It suits scheduled, versioned releases.

</details>

**Q263. What is GitHub Flow?**

<details>
<summary>Show answer</summary>

A lightweight model: main is always deployable, you branch for each change, open a PR, review, merge and deploy. There are no develop or release branches.

</details>

**Q264. What is GitLab Flow?**

<details>
<summary>Show answer</summary>

GitHub Flow plus downstream environment branches (e.g. pre-production, production) or release branches, with an "upstream first" rule: changes land on main first and flow downstream.

</details>

**Q265. What is trunk-based development?**

<details>
<summary>Show answer</summary>

All developers integrate into one trunk (main) at least daily, with very short-lived branches or direct commits, using feature flags to hide incomplete work. DORA research associates it with high delivery performance.

</details>

**Q266. What is a feature flag, and why does trunk-based development depend on it?**

<details>
<summary>Show answer</summary>

A runtime toggle that turns code paths on or off without deploying. It lets unfinished features merge into trunk safely and separates deploying code from releasing features.

</details>

**Q267. What is semantic versioning?**

<details>
<summary>Show answer</summary>

`MAJOR.MINOR.PATCH`: bump MAJOR for breaking changes, MINOR for backward-compatible features, PATCH for backward-compatible fixes, with optional pre-release (`-rc.1`) and build metadata (`+build.5`).

</details>

**Q268. Why shouldn't you move a published tag?**

<details>
<summary>Show answer</summary>

Others may already have fetched the old tag, and Git doesn't update existing tags on fetch by default, so the same version name would point to different code on different machines. Release a new version instead.

</details>

**Q269. Are tags pushed with `git push`?**

<details>
<summary>Show answer</summary>

No. Push them explicitly (`git push origin v1.0.0` or `--tags`), or use `--follow-tags` / `push.followTags true` to push annotated tags reachable from pushed commits.

</details>

**Q270. What is `git stash`?**

<details>
<summary>Show answer</summary>

It saves uncommitted changes (working tree and index) as special commits on `refs/stash` and cleans the working tree. Use `-u` for untracked files, `-m` for a message, and `pop` or `apply` to restore.

</details>

**Q271. What is the difference between `git stash pop` and `git stash apply`?**

<details>
<summary>Show answer</summary>

`apply` restores the stash and keeps it in the list; `pop` restores it and drops it, unless there's a conflict, in which case it's kept.

</details>

**Q272. What is `git cherry-pick`?**

<details>
<summary>Show answer</summary>

It applies the changes introduced by existing commits onto the current branch as new commits. It's common for backporting fixes to release branches; `-x` records the original hash in the message.

</details>

**Q273. What is `git worktree`?**

<details>
<summary>Show answer</summary>

A way to check out additional branches into separate directories that share one repository and object store. Each worktree has its own HEAD and index; a branch can only be checked out in one worktree at a time.

</details>

**Q274. What is `git bisect`?**

<details>
<summary>Show answer</summary>

A binary search over history to find the commit that introduced a bug. You mark good and bad commits, and Git checks out midpoints. `git bisect run <script>` automates it using the script's exit codes.

</details>

**Q275. What exit codes does `git bisect run` use?**

<details>
<summary>Show answer</summary>

0 means good, 1–127 (except 125) means bad, 125 means this commit can't be tested (skip), and anything above 127 aborts the bisect.

</details>

**Q276. What is a submodule?**

<details>
<summary>Show answer</summary>

A pointer from a parent repository to a specific commit of another repository, stored as a gitlink entry plus a URL in `.gitmodules`. Clones need `--recurse-submodules` or `git submodule update --init`.

</details>

**Q277. What is a subtree?**

<details>
<summary>Show answer</summary>

Another repository's content (optionally with history) merged into a subdirectory of your repo as normal files. Consumers need no special commands; `git subtree pull/push` syncs with the source.

</details>

**Q278. What is a monorepo?**

<details>
<summary>Show answer</summary>

A single repository holding many projects or services. It enables atomic cross-project changes and shared tooling, but needs affected-only CI, CODEOWNERS and Git scaling features like partial clone and sparse checkout.

</details>

**Q279. What are Git hooks?**

<details>
<summary>Show answer</summary>

Scripts Git runs at specific events: client-side ones like `pre-commit`, `commit-msg` and `pre-push`, and server-side ones like `pre-receive`, `update` and `post-receive`. Non-zero exit from a blocking hook stops the operation.

</details>

**Q280. How do you share hooks with a team?**

<details>
<summary>Show answer</summary>

Commit them to a folder and set `git config core.hooksPath <folder>`, or use a hook manager like pre-commit, Husky or Lefthook that installs them from a committed config.

</details>

**Q281. What is `git filter-repo`?**

<details>
<summary>Show answer</summary>

The tool recommended by the Git project for rewriting whole-repository history: removing files or secrets, extracting subdirectories, renaming paths and rewriting authors. It replaces the deprecated `git filter-branch`.

</details>

**Q282. What is Git LFS?**

<details>
<summary>Show answer</summary>

Git Large File Storage replaces large files in Git with small pointer files and stores the real content on an LFS server, downloading only the versions you check out. Patterns are tracked in `.gitattributes`.

</details>

**Q283. What is a shallow clone?**

<details>
<summary>Show answer</summary>

A clone with truncated history (`--depth N`), downloading only recent commits. It's fast for CI, but history-dependent commands are limited until you `git fetch --unshallow`.

</details>

**Q284. What is a partial clone?**

<details>
<summary>Show answer</summary>

A clone that omits some objects, typically file contents (`--filter=blob:none`), and fetches them on demand. It keeps full commit history while greatly reducing download size.

</details>

**Q285. What is sparse checkout?**

<details>
<summary>Show answer</summary>

A feature that limits which directories are present in the working tree (`git sparse-checkout set dir1 dir2`). Combined with partial clone, it makes huge monorepos manageable.

</details>

**Q286. What is Scalar?**

<details>
<summary>Show answer</summary>

A tool shipped with Git (since 2.38) that configures a repository for large-scale use in one command: partial clone, sparse checkout, FSMonitor, commit-graph and background maintenance.

</details>

**Q287. What does `git maintenance start` do?**

<details>
<summary>Show answer</summary>

It registers the repository for scheduled background tasks such as prefetch, commit-graph updates, loose-object cleanup and incremental repacking, keeping large repos fast.

</details>

**Q288. Why sign commits?**

<details>
<summary>Show answer</summary>

Author name and email can be set to anything, so signing with GPG, SSH or Sigstore keys cryptographically proves who created a commit or tag. Platforms show "Verified", and branch rules can require signatures.

</details>

**Q289. How do you configure SSH commit signing?**

<details>
<summary>Show answer</summary>

`git config --global gpg.format ssh`, `user.signingkey ~/.ssh/id_ed25519.pub`, `commit.gpgsign true`, then add the key on your platform as a signing key. Verify locally with an allowed-signers file.

</details>

**Q290. What should you do first when a secret is committed and pushed?**

<details>
<summary>Show answer</summary>

Rotate or revoke the secret immediately and check for misuse. Only then purge it from history, force-push and coordinate re-clones. Assume any pushed secret is compromised.

</details>

**Q291. What is `safe.directory`?**

<details>
<summary>Show answer</summary>

A setting listing repositories Git may operate on even if they're owned by another user. Git refuses such repos by default ("dubious ownership") to prevent malicious config from executing.

</details>

**Q292. Why pin GitHub Actions to a commit SHA?**

<details>
<summary>Show answer</summary>

Tags like `@v3` can be moved by whoever controls the action, as happened in the 2025 tj-actions/changed-files compromise. Pinning to a full SHA guarantees the exact code you reviewed runs.

</details>

**Q293. What is GitOps?**

<details>
<summary>Show answer</summary>

An operating model where the desired state of systems is declared in Git and agents like Argo CD or Flux continuously pull and reconcile the live environment to match. Every change is a reviewed, auditable commit, and rollback is a revert.

</details>

**Q294. What are the four OpenGitOps principles?**

<details>
<summary>Show answer</summary>

Declarative desired state, versioned and immutable storage of that state, automatic pulling by agents, and continuous reconciliation of actual state toward desired state.

</details>

**Q295. Why promote environments with folders rather than branches in GitOps?**

<details>
<summary>Show answer</summary>

Environment branches drift and require cherry-picks. With folders (overlays) on one main branch, promotion is a reviewable PR changing an image tag, and `git diff` shows exactly how environments differ.

</details>

**Q296. Why should CI tag artifacts with the commit SHA?**

<details>
<summary>Show answer</summary>

The SHA is immutable and traces the artifact back to exactly the code that produced it, unlike mutable tags like `latest`. It enables reproducible deployments and audits.

</details>

**Q297. Why does `git describe` sometimes fail in CI?**

<details>
<summary>Show answer</summary>

CI often makes shallow clones without tags, so no tag is reachable. Fetch full history (`fetch-depth: 0`) or `git fetch --tags --unshallow` in that job.

</details>

**Q298. What do DORA metrics measure, and how does Git relate?**

<details>
<summary>Show answer</summary>

Deployment frequency, lead time for changes, change failure rate and time to restore service. Lead time is measured from commit time to production deployment, so Git timestamps are a core input.

</details>

**Q299. What is the difference between a deploy key and a personal access token?**

<details>
<summary>Show answer</summary>

A deploy key is an SSH key scoped to a single repository (read-only by default) for machines. A personal access token acts as a user across whatever repos and scopes it's granted. Deploy keys or app tokens are preferred for automation.

</details>

**Q300. What is inner source?**

<details>
<summary>Show answer</summary>

Applying open-source practices inside a company: repos are visible to all engineers, anyone can propose changes through PRs, and owning teams review via CODEOWNERS and contribution guidelines.

</details>

---

← [Back to Concept-Based Questions](README.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
