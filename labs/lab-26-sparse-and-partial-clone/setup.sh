#!/usr/bin/env bash
# Lab 26 · Sparse and Partial Clone — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 26 · Sparse Checkout + Partial Clone on a Monorepo"
rm -rf "$PG"; mkdir -p "$PG"; cd "$PG"
git init -q -b main monorepo-src; lab_identity monorepo-src; cd monorepo-src
for s in payments orders inventory search notifications; do mkdir -p services/$s; for i in 1 2 3; do head -c 20000 /dev/urandom | base64 > services/$s/file$i.txt; done; done
mkdir -p libs/shared; echo "shared" > libs/shared/util.sh
git add . && git commit -q -m "feat: DevOps Shack monorepo"
cd "$PG"; git clone -q --bare monorepo-src monorepo.git; rm -rf monorepo-src
git --git-dir=monorepo.git config uploadpack.allowFilter true
git --git-dir=monorepo.git config uploadpack.allowAnySHA1InWant true
ready
echo "   Server: file://$PG/monorepo.git"
