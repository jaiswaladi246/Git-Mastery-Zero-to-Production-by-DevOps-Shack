<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Repository Maintenance, Large Files & Submodule Scenarios

Questions 251–300 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q251. Your repository is 4 GB and clones take forever. How do you find out why?**

<details>
<summary>Show answer</summary>

List the biggest blobs: `git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | awk '$1=="blob"' | sort -k3 -n | tail -20`. Also check `git count-objects -vH`.

</details>

**Q252. You found old 500 MB build artifacts in history. How do you remove them?**

<details>
<summary>Show answer</summary>

On a fresh mirror clone: `git filter-repo --strip-blobs-bigger-than 50M` (or `--invert-paths --path build/`), force-push all refs, ask the platform to run GC, and have everyone re-clone. Add the paths to `.gitignore`.

</details>

**Q253. Designers need to version large PSD files. How do you set it up?**

<details>
<summary>Show answer</summary>

Git LFS: `git lfs install`, `git lfs track "*.psd"`, commit `.gitattributes`, then add the files. Consider `git lfs lock` for unmergeable files and budget for LFS storage.

</details>

**Q254. Large binaries were committed before LFS was set up. How do you move them into LFS?**

<details>
<summary>Show answer</summary>

`git lfs migrate import --include="*.psd,*.zip" --everything` rewrites history to LFS pointers. Then force-push all branches and tags and coordinate re-clones.

</details>

**Q255. A CI job fails with "Smudge error" or pointer files instead of real content. Why?**

<details>
<summary>Show answer</summary>

Git LFS isn't installed or enabled in CI, or content wasn't pushed to the LFS server. Enable LFS in checkout (`lfs: true`), run `git lfs pull`, and confirm objects exist with `git lfs ls-files`.

</details>

**Q256. You exceeded your LFS bandwidth quota due to CI. How do you reduce usage?**

<details>
<summary>Show answer</summary>

Cache LFS objects between CI runs, skip LFS download in jobs that don't need it (`GIT_LFS_SKIP_SMUDGE=1`), fetch only needed paths (`git lfs pull --include`), and avoid re-cloning on every job.

</details>

**Q257. A new hire cloned the repo with submodules, and the submodule folders are empty. Fix?**

<details>
<summary>Show answer</summary>

`git submodule update --init --recursive`. For future clones, use `git clone --recurse-submodules`, and set `submodule.recurse true` so pulls update submodules.

</details>

**Q258. You updated code inside a submodule, but teammates don't get it. What's missing?**

<details>
<summary>Show answer</summary>

Two pushes: commit and push inside the submodule repo, then commit the updated submodule pointer in the parent repo and push that. Set `push.recurseSubmodules check` to catch a forgotten inner push.

</details>

**Q259. Teammates get "fatal: reference is not a tree" when updating submodules. Cause?**

<details>
<summary>Show answer</summary>

The parent repo points to a submodule commit that was never pushed to the submodule's remote. The author must push the submodule commit.

</details>

**Q260. You want the submodule to follow the latest commit on its main branch. How?**

<details>
<summary>Show answer</summary>

Set the branch: `git config -f .gitmodules submodule.libs/shared.branch main`, then `git submodule update --remote libs/shared` and commit the new pointer. It still pins a commit; you update it deliberately.

</details>

**Q261. Inside a submodule you're in detached HEAD and your commits got lost. Why?**

<details>
<summary>Show answer</summary>

Submodules check out the pinned commit in detached HEAD by default. Before working inside one, `git switch main` (or create a branch), and recover lost commits from the submodule's reflog.

</details>

**Q262. How do you completely remove a submodule?**

<details>
<summary>Show answer</summary>

`git submodule deinit -f path`, `git rm -f path`, `rm -rf .git/modules/path`, then commit. Check that `.gitmodules` no longer lists it.

</details>

**Q263. Your submodule URL changed. How do you update everyone?**

<details>
<summary>Show answer</summary>

Edit `.gitmodules` (or `git submodule set-url path new-url`), commit, and have teammates run `git submodule sync --recursive` followed by `git submodule update --init --recursive`.

</details>

**Q264. CI can't clone a private submodule. How do you fix it?**

<details>
<summary>Show answer</summary>

Give CI credentials that can read the submodule repo (deploy key, app token, or `CI_JOB_TOKEN` with allowed project access on GitLab), and use relative URLs in `.gitmodules` (`../shared-lib.git`) so the same auth method works.

</details>

**Q265. Your team constantly struggles with submodules. What alternatives do you propose?**

<details>
<summary>Show answer</summary>

Publish the shared code as a versioned package (npm, PyPI, Maven, Go module, Helm chart), use `git subtree`, or move to a monorepo with proper tooling.

</details>

**Q266. You need to pull upstream updates into a subtree. How?**

<details>
<summary>Show answer</summary>

`git subtree pull --prefix=vendor/lib https://github.com/org/lib.git main --squash`.

</details>

