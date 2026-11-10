#!/usr/bin/env bash
# Lab 20 · Blame and Log Forensics — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 20 · Blame and Log Forensics"
new_playground
as(){ GIT_AUTHOR_NAME="$1" GIT_AUTHOR_EMAIL="$(echo $1 | tr 'A-Z ' 'a-z.')@devopsshack.com" git commit -q -m "$2"; }
mkdir -p services; printf 'MAX_RETRIES = 3\nTIMEOUT = 10\n' > services/invoice.py; git add .; as "Rahul Verma" "feat: invoice service"
printf 'API_KEY = "sk_live_devopsshack_123"\n' > services/keys.py; git add .; as "Priya Sharma" "chore: add keys"
sed -i 's/MAX_RETRIES = 3/MAX_RETRIES = 5/' services/invoice.py; git add .; as "Priya Sharma" "perf: more retries"
git rm -q services/keys.py; as "Aditya Jaiswal" "security: remove hardcoded key"
git mv services/invoice.py services/billing.py; as "Rahul Verma" "refactor: rename invoice to billing"
echo "TIMEOUT_MS = 10000" >> services/billing.py; git add .; as "Priya Sharma" "feat: ms timeout"
{ echo "Q1=Priya Sharma"; echo "Q2=$(git log --format=%h -n1 --grep='^security: remove hardcoded key$')"; echo "Q3=services/invoice.py"; echo "Q4=3"; } > .git/devopsshack-answers
ready
