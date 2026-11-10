<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Remotes & Collaboration Scenarios

Questions 151–200 of the scenario-based questions bank. Try answering each one out loud before opening the answer.

---

**Q151. Your push is rejected with "Updates were rejected because the remote contains work that you do not have". What do you do?**

<details>
<summary>Show answer</summary>

`git pull --rebase` (or fetch and merge) to integrate the remote commits, resolve conflicts if any, then `git push`. Never force-push on a shared branch to get around this.

</details>

**Q152. `git status` says "up to date with origin/main" but a teammate says they pushed. Why?**

<details>
<summary>Show answer</summary>

Status compares against your last-fetched `origin/main`. Run `git fetch` and check again.

</details>

**Q153. You cloned a repo and need to work with a teammate's branch that's on the remote. How?**

<details>
<summary>Show answer</summary>

`git fetch` then `git switch their-branch`. Git creates a local tracking branch from `origin/their-branch` automatically.

</details>

**Q154. You created a branch locally and want to push it and set upstream. How?**

<details>
<summary>Show answer</summary>

`git push -u origin feature/x`. With `push.autoSetupRemote true`, a plain `git push` does it.

</details>

**Q155. You want to contribute to an open-source project where you don't have write access. Steps?**

<details>
<summary>Show answer</summary>

Fork on the platform, clone your fork, `git remote add upstream <original-url>`, create a branch from updated main, commit, push to your fork, and open a PR to upstream.

</details>

**Q156. Your fork is 50 commits behind upstream. How do you sync it?**

<details>
<summary>Show answer</summary>

`git fetch upstream`, `git switch main`, `git rebase upstream/main` (or `merge --ff-only`), `git push origin main`. Platforms also offer a "Sync fork" button.

</details>

**Q157. You need to change your remote from HTTPS to SSH. How?**

<details>
<summary>Show answer</summary>

`git remote set-url origin git@github.com:org/repo.git`, then verify with `git remote -v`.

</details>

**Q158. The repository moved to a new organization. How do you update your clone?**

<details>
<summary>Show answer</summary>

`git remote set-url origin <new-url>`. Platforms usually redirect old URLs, but update anyway to avoid relying on redirects.

</details>

**Q159. You need to review a colleague's PR locally. How?**

<details>
<summary>Show answer</summary>

`gh pr checkout 123`, or `git fetch origin pull/123/head:pr-123 && git switch pr-123`. On GitLab: `git fetch origin merge-requests/45/head:mr-45`.

</details>

**Q160. Your teammate deleted a remote branch, but `git branch -a` still shows it. Why and fix?**

<details>
<summary>Show answer</summary>

Your remote-tracking ref is stale. `git fetch --prune` (or `git remote prune origin`) removes it. Set `fetch.prune true` to automate.

</details>

**Q161. You pushed a branch with the wrong name. How do you fix it remotely?**

<details>
<summary>Show answer</summary>

Push it under the new name (`git push origin old:new` or rename locally and `git push -u origin new`), then `git push origin --delete old`.

</details>

**Q162. You need to push your local branch to a differently named remote branch. How?**

<details>
<summary>Show answer</summary>

`git push origin local-branch:remote-branch`.

</details>

**Q163. Two remotes exist (GitHub and an internal GitLab). You want one command to push to both. How?**

<details>
<summary>Show answer</summary>

Add multiple push URLs: `git remote set-url --add --push origin <github-url>` and `--add --push origin <gitlab-url>`. Then `git push` sends to both.

</details>

**Q164. You need to migrate a repository from Bitbucket to GitHub with all branches and tags. How?**

<details>
<summary>Show answer</summary>

`git clone --mirror <bitbucket-url>`, `cd repo.git`, `git remote set-url origin <github-url>`, `git push --mirror`. Then migrate PRs, issues and CI separately.

</details>

**Q165. `git push --mirror` deleted branches on the target. Why?**

<details>
<summary>Show answer</summary>

Mirror pushes make the remote's refs exactly match local refs, including deleting refs that don't exist locally. Use it only on empty or intended-to-be-identical targets.

</details>

**Q166. A teammate accidentally pushed directly to main, bypassing review. How do you prevent this?**

<details>
<summary>Show answer</summary>

Enable branch protection: require PRs with approvals, block direct pushes, include admins, and require status checks. Then revert or review the offending commit.

</details>

**Q167. Your PR can't be merged because "branch is out of date with base". What do you do?**

<details>
<summary>Show answer</summary>

Update the branch: merge main into it or rebase onto main (`git fetch && git rebase origin/main && git push --force-with-lease`), or use the platform's "Update branch" button. A merge queue removes this chore.

</details>

