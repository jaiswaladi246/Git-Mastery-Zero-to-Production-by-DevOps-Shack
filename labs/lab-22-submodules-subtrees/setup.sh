#!/usr/bin/env bash
# Lab 22 · Submodules and Subtrees — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 22 · Submodules and Subtrees"
rm -rf "$LAB_DIR/shared-lib.git" "$LAB_DIR/_seed"
git init -q --bare -b main "$LAB_DIR/shared-lib.git"
git clone -q "$LAB_DIR/shared-lib.git" "$LAB_DIR/_seed" 2>/dev/null; lab_identity "$LAB_DIR/_seed"
( cd "$LAB_DIR/_seed"; write_commit lib.sh 'greet(){ echo "hi from shared-lib v1"; }' "feat: shared lib v1"; git push -q origin main )
cat > "$LAB_DIR/bump-upstream.sh" <<'B'
#!/usr/bin/env bash
# Simulates the shared-lib team releasing v2 — DevOps Shack Git Mastery
cd "$(dirname "$0")/_seed" && echo 'greet(){ echo "hi from shared-lib v2"; }' > lib.sh && git commit -qam "feat: shared lib v2" && git push -q origin main && echo "shared-lib v2 pushed"
B
new_playground
write_commit app.sh 'echo "DevOps Shack app"' "feat: app"
ready
echo "   Shared library repo: $LAB_DIR/shared-lib.git"
