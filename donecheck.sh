#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
USER_QUERY="${1:-}"
LENS="${DONECHECK_LENS:-}"
REASON=""

if [[ -n "$LENS" ]]; then
  REASON="from DONECHECK_LENS"
elif [[ -f ".claude/donecheck-lens" ]]; then
  LENS="$(tr -d '[:space:]' < .claude/donecheck-lens)"
  case "$LENS" in
    plain|standard|expert) REASON="from .claude/donecheck-lens" ;;
    *) echo "donecheck: invalid lens in .claude/donecheck-lens, falling back to standard" >&2
       LENS="standard"; REASON="invalid preference file" ;;
  esac
fi

if [[ -z "$LENS" ]]; then
  if [[ "$USER_QUERY" =~ (is\ this\ good|did\ it\ work|am\ I\ done|should\ I\ trust\ this) ]]; then
    LENS="plain"; REASON="plain phrasing detected"
  elif [[ "$USER_QUERY" =~ (evidence|blast\ radius|what\ could\ break|call\ sites|traceability) ]]; then
    LENS="expert"; REASON="expert phrasing detected"
  elif [[ "$USER_QUERY" =~ (what\ did\ it\ do|show\ me|summary) ]]; then
    LENS="standard"; REASON="summarizing phrasing detected"
  else
    LENS="standard"; REASON="no preference file, no lens-specific phrasing"
  fi
fi

case "$LENS" in
  plain|standard|expert) ;;
  *) echo "donecheck: unknown lens '$LENS'" >&2; exit 2 ;;
esac

echo "[donecheck: $LENS lens — $REASON]"
"$SCRIPT_DIR/scripts/collect-signals.sh"
cat "$SCRIPT_DIR/references/$LENS.md"