**Q267. Developers on a huge monorepo complain that `git status` and checkout are slow. What do you roll out?**

<details>
<summary>Show answer</summary>

Partial clone (`--filter=blob:none`), sparse checkout for their areas, `core.fsmonitor true`, `core.untrackedCache true`, `feature.manyFiles true`, and `git maintenance start`. Scalar applies most of these with `scalar clone`.

</details>

**Q268. CI clones a 10 GB monorepo for every job. How do you speed it up?**

<details>
<summary>Show answer</summary>

Shallow clone (`--depth 1`) or treeless clone (`--filter=tree:0`), sparse checkout for the service being built, caching `.git` between runs where possible, and a regional mirror or cache proxy.

</details>

**Q269. A developer only needs one service in a monorepo. How do they clone efficiently?**

<details>
<summary>Show answer</summary>

`git clone --filter=blob:none --sparse <url>` then `git sparse-checkout set services/payments libs/shared`.

</details>

**Q270. `git gc` runs automatically and freezes your terminal during commits. What do you do?**

<details>
<summary>Show answer</summary>

Enable background maintenance with `git maintenance start` and set `gc.auto 0` for that repo, so foreground commands don't trigger heavy GC.

</details>

**Q271. You see "warning: There are too many unreachable loose objects; run 'git prune'". What does it mean?**

<details>
<summary>Show answer</summary>

Many unreachable loose objects have built up (often from rebases). Run `git gc --prune=now` (or `git prune`) if you don't need to recover anything, or let maintenance handle it.

</details>

**Q272. The repository's object database is huge, but the checked-out size is small. Why?**

<details>
<summary>Show answer</summary>

History contains large or many versions of files, or packfiles are badly packed. Run `git gc --aggressive` sparingly, find big historical blobs and decide whether to purge them or move them to LFS.

</details>

**Q273. Thousands of stale branches slow down fetches. How do you clean up safely?**

<details>
<summary>Show answer</summary>

Generate a report of branches merged into main or inactive for 90+ days, notify owners, archive tips as tags if needed, delete in batches, and enable auto-delete of merged PR branches.

</details>

**Q274. You need to back up all your organization's repositories. Approach?**

<details>
<summary>Show answer</summary>

A scheduled job that runs `git clone --mirror` (first time) and `git remote update --prune` (subsequent runs) for every repo via the platform API, stored in object storage with versioning, plus exports of issues, PRs and settings. Test restores regularly.

</details>

**Q275. You need to restore a repository deleted from GitHub an hour ago. Options?**

<details>
<summary>Show answer</summary>

Org owners can restore recently deleted repos from settings within a short window (about 90 days on GitHub, with limits), or contact support. Otherwise push from any full clone or mirror backup with `git push --mirror`.

</details>

**Q276. A developer's laptop clone shows "fatal: bad object HEAD". What do you do?**

<details>
<summary>Show answer</summary>

Back up the folder, then `git fsck --full` to diagnose. If refs or objects are corrupt, fetch from origin, copy packs from a healthy clone, or re-clone and copy over uncommitted work from the old working tree.

</details>

**Q277. `.git/index.lock` exists and every command fails. What do you do?**

<details>
<summary>Show answer</summary>

Make sure no Git process or IDE integration is running, then delete `.git/index.lock`. It's usually left behind by a crashed process.

</details>

**Q278. Your repo has a file with a path too long for Windows. Windows users can't check out. Fix?**

<details>
<summary>Show answer</summary>

`git config --global core.longpaths true` on Windows (with long paths enabled in the OS), or shorten the path in the repo.

</details>

**Q279. Two files differ only by case (`Readme.md` and `README.md`), breaking checkouts on macOS and Windows. Fix?**

<details>
<summary>Show answer</summary>

On a case-sensitive system (Linux), `git rm` one of them, merge content if needed, and commit. Add a CI check to prevent case collisions.

</details>

**Q280. Your repo contains a symlink that breaks on Windows. What are the options?**

<details>
<summary>Show answer</summary>

Enable symlinks on Windows (`core.symlinks true` with developer mode), or replace the symlink with a copy, script or build step for cross-platform repos.

</details>

**Q281. How do you find which commits added the most data to the repository?**

<details>
<summary>Show answer</summary>

Map the largest blobs to the commits that introduced them: get blob hashes from the big-blob listing, then `git log --all --find-object=<blob-sha> --oneline`.

</details>

**Q282. You want to prevent anyone from committing files over 10 MB. How?**

<details>
<summary>Show answer</summary>

