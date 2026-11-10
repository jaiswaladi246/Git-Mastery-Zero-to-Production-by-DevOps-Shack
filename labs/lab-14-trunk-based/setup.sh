#!/usr/bin/env bash
# Lab 14 · Trunk-Based with Feature Flags — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 14 · Trunk-Based Development with Feature Flags"
new_playground
cat > flags.json <<'J'
{
  "dark_mode": true
}
J
cat > checkout.py <<'PY'
# DevOps Shack store checkout
import json
FLAGS = json.load(open("flags.json"))

def legacy_checkout(cart):
    return "legacy:" + str(sum(cart))

def checkout(cart):
    return legacy_checkout(cart)
PY
git add . && git commit -q -m "feat: legacy checkout"
git tag start
ready
