#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
fail=0

check() {
  local name="$1"; shift
  if "$@" >/dev/null 2>&1; then
    echo "ok   $name"
  else
    echo "FAIL $name"; fail=1
  fi
}

# 1. SKILL.md frontmatter must parse as YAML and stay under 500 lines.
check "SKILL.md yaml frontmatter" \
  python3 -c "import yaml,sys; yaml.safe_load(open('$ROOT/SKILL.md').read().split('---')[1])"
check "SKILL.md under 500 lines" \
  bash -c "[[ \$(wc -l < '$ROOT/SKILL.md') -lt 500 ]]"

# 2. Each reference file must contain the required sections for its lens.
check "plain.md has verdict rules" \
  grep -q 'Looks done' "$ROOT/references/plain.md"
check "plain.md requires ONLY IF guard" \
  grep -q 'ONLY IF' "$ROOT/references/plain.md"
check "plain.md forbids unverified safety claim" \
  grep -q 'Never assert safety' "$ROOT/references/plain.md"

check "standard.md has Changed/Verified/Not verified/Risk" \
  bash -c "grep -q 'Changed:' '$ROOT/references/standard.md' && \
           grep -q 'Verified:' '$ROOT/references/standard.md' && \
           grep -q 'Not verified:' '$ROOT/references/standard.md' && \
           grep -q 'Risk:' '$ROOT/references/standard.md'"

check "expert.md has Completion claim/Evidence/Gaps/Blast radius/Skipped" \
  bash -c "grep -q 'Completion claim:' '$ROOT/references/expert.md' && \
           grep -q 'Evidence:' '$ROOT/references/expert.md' && \
           grep -q 'Gaps:' '$ROOT/references/expert.md' && \
           grep -q 'Blast radius:' '$ROOT/references/expert.md' && \
           grep -q 'Skipped:' '$ROOT/references/expert.md'"
check "expert.md requires file:line citations" \
  grep -q 'file:line' "$ROOT/references/expert.md"

# 3. Router must select the right lens for each phrasing.
check "router: plain phrasing" \
  bash -c "DONECHECK_LENS= '$ROOT/donecheck.sh' 'is this good' | head -1 | grep -q 'plain lens'"
check "router: standard phrasing" \
  bash -c "DONECHECK_LENS= '$ROOT/donecheck.sh' 'show me what changed' | head -1 | grep -q 'standard lens'"
check "router: expert phrasing" \
  bash -c "DONECHECK_LENS= '$ROOT/donecheck.sh' 'what could break' | head -1 | grep -q 'expert lens'"
check "router: fallback" \
  bash -c "DONECHECK_LENS= '$ROOT/donecheck.sh' '' | head -1 | grep -q 'standard lens'"

# 4. Every fixture directory has the required files.
for case in "$ROOT"/fixtures/*/; do
  name="$(basename "$case")"
  check "$name has diff/context/expected files" \
    bash -c "for f in diff.txt context.txt plain.expected.txt standard.expected.txt expert.expected.txt; do [[ -f '$case/\$f' ]] || exit 1; done"
done

if [[ $fail -eq 0 ]]; then
  echo
  echo "ALL PASS"
fi
exit "$fail"