Add a pre-commit hook (`check-added-large-files --maxkb=10240`), enforce on the server (GitLab push rule max file size, GitHub's 100 MB hard limit, rulesets for file size), and add a CI check.

</details>

**Q283. You need to version a 2 GB ML dataset alongside code. What do you recommend?**

<details>
<summary>Show answer</summary>

Don't store it in plain Git. Use Git LFS for moderate sizes, or tools like DVC, which keep data in object storage with pointers in Git, or a dedicated data or artifact store.

</details>

**Q284. You must split a repo because a component needs a different access level. How?**

<details>
<summary>Show answer</summary>

Extract it with `git filter-repo --subdirectory-filter component/` into a new repo with its own permissions, remove it from the original with a normal commit, and consume it as a package or submodule.

</details>

**Q285. How do you shrink a repo for new clones without rewriting history?**

<details>
<summary>Show answer</summary>

You can't remove historical data without rewriting, but partial clone (`--filter=blob:none`) and shallow clone reduce what clients download. Server-side bitmaps and repacking speed up serving.

</details>

**Q286. Your CI uses `git clean -ffdx` and builds get slow because caches vanish. What's the balance?**

<details>
<summary>Show answer</summary>

Exclude cache directories (`git clean -ffdx -e .cache/`) or keep caches outside the working tree using the CI platform's caching mechanism.

</details>

**Q287. How do you detect repository corruption early across many repos?**

<details>
<summary>Show answer</summary>

Schedule `git fsck --connectivity-only` (or `--full` periodically) on mirrors and servers, alert on errors, and keep at least one independent mirror.

</details>

**Q288. The `.git` folder was accidentally committed inside a subfolder (nested repo). What happened and how do you fix it?**

<details>
<summary>Show answer</summary>

Git records the nested repo as a gitlink (an embedded repository) rather than files. Remove it with `git rm --cached subfolder`, delete or move the nested `.git`, and re-add the files if they should be part of the parent.

</details>

**Q289. You inherited a repo where `node_modules` is tracked in history across 3,000 commits. Worth purging?**

<details>
<summary>Show answer</summary>

Measure the impact first. If clones are slow or the repo is huge, purge with `git filter-repo --invert-paths --path node_modules/` during a coordinated window. Otherwise just untrack it going forward and rely on partial clone.

</details>

**Q290. How do you keep generated files out of diffs and PR reviews without removing them?**

<details>
<summary>Show answer</summary>

Mark them in `.gitattributes` (`linguist-generated=true` collapses them on GitHub, `-diff` hides diffs), or stop committing generated files and build them in CI.

</details>

**Q291. You need to rename the default branch from `master` to `main` across a repo. Steps?**

<details>
<summary>Show answer</summary>

`git branch -m master main`, `git push -u origin main`, change the default branch in platform settings, retarget open PRs, update CI, branch protection and docs, then delete `master` remotely. Teammates run `git fetch`, `git branch -m master main` and `git branch -u origin/main`.

</details>

**Q292. Your submodule pointer keeps getting changed accidentally in PRs. How do you stop that?**

<details>
<summary>Show answer</summary>

Run `git submodule update` after pulls (or set `submodule.recurse true`), ask reviewers to watch for gitlink changes, and use CODEOWNERS on the submodule path.

</details>

**Q293. How do you speed up `git log --graph` on a repo with 1M commits?**

<details>
<summary>Show answer</summary>

Write a commit-graph (`git commit-graph write --reachable --changed-paths`) or enable maintenance. It drastically speeds up graph walks and path-limited log.

</details>

**Q294. What does `--changed-paths` add to the commit-graph?**

<details>
<summary>Show answer</summary>

Bloom filters recording which paths each commit changed, so `git log -- path` can skip commits that didn't touch the path without opening their trees.

</details>

**Q295. How do you clean up a repository after a filter-repo or BFG run locally?**

<details>
<summary>Show answer</summary>

`git reflog expire --expire=now --all && git gc --prune=now --aggressive` removes the old unreachable objects. filter-repo does much of this automatically.

</details>

**Q296. A developer committed a 200 MB file, pushed to a branch on your self-hosted GitLab, then deleted the branch. Is the storage reclaimed?**

<details>
<summary>Show answer</summary>

Not immediately. The objects remain until housekeeping or GC prunes unreachable objects (and MR refs may keep them reachable). Run project housekeeping, or purge via the admin tools.

</details>

**Q297. You need to make a repository read-only for archival. How?**

<details>
<summary>Show answer</summary>

Archive it on the platform (GitHub/GitLab "archive" makes it read-only), protect all branches, and keep a mirror backup.

</details>

**Q298. How do you check which files are tracked by LFS and which aren't?**

<details>
<summary>Show answer</summary>

`git lfs ls-files` lists LFS-tracked files in the current checkout, `git lfs status` shows pending changes, and `git check-attr filter -- path` shows whether a path matches an LFS rule.

</details>

**Q299. You need to clone a repo but skip downloading LFS files entirely. How?**

<details>
<summary>Show answer</summary>

`GIT_LFS_SKIP_SMUDGE=1 git clone <url>`. Later fetch specific files with `git lfs pull --include="path/*"`.

</details>

**Q300. How do you keep a fork's repo size small when upstream has huge history?**

<details>
<summary>Show answer</summary>

Use a partial clone locally, or a shallow fork clone for CI. On the platform, forks share object storage with upstream, so they don't duplicate server storage.

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
