#!/usr/bin/env bash
# Lab 02 · Mastering the Staging Area — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 02 · Mastering the Staging Area"
new_playground
cat > payment.py <<'PY'
# payment.py — DevOps Shack demo service
TIMEOUT = 10

def charge(amount):
    if amount <= 0:
        raise ValueError("amount must be positive")
    return {"status": "ok", "amount": amount}







def refund(amount):
    return {"status": "refunded", "amount": amount}
PY
git add payment.py && git commit -q -m "feat: add payment module"
# two unrelated edits far apart
sed -i 's/^TIMEOUT = 10/TIMEOUT = 30/' payment.py
sed -i 's/^def refund(amount):/def refund(amount):\n    print("DEBUG refund called")/' payment.py
echo "temporary notes" > scratch.txt
ready
