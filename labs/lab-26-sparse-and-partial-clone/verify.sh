#!/usr/bin/env bash
# Lab 26 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 26"
D=dev-clone
check "dev-clone exists"                                  '[ -d $D/.git ]'
check "Partial clone filter is blob:none"                 '[ "$(git -C $D config remote.origin.partialclonefilter)" = blob:none ]'
check "Sparse checkout enabled"                           '[ "$(git -C $D config core.sparseCheckout)" = true ]'
check "services/payments checked out"                     '[ -f $D/services/payments/file1.txt ]'
check "libs/shared checked out"                           '[ -f $D/libs/shared/util.sh ]'
check "services/orders NOT on disk"                       '[ ! -e $D/services/orders ]'
check "services/search NOT on disk"                       '[ ! -e $D/services/search ]'
finish
