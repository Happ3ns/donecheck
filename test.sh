#!/bin/bash
# Test harness for donecheck

echo "--- RUNNING TESTS ---"

# Test Plain Lens
echo "Testing Plain Lens (trigger: 'did it work')..."
./donecheck/donecheck.sh "did it work" | grep -q "plain lens" && echo "PASS" || echo "FAIL"

# Test Expert Lens
echo "Testing Expert Lens (trigger: 'blast radius')..."
./donecheck/donecheck.sh "what is the blast radius" | grep -q "expert lens" && echo "PASS" || echo "FAIL"

# Test Standard (Default) Lens
echo "Testing Standard Lens (no trigger)..."
./donecheck/donecheck.sh "summary" | grep -q "standard lens" && echo "PASS" || echo "FAIL"

echo "--- TESTS COMPLETE ---"
