#!/usr/bin/env bash
# Lab 22 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git -c protocol.file.allow=always submodule add "$LAB_DIR/shared-lib.git" libs/shared
git commit -m "chore: add shared-lib submodule"
bash "$LAB_DIR/bump-upstream.sh"
git -c protocol.file.allow=always submodule update --remote libs/shared
git add libs/shared && git commit -m "chore: bump shared-lib to v2"
git subtree add --prefix=vendor/shared "$LAB_DIR/shared-lib.git" main --squash
git log --oneline
