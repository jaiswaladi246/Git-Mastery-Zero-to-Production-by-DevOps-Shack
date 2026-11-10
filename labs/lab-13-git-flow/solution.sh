#!/usr/bin/env bash
# Lab 13 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
# feature
git switch -c feature/login develop
write_commit login.sh 'echo "login"' "feat: add login"
git switch develop && git merge --no-ff feature/login -m "Merge branch 'feature/login' into develop" && git branch -d feature/login
# release
git switch -c release/1.1.0 develop
write_commit VERSION "1.1.0" "chore: bump version to 1.1.0"
git switch main && git merge --no-ff release/1.1.0 -m "Merge branch 'release/1.1.0'" && git tag -a v1.1.0 -m "Release 1.1.0"
git switch develop && git merge --no-ff release/1.1.0 -m "Merge branch 'release/1.1.0' into develop" && git branch -d release/1.1.0
# hotfix
git switch -c hotfix/1.1.1 main
write_commit VERSION "1.1.1" "fix: patch checkout crash, bump 1.1.1"
git switch main && git merge --no-ff hotfix/1.1.1 -m "Merge branch 'hotfix/1.1.1'" && git tag -a v1.1.1 -m "Hotfix 1.1.1"
git switch develop && git merge --no-ff hotfix/1.1.1 -m "Merge branch 'hotfix/1.1.1' into develop" || { git checkout --theirs VERSION; git add VERSION; git commit --no-edit; }
git branch -d hotfix/1.1.1
git log --oneline --graph --all
