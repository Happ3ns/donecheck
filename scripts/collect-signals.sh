#!/bin/bash
# Collect signals for donecheck

echo "--- SIGNAL COLLECTOR ---"
echo "Changed files:"
git diff --name-only
echo ""
echo "Summary:"
git diff --stat
