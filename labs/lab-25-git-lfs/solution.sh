#!/usr/bin/env bash
# Lab 25 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git lfs install --local
git lfs migrate info --everything
git lfs migrate import --include="*.bin" --everything --yes
git lfs ls-files
git count-objects -vH
