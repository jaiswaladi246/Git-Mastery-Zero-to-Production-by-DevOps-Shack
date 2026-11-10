#!/usr/bin/env bash
# Lab 24 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
ssh-keygen -q -t ed25519 -N "" -C "labs@devopsshack.com" -f "$LAB_DIR/lab_signing_key"
git config gpg.format ssh
git config user.signingkey "$LAB_DIR/lab_signing_key.pub"
echo "labs@devopsshack.com $(cat "$LAB_DIR/lab_signing_key.pub")" > "$LAB_DIR/allowed_signers"
git config gpg.ssh.allowedSignersFile "$LAB_DIR/allowed_signers"
write_commit SECURITY.md "Report issues to security@devopsshack.com" "docs: security policy" 2>/dev/null || true
git commit --amend -S --no-edit -q
git tag -s v1.0.0 -m "Signed release 1.0.0"
git log --show-signature -1
