<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Module 15 · Rewriting History

Interactive rebase rewrites a handful of recent commits. Sometimes you need to rewrite an *entire* repository: remove a leaked secret from every commit, strip a 2 GB file someone committed in 2019, split a folder into its own repo, or fix the author email on 3,000 commits. That's what this module covers.

> **DevOps Shack warning:** Rewriting a repository's whole history changes every commit hash from the first affected commit onward. Every clone, fork, open PR and CI cache is now based on history that no longer exists. Treat it like a database migration: plan it, announce it, freeze pushes, do it, and have everyone re-clone.

## The tools

| Tool | Status | Use it for |
|---|---|---|
| `git filter-repo` | **Recommended** by the Git project | Everything: paths, secrets, authors, subdirectory extraction |
| BFG Repo-Cleaner | Good, Java-based, simpler | Removing big files and passwords quickly |
| `git filter-branch` | **Deprecated**, slow and full of pitfalls | Nothing new. You'll only see it in old guides |
| `git rebase -i` | Built in | Small, recent changes |

Install filter-repo:

```bash
pip install git-filter-repo        # or: brew install git-filter-repo / apt install git-filter-repo
```

filter-repo works on a **fresh clone** by default and refuses to run on a repo that looks like it has unpushed work. That protects you.

## Scenario 1: a secret was committed

The first steps have nothing to do with Git.

```mermaid
flowchart TD
    A[Secret detected in a commit] --> B["1 · ROTATE / REVOKE the credential NOW"]
    B --> C[2 · Check logs for misuse of the credential]
    C --> D{Was it pushed to a shared remote?}
    D -->|No, local only| E[Amend or interactive rebase to remove it]
    D -->|Yes| F[3 · Purge from history with filter-repo]
    F --> G[4 · Force-push all branches and tags]
    G --> H[5 · Ask platform support to purge cached views / PR refs]
    H --> I[6 · Everyone re-clones]
    I --> J[7 · Add secret scanning + pre-commit hooks so it can't happen again]
```

> **DevOps Shack Production Tip:** Rotate first, always. Once a secret has been pushed to a remote, assume it's compromised. Bots scan public GitHub for AWS keys within minutes. Purging history is cleanup. Rotation is the actual fix.

Removing a specific string everywhere:

```bash
git clone --mirror git@github.com:devopsshack/app.git
cd app.git

# replacements.txt: one rule per line
#   AKIAIOSFODNN7EXAMPLE==>***REMOVED***
#   regex:password\s*=\s*\S+==>password=***REMOVED***
git filter-repo --replace-text ../replacements.txt

git push --force --mirror
```

Removing a whole file from every commit:

```bash
git filter-repo --invert-paths --path config/secrets.yaml
git filter-repo --invert-paths --path-glob '*.pem'
```

The same with BFG:

```bash
java -jar bfg.jar --delete-files secrets.yaml app.git
java -jar bfg.jar --replace-text passwords.txt app.git
cd app.git && git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

Note: BFG protects your latest commit by default. Remove the secret from HEAD with a normal commit first.

## Scenario 2: huge files are bloating the repo

```bash
# find the biggest blobs in all history
git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  awk '$1=="blob"' | sort -k3 -n | tail -20

# remove everything larger than 50 MB
git filter-repo --strip-blobs-bigger-than 50M

# or remove specific paths
git filter-repo --invert-paths --path assets/videos/
```

If the files belong in the repo going forward, move them to Git LFS with `git lfs migrate import` (Module 20).

## Scenario 3: extract a folder into its own repository

```bash
git clone git@github.com:devopsshack/monorepo.git payments-service
cd payments-service
git filter-repo --subdirectory-filter services/payments
# now the repo root is the old services/payments, with only its history
git remote add origin git@github.com:devopsshack/payments-service.git
git push -u origin --all && git push origin --tags
```

To move a folder somewhere else in the tree: `git filter-repo --path-rename old/dir/:new/dir/`. To keep several paths: `--path a/ --path b/`.

## Scenario 4: fix author names and emails

Create a `.mailmap`:

```
Aditya Jaiswal <aditya@devopsshack.com> <aditya@old-laptop.local>
Priya Sharma <priya@devopsshack.com> Priya <priya.personal@gmail.com>
```

Committing `.mailmap` fixes how names *display* in log and shortlog, without rewriting anything. That's usually enough. To actually rewrite:

```bash
git filter-repo --mailmap .mailmap
```

## After any rewrite

1. Compare the result: `git log --oneline | wc -l` before and after, and make sure the build still works.
2. Force-push every branch and tag: `git push --force --all && git push --force --tags` (or `--mirror`).
3. Ask GitHub or GitLab support to run garbage collection and clear cached pull request refs, since old commits can still be reachable through `refs/pull/*` and the web UI.
4. Tell everyone to **re-clone**. Pulling into an old clone reintroduces the old history.
5. Delete old forks if they contain the secret.
6. Update CI caches and anything that pins commit SHAs.

## Rewriting small recent history

Don't reach for filter-repo when the problem is in your last few unpushed commits:

```bash
git commit --amend                    # last commit
git rebase -i HEAD~5                  # recent commits
git rebase -i --root                  # every commit, small repos only
git rebase -r --exec 'git commit --amend --no-edit --reset-author' HEAD~10   # fix author on last 10
```

## Key takeaways

- Use `git filter-repo`, not `filter-branch`. BFG is a fine alternative for files and secrets.
- For leaked secrets: rotate first, then purge, then prevent.
- Rewrites change every hash. Coordinate, force-push everything, and have everyone re-clone.
- `.mailmap` fixes author display without rewriting history.

## Practice

- [Lab 21 · Remove a Secret from History](../labs/lab-21-remove-secrets/README.md)
- [Assignment A10 · Secret Purge Incident](../assignments/A10-secret-purge.md)
- [Assignment A09 · Split a Monorepo](../assignments/A09-monorepo-split.md)

Next: [Module 16 · Submodules, Subtrees & Monorepos](16-submodules-subtrees-monorepos.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