**Q168. Your PR is huge (2,500 lines) and reviewers keep postponing it. How do you handle it?**

<details>
<summary>Show answer</summary>

Split it into smaller, independently reviewable PRs (stacked PRs or feature-flagged increments), with a clear description and reviewer guidance for each.

</details>

**Q169. How do you co-author a commit with a pair-programming partner?**

<details>
<summary>Show answer</summary>

Add a trailer at the end of the message: `Co-authored-by: Name <email@company.com>`. Platforms credit both people.

</details>

**Q170. Two people need to work on the same feature branch. How do you avoid stepping on each other?**

<details>
<summary>Show answer</summary>

Pull with rebase before pushing (`git pull --rebase`), push small commits often, avoid force-pushing the shared branch, or each work on sub-branches merged into the feature branch.

</details>

**Q171. A contributor's PR from a fork needs a small fix before merging, and you're a maintainer. How do you push to it?**

<details>
<summary>Show answer</summary>

If "allow edits from maintainers" is enabled, add their fork as a remote (or use `gh pr checkout`), commit and push to their branch. Otherwise ask them, or merge and follow up.

</details>

**Q172. You need to clone only one branch to save time. How?**

<details>
<summary>Show answer</summary>

`git clone --single-branch --branch release/2.0 <url>`. Add `--depth 1` for only the latest commit.

</details>

**Q173. Your clone fails with "early EOF" or "RPC failed". What do you try?**

<details>
<summary>Show answer</summary>

Try a partial or shallow clone first (`--filter=blob:none` or `--depth 1`, then `git fetch --unshallow`), use SSH instead of HTTPS, set `http.version HTTP/1.1`, or check proxy and network limits.

</details>

**Q174. You get "Permission denied (publickey)" when pushing. How do you debug?**

<details>
<summary>Show answer</summary>

`ssh -vT git@github.com` to see which keys are offered, `ssh-add -l` to check the agent, make sure the public key is on your account, and confirm the remote is the SSH URL you expect.

</details>

**Q175. You use two GitHub accounts (work and personal) on one machine. How do you push with the right key?**

<details>
<summary>Show answer</summary>

Define host aliases in `~/.ssh/config` with different `IdentityFile`s (e.g. `Host github-work`), and use `git@github-work:org/repo.git` as the remote URL. Combine with `includeIf` for the right email.

</details>

**Q176. Your HTTPS push asks for a password and fails even with the correct password. Why?**

<details>
<summary>Show answer</summary>

Major platforms no longer accept account passwords for Git over HTTPS. Use a personal access token (or Git Credential Manager with OAuth) or switch to SSH.

</details>

**Q177. You need to pull changes from a colleague's machine directly without a server. Is that possible?**

<details>
<summary>Show answer</summary>

Yes. Git can fetch from any path or URL: `git fetch //host/share/repo` or over SSH `git fetch user@host:/path/repo branch`. Bundles (`git bundle`) also work offline.

</details>

**Q178. You need to send a repository to an air-gapped environment. How?**

<details>
<summary>Show answer</summary>

`git bundle create repo.bundle --all`, transfer the file, then `git clone repo.bundle` on the other side. Later send incremental bundles (`git bundle create update.bundle lasttag..main`).

</details>

**Q179. You want CI to fail if a PR's commits don't follow Conventional Commits. How?**

<details>
<summary>Show answer</summary>

Add a CI job (e.g. commitlint) that checks every commit message in `origin/main..HEAD`, plus a PR title check if you squash-merge.

</details>

**Q180. Who should approve changes to CI pipeline files, and how do you enforce it?**

<details>
<summary>Show answer</summary>

The DevOps or platform team. Add `/.github/workflows/ @org/devops` (or `.gitlab-ci.yml`) to CODEOWNERS and enable "require review from code owners".

</details>

**Q181. A teammate keeps getting "Your branch and 'origin/main' have diverged" on main. What's likely happening?**

<details>
<summary>Show answer</summary>

They commit directly on local main while others push to the remote main. They should use feature branches, and on main use `git pull --rebase` or reset to `origin/main` if their local commits are disposable.

</details>

**Q182. Your team wants to see who is working on what branches. Quick command?**

<details>
<summary>Show answer</summary>

`git for-each-ref --sort=-committerdate refs/remotes/origin --format='%(committerdate:relative) %(authorname) %(refname:short)'` after a fetch.

</details>

**Q183. A teammate's branch has commits you need, but it's not ready to merge. How do you get just those commits?**

<details>
<summary>Show answer</summary>

`git cherry-pick <sha>` (with `-x`) onto your branch, and coordinate so the same change doesn't get merged twice in conflicting ways.

</details>

**Q184. You want to stop a remote branch from being force-pushed or deleted. Where do you configure it?**

