#!/usr/bin/env bash
# Lab 23 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
mkdir -p .githooks
cat > .githooks/commit-msg <<'H'
#!/usr/bin/env bash
# DevOps Shack: enforce Conventional Commits
first=$(head -n1 "$1")
[[ "$first" =~ ^(Merge|Revert|fixup!|squash!) ]] && exit 0
re='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([a-z0-9-]+\))?!?: .+'
[[ "$first" =~ $re ]] || { echo "✖ Use Conventional Commits, e.g. 'feat(api): add login'"; exit 1; }
H
cat > .githooks/pre-commit <<'H'
#!/usr/bin/env bash
# DevOps Shack: block AWS access keys
if git diff --cached -U0 | grep -E '^\+.*AKIA[0-9A-Z]{16}' >/dev/null; then
  echo "✖ AWS access key detected in staged changes"; exit 1
fi
H
chmod +x .githooks/*
git config core.hooksPath .githooks
git add .githooks && git commit -m "chore: add shared git hooks"
