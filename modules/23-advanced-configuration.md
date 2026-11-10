<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Module 23 · Advanced Configuration & Power Features

The features in this module separate people who use Git from people who've *tuned* Git.

## rerere: reuse recorded resolution

If you resolve the same conflict repeatedly (long-lived branches, repeated rebases, testing merges), rerere remembers how you resolved it and applies the same resolution automatically next time.

```bash
git config --global rerere.enabled true
git config --global rerere.autoUpdate true   # also stage the auto-resolved files
git rerere status
git rerere diff
git rerere forget path/to/file               # if a recorded resolution was wrong
```

Resolutions are stored in `.git/rr-cache`.

## Git attributes in depth

```gitattributes
# Line endings
*                 text=auto eol=lf
*.ps1             text eol=crlf

# Binary (no diff, no merge, no EOL conversion)
*.png             binary
*.jar             binary

# Custom diff drivers for readable diffs of non-text files
*.docx            diff=word
*.pdf             diff=pdf

# Merge drivers
CHANGELOG.md      merge=union        # keep both sides' lines
db/schema.rb      merge=ours         # needs: git config merge.ours.driver true

# Export control (excluded from git archive)
tests/            export-ignore
.github/          export-ignore

# Language stats on GitHub
vendor/**         linguist-vendored
*.generated.go    linguist-generated
```

Custom diff drivers:

```bash
git config diff.word.textconv docx2txt
git config diff.pdf.textconv "pdftotext -layout - -"
```

Now `git diff` on Word or PDF files shows the text changes.

## Diff and merge improvements

```bash
git config --global diff.algorithm histogram   # better diffs for moved code
git config --global diff.colorMoved zebra
git config --global merge.conflictstyle zdiff3
git config --global diff.renames copies        # detect copies as well as renames
git config --global diff.tool vscode
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait --merge $REMOTE $LOCAL $BASE $MERGED'
```

## Powerful aliases

```ini
[alias]
    # Pretty graph of everything
    lg = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(green)(%ar)%C(reset) %s %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all
    # What did I do today?
    today = log --since=midnight --author='Aditya' --oneline
    # Branches by last activity
    recent = for-each-ref --sort=-committerdate --count=15 --format='%(committerdate:relative)%09%(refname:short)' refs/heads/
    # Delete local branches already merged into main
    cleanup = "!git branch --merged main | grep -vE '^\\*|main|develop' | xargs -r git branch -d"
    # Undo last commit, keep changes
    undo = reset --soft HEAD~1
    # Amend without editing message
    oops = commit --amend --no-edit
    # Show files changed in last commit
    dl = diff --name-status HEAD~1
    # Who touched this most
    who = shortlog -sn --no-merges
    # Quick WIP commit and restore
    wip = "!git add -A && git commit -m 'WIP' --no-verify"
    unwip = "!git log -1 --format=%s | grep -q '^WIP$' && git reset HEAD~1"
    # Fixup into a commit then autosquash
    fixup = "!f() { git commit --fixup=$1 && GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash $1~1; }; f"
```

## Includes and conditional config

```ini
[include]
    path = ~/.gitconfig-aliases

[includeIf "gitdir:~/work/"]
    path = ~/.gitconfig-work

[includeIf "hasconfig:remote.*.url:git@github.com:devopsshack/**"]
    path = ~/.gitconfig-devopsshack
```

`hasconfig:remote.*.url` (Git 2.36+) applies config based on the remote URL. That works even when work and personal repos are in the same folder.

## URL rewriting

```ini
# Always use SSH for GitHub even if someone gives you an HTTPS URL
[url "git@github.com:"]
    insteadOf = https://github.com/

# Route through a company mirror
[url "https://git-mirror.devopsshack.internal/github/"]
    insteadOf = https://github.com/
```

This is very handy in CI, for example to inject a token for private Go modules or Terraform modules:

```bash
git config --global url."https://x-access-token:${TOKEN}@github.com/".insteadOf "https://github.com/"
```

## Useful environment variables

| Variable | Use |
|---|---|
| `GIT_TRACE=1` | Trace what Git is doing |
| `GIT_TRACE_PERFORMANCE=1` | Timing per operation |
| `GIT_SSH_COMMAND="ssh -i ~/.ssh/deploy_key -o IdentitiesOnly=yes"` | Use a specific SSH key for one command |
| `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`, `GIT_COMMITTER_DATE` | Override identity or dates (bots, migrations) |
| `GIT_DIR`, `GIT_WORK_TREE` | Operate on a repo from elsewhere |
| `GIT_TERMINAL_PROMPT=0` | Fail instead of prompting for credentials (CI) |
| `GIT_SEQUENCE_EDITOR=:` | Accept interactive rebase todo list without an editor |

## Notes

Git notes attach extra information to commits without changing their hashes: build results, review metadata, deployment records.

```bash
git notes add -m "Deployed to prod 2026-11-10 by pipeline #4821" HEAD
git log --show-notes
git push origin refs/notes/*
```

## Bundles: Git over sneakernet

A bundle packs a repository (or a range of commits) into one file that you can copy to an air-gapped network.

```bash
git bundle create app.bundle --all
git bundle verify app.bundle
git clone app.bundle app
git bundle create update.bundle v1.0..main   # incremental
```

## git archive

Export a snapshot without the `.git` folder, for release tarballs:

```bash
git archive --format=tar.gz --prefix=app-1.4.0/ -o app-1.4.0.tar.gz v1.4.0
```

> **DevOps Shack Production Tip:** Keep your dotfiles (including `.gitconfig`) in a Git repo of their own. A new laptop then takes minutes to set up instead of a day, and your aliases follow you everywhere.

## Key takeaways

- Turn on rerere, zdiff3, histogram diffs and colorMoved.
- `.gitattributes` controls line endings, binaries, diff drivers, merge drivers and export.
- Conditional includes and URL rewriting solve multi-identity and CI token problems.
- Notes, bundles and archive are niche but very handy when needed.

## Practice

- [Lab 27 · rerere](../labs/lab-27-rerere/README.md)
- [Assignment A18 · Alias Toolkit](../assignments/A18-alias-toolkit.md)

Next: [Module 24 · Git at Scale & Governance](24-git-at-scale.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
