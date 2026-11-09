# donecheck

[![test](https://github.com/Happ3ns/donecheck/actions/workflows/test.yml/badge.svg)](https://github.com/Happ3ns/donecheck/actions/workflows/test.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Claude and coding agents say the task is done—but what should you actually believe, and what should you check before merging? `donecheck` provides an adaptive verification report tailored to your experience level.

## Pitch

Whether you're a vibe coder who just wants a traffic-light verdict or a senior engineer who needs to see the blast radius and citation lines before merging, `donecheck` gives you the right information, at the right density, every time.

---

## 3 Ways to Use `donecheck`

### 1. Claude Code & Agent Skill (Recommended)

Clone directly into your Claude Code skills directory:

```bash
git clone https://github.com/Happ3ns/donecheck.git .claude/skills/donecheck
```

Invoke naturally from your chat prompt:
- *"is this good?"* -> routes automatically to **Plain Lens** (traffic-light verdict)
- *"show me what changed"* -> routes to **Standard Lens** (balanced breakdown)
- *"what could break / show blast radius"* -> routes to **Expert Lens** (evidence & line citations)

### 2. GitHub Actions CI (PR Verification Check)

Add `donecheck` as a composite step in your CI pipeline to verify AI PR blast radius:

```yaml
# .github/workflows/verify-pr.yml
name: Verify Changes
on: [pull_request]

jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Run donecheck
        uses: Happ3ns/donecheck@main
        with:
          lens: 'standard'  # 'plain' | 'standard' | 'expert'
```

### 3. Git Pre-Push Hook (Catch Untested AI Code Locally)

Install the pre-push hook to prevent pushing unverified changes:

```bash
cp hooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

---

## Lens Overview

| Lens | Target Audience | Focus | Output Style |
| :--- | :--- | :--- | :--- |
| **Plain** | Vibe Coders / Beginners | Traffic-light confidence & single next action | `[Verdict: Looks done]` or `[Done, but unverified]` |
| **Standard** | Intermediate Developers | Changed, Verified, Not Verified, Risk | Bulleted audit summary with risk profile |
| **Expert** | Seniors / Tech Leads | Blast radius, unverified call sites, line citations | Evidence-based audit with `file:line` proof |

---

## Local-Only Promise

`donecheck` runs entirely on your local machine. No code is transmitted to third-party APIs, no telemetry is collected, and all signals are computed strictly from local git diffs and test logs.

## License

MIT.
