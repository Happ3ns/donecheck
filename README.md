# donecheck

Claude says the task is done—but what should you actually believe, and what should you check next? `donecheck` provides an adaptive verification report tailored to your experience level.

## Pitch
Whether you're a vibe coder who just wants a traffic-light verdict or a senior dev who needs to see the blast radius before merging, `donecheck` gives you the right information, at the right density, every time.

## Install

```bash
git clone https://github.com/Happ3ns/donecheck.git .claude/skills/donecheck

## Local-Only Promise
`donecheck` runs entirely on your local machine. No data is sent to external servers, no telemetry is collected, and it depends strictly on local git state and command history.

## Lens Overview

| Lens | Audience | Output Sample |
| :--- | :--- | :--- |
| **Plain** | Vibe Coders | "[Verdict: Looks done]" |
| **Standard** | Intermediate | "Changed: src/app.tsx" |
| **Expert** | Seniors | "Evidence: [cmd output]" |

## Who is this for?
- **It is for you if** you want a quick, actionable sanity check before you commit Claude's work.
- **It is NOT for you if** you only do one-line edits or if you never review AI output (you should always review).

## License
MIT.
