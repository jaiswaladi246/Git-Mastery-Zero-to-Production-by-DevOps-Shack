#!/usr/bin/env bash
# Lab 21 · Remove a Secret from History — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 21 · Remove a Secret from History"
new_playground
write_commit app.py "print('DevOps Shack uploader')" "feat: uploader"
printf 'AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7DEVSHAK"\nREGION = "ap-south-1"\n' > config.py; git add .; git commit -q -m "feat: s3 config"
write_commit README.md "# Uploader" "docs: readme"
printf 'import os\nAWS_ACCESS_KEY_ID = os.environ["AWS_ACCESS_KEY_ID"]\nREGION = "ap-south-1"\n' > config.py; git add .; git commit -q -m "fix: read key from env"
git rev-list --count HEAD > .git/devopsshack-count
ready
echo "   The key was 'removed' in the latest commit, but it is still in history."
