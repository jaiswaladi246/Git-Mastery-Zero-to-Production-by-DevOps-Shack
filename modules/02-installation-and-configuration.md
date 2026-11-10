<!-- devopsshack:header -->
> 📘 **Git Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Module 02 · Installation & Configuration

## Installing Git

**Linux**

```bash
# Debian / Ubuntu
sudo apt update && sudo apt install -y git

# RHEL / Fedora / Amazon Linux
sudo dnf install -y git

# Newer versions on Ubuntu
sudo add-apt-repository ppa:git-core/ppa && sudo apt update && sudo apt install -y git
```

**macOS**: run `xcode-select --install` for Apple's build, or `brew install git` for the latest.

**Windows**: install [Git for Windows](https://git-scm.com/download/win). It includes Git Bash, which gives you a bash shell where every command in this repository works. WSL (Windows Subsystem for Linux) is an even better option if you're doing DevOps work.

Check your install:

```bash
git --version
```

Use Git 2.30 or newer for this course. Some newer commands (`git switch`, `git restore`, `git maintenance`, `git sparse-checkout` cone mode) need recent versions.

## The three configuration levels

Git reads configuration from three places. More specific levels override broader ones.

| Level | Flag | File | Applies to |
|---|---|---|---|
| System | `--system` | `/etc/gitconfig` | Every user on the machine |
| Global | `--global` | `~/.gitconfig` or `~/.config/git/config` | Every repo for your user |
| Local | `--local` (default) | `.git/config` | One repository |

There's also `--worktree` for per-worktree settings, which you'll meet in Module 13.

To see every setting and where it came from:

```bash
git config --list --show-origin
git config --show-origin user.email
```

## The settings everyone should set

```bash
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false        # or true; pick a team standard
git config --global core.editor "code --wait" # or vim, nano
git config --global fetch.prune true          # remove deleted remote branches on fetch
git config --global rerere.enabled true       # remember conflict resolutions
git config --global push.autoSetupRemote true # first push sets upstream automatically
git config --global diff.colorMoved zebra     # show moved lines differently in diffs
```

Your name and email are written into every commit you make. They aren't authentication, just labels. Anyone can set any name. That's why commit signing exists (Module 19).

## Different identity for work and personal projects

A common real problem: you commit to your company repo with your personal email, and the platform refuses the push because of an email policy. Conditional includes solve this cleanly.

```ini
# ~/.gitconfig
[user]
    name = Your Name
    email = personal@example.com

[includeIf "gitdir:~/work/"]
    path = ~/.gitconfig-work
```

```ini
# ~/.gitconfig-work
[user]
    email = you@company.com
```

Every repo under `~/work/` now uses your work email automatically.

## Line endings

Windows uses CRLF (`\r\n`) to end lines. Linux and macOS use LF (`\n`). Mixed line endings create diffs where every line looks changed and break shell scripts with errors like `/bin/bash^M: bad interpreter`.

The reliable fix is a `.gitattributes` file committed to the repo, so the rule travels with the project instead of depending on each developer's setup:

```gitattributes
* text=auto eol=lf
*.bat text eol=crlf
*.png binary
*.jpg binary
```

`core.autocrlf` is the per-user alternative (`true` on Windows, `input` on Mac/Linux), but `.gitattributes` wins and is the better team standard.

## Authentication to remotes

You'll connect to GitHub or GitLab over **HTTPS** or **SSH**.

**HTTPS** uses a personal access token (passwords are no longer accepted by the major platforms). Store it with a credential helper so you aren't asked every time:

```bash
git config --global credential.helper store      # plain text file, avoid on shared machines
git config --global credential.helper cache      # in memory for 15 minutes
# Git Credential Manager (recommended, supports MFA and OAuth)
git config --global credential.helper manager
```

**SSH** uses a key pair:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
cat ~/.ssh/id_ed25519.pub   # paste this into GitHub/GitLab → SSH keys
ssh -T git@github.com       # test
```

For multiple accounts on the same platform, use host aliases in `~/.ssh/config`:

```
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
```

Then clone with `git clone git@github-work:company/repo.git`.

## Aliases

Aliases save typing and encode good habits:

```bash
git config --global alias.st "status -sb"
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --global alias.last "log -1 HEAD --stat"
git config --global alias.unstage "restore --staged"
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.amend "commit --amend --no-edit"
```

Prefix with `!` to run any shell command: `git config --global alias.root '!pwd'`.

## A recommended starter ~/.gitconfig

```ini
[user]
    name = Your Name
    email = you@example.com
[init]
    defaultBranch = main
[core]
    editor = code --wait
    autocrlf = input
[pull]
    rebase = true
[push]
    autoSetupRemote = true
[fetch]
    prune = true
[rerere]
    enabled = true
[diff]
    colorMoved = zebra
    algorithm = histogram
[merge]
    conflictstyle = zdiff3
[alias]
    st = status -sb
    lg = log --oneline --graph --decorate --all
```

`merge.conflictstyle = zdiff3` shows the common ancestor inside conflict markers, which makes conflicts much easier to resolve. You'll see why in Module 07.

## Key takeaways

- Configuration has system, global and local levels. Local wins.
- Set name, email, default branch and editor before your first commit.
- Use `includeIf` to separate work and personal identities.
- Fix line endings with a committed `.gitattributes`.
- Prefer SSH keys or a credential manager over stored passwords.

## Practice

- [Lab 01 · Your First Repository](../labs/lab-01-first-repository/README.md)
- Interview questions: [Concept bank, Configuration](../interview-questions/01-concept-based/01-fundamentals.md)

Next: [Module 03 · The Core Workflow](03-core-workflow.md)


<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Git Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
