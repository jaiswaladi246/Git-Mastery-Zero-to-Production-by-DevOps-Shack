#!/usr/bin/env bash
# Lab 26 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git clone --filter=blob:none --sparse "file://$PG/monorepo.git" dev-clone
cd dev-clone
git sparse-checkout set services/payments libs/shared
git sparse-checkout list
ls services
