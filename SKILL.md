---
name: donecheck
description: Adaptive verification report: "Claude says it's done—what should I check next?" (Triggers: "is this good", "what did it do", "blast radius", "evidence")
version: 0.1.0
license: MIT
---

# donecheck

Claude Code might say the task is done, but you still have to trust it. `donecheck` gives you the right amount of information to verify Claude's work, without the noise.

## How it works
`donecheck` acts as a thin router that analyzes your request phrasing and available context to provide a focused report. It supports three lenses:
1. **Plain**: For quick vibes (Traffic-light verdict + 1 next action).
2. **Standard**: For intermediate review (Changed files + Summary).
3. **Expert**: For senior developers (Evidence, Gaps, Blast radius).

## Local-Only Promise
This tool runs entirely on your local machine. No data is sent to external servers, no telemetry is collected, and it depends strictly on local git state and command history.

## Routing Rules
- **Preference**: Use `.claude/donecheck-lens` if present (`plain`, `standard`, `expert`).
- **Phrasing**: 
    - *Casual*: ("is this good", "did it work") → **Plain**
    - *Summarizing*: ("what did it do", "show me") → **Standard**
    - *Technical*: ("evidence", "blast radius", "diff") → **Expert**
- **Fallback**: **Standard**.

## References
- [Plain Lens](references/plain.md)
- [Standard Lens](references/standard.md)
- [Expert Lens](references/expert.md)