<details>
<summary>Show answer</summary>

Platform branch protection or rulesets (block force pushes, block deletions). On self-hosted bare repos, set `receive.denyNonFastForwards true` and `receive.denyDeletes true`.

</details>

**Q185. You want to push only tags created for a release. How?**

<details>
<summary>Show answer</summary>

`git push origin v2.1.0` for one tag, or `git push --follow-tags` to push annotated tags along with commits.

</details>

**Q186. You deleted a tag locally but it keeps coming back after fetch. Why?**

<details>
<summary>Show answer</summary>

It still exists on the remote. Delete it there too: `git push origin --delete v1.0-bad`. Others must delete it locally too, since Git doesn't remove local tags on fetch unless `--prune-tags` is used.

</details>

**Q187. Your organization wants every repo to have the same protections. How do you avoid configuring each by hand?**

<details>
<summary>Show answer</summary>

Use org-level rulesets (GitHub) or group-level settings (GitLab), and manage repos and protections as code with Terraform providers.

</details>

**Q188. You need to share work-in-progress with a teammate without opening a PR. How?**

<details>
<summary>Show answer</summary>

Push a WIP branch (e.g. `wip/aditya-cache`) or open a draft PR. Avoid sending patches over chat.

</details>

**Q189. How do you see a remote's branches without cloning?**

<details>
<summary>Show answer</summary>

`git ls-remote --heads <url>` lists branch refs and their SHAs (`--tags` for tags).

</details>

**Q190. You need to know which remote branches haven't had commits in 90 days. How?**

<details>
<summary>Show answer</summary>

`git for-each-ref --sort=committerdate refs/remotes/origin --format='%(committerdate:short) %(refname:short)'` and filter by date, then review and delete stale ones.

</details>

**Q191. Your team mixes merge and rebase pulls, causing messy history. What policy do you set?**

<details>
<summary>Show answer</summary>

Agree on `pull.rebase true` for private branches, squash-merge PRs on the platform, require linear history on main, and document it in CONTRIBUTING.md.

</details>

**Q192. A new teammate cloned the repo and the app fails because a folder is empty. What's likely missing?**

<details>
<summary>Show answer</summary>

Submodules. Run `git submodule update --init --recursive`, or clone with `--recurse-submodules`. Document it in the README.

</details>

**Q193. The remote rejected your push with "pre-receive hook declined". What does it mean?**

<details>
<summary>Show answer</summary>

A server-side policy (push rules, secret detection, file size limits, commit message format, signed-commit requirement) rejected the push. Read the message, fix the offending commits locally, and push again.

</details>

**Q194. GitHub says "GH013: Repository rule violations found". What do you do?**

<details>
<summary>Show answer</summary>

A ruleset blocked the push (e.g. a direct push to protected main, unsigned commits, or a blocked file path). Push to a branch and open a PR, or fix the commits to satisfy the rule.

</details>

**Q195. Your push was blocked because it contains a detected secret (push protection). Steps?**

<details>
<summary>Show answer</summary>

Remove the secret from the commits (amend or interactive rebase, since nothing was pushed), move it to a secrets manager, rotate it if there's any chance it leaked elsewhere, then push again.

</details>

**Q196. You need to temporarily share a branch with an external contractor without giving repo access. Options?**

<details>
<summary>Show answer</summary>

Create a limited fork or separate repo, send a `git bundle` or patch series, or give scoped access (outside collaborator on one repo, with expiry). Never share personal tokens.

</details>

**Q197. Your remote URL contains an embedded token (`https://user:token@...`). Why is that bad and how do you fix it?**

<details>
<summary>Show answer</summary>

The token is stored in plain text in `.git/config` and can leak in logs or screenshots. Remove it with `git remote set-url origin https://github.com/org/repo.git`, use a credential helper, and rotate the token.

</details>

**Q198. How do you check out a remote branch with the same name as a local one but different content?**

<details>
<summary>Show answer</summary>

Inspect first with `git log --oneline --left-right main...origin/main`. Then decide: `git reset --hard origin/main` (discard local), merge, or rebase.

</details>

**Q199. Your team wants every PR to have a description with testing notes. How do you encourage it?**

<details>
<summary>Show answer</summary>

Add a PR template (`.github/pull_request_template.md` or GitLab MR templates) with sections for what, why, how it was tested, and risks. Reviewers can then block PRs without it.

</details>

**Q200. You want to see exactly what a `git pull` would bring in before running it. How?**

<details>
<summary>Show answer</summary>

`git fetch` then `git log --oneline HEAD..@{u}` for incoming commits and `git diff HEAD...@{u}` for the changes. Then merge or rebase deliberately.

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
