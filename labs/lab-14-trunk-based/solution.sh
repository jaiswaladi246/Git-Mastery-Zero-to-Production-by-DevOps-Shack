#!/usr/bin/env bash
# Lab 14 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
# 1. ship dark: new code behind a flag that is OFF
git switch -c new-checkout-1
printf '{\n  "dark_mode": true,\n  "new_checkout": false\n}\n' > flags.json
cat > checkout.py <<'PY'
# DevOps Shack store checkout
import json
FLAGS = json.load(open("flags.json"))

def legacy_checkout(cart):
    return "legacy:" + str(sum(cart))

def new_checkout(cart):
    return "new:" + str(sum(cart))

def checkout(cart):
    if FLAGS.get("new_checkout"):
        return new_checkout(cart)
    return legacy_checkout(cart)
PY
git commit -am "feat: add new checkout behind flag (off)"
git switch main && git merge --ff-only new-checkout-1 && git branch -d new-checkout-1
# 2. release: flip the flag
sed -i 's/"new_checkout": false/"new_checkout": true/' flags.json
git commit -am "release: enable new_checkout for everyone"
# 3. cleanup: remove flag and dead code
printf '{\n  "dark_mode": true\n}\n' > flags.json
cat > checkout.py <<'PY'
# DevOps Shack store checkout
import json
FLAGS = json.load(open("flags.json"))

def new_checkout(cart):
    return "new:" + str(sum(cart))

def checkout(cart):
    return new_checkout(cart)
PY
git commit -am "chore: remove new_checkout flag and legacy path"
git log --oneline
