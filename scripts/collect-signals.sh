#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "(not a git repository — no diff signals available)"
  exit 0
fi

echo "## Diff stat"
git diff --stat HEAD 2>/dev/null || true
echo
echo "## Changed files"
git diff --name-only HEAD 2>/dev/null || true
