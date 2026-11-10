#!/usr/bin/env bash
# Lab 08 · Rebase Basics — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 08 · Rebase Basics"
new_playground
write_commit app.js "// DevOps Shack app" "feat: init app"
git switch -q -c feature/search
write_commit search.js "export const search = q => q" "feat: add search module"
write_commit search.test.js "test('search')" "test: cover search"
git switch -q main
write_commit auth.js "export const login = () => true" "feat: add auth"
write_commit ci.yml "steps: [test]" "ci: add pipeline"
ready
