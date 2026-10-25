#!/bin/bash
# donecheck router
# Usage: ./donecheck.sh "<user-query>"

USER_QUERY="$1"
LENS="standard" # Default fallback

# Signal 1: Preference file
if [ -f ".claude/donecheck-lens" ]; then
    LENS=$(cat .claude/donecheck-lens)
    echo "[donecheck: $LENS lens — from .claude/donecheck-lens]"
# Signal 2: Phrasing
elif [[ "$USER_QUERY" =~ (is this good|did it work|am I done|should I trust this) ]]; then
    LENS="plain"
    echo "[donecheck: $LENS lens — plain phrasing detected]"
elif [[ "$USER_QUERY" =~ (evidence|blast radius|what could break|diff|call sites|traceability) ]]; then
    LENS="expert"
    echo "[donecheck: $LENS lens — expert phrasing detected]"
else
    echo "[donecheck: $LENS lens — no preference file, no lens-specific phrasing]"
fi

# Run signal collector
./donecheck/scripts/collect-signals.sh

# Display selected lens
cat "donecheck/references/$LENS.md"
