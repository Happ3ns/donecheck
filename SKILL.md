---
name: donecheck
description: >-
  Adaptive verification report answering "Claude says it's done—what should I
  check next?" Triggers include "is this good", "what did it do",
  "blast radius", and "evidence".
version: 0.1.0
license: MIT
---

# donecheck

Every Claude Code user shares one moment: Claude says the task is done, and you do not know what to believe. donecheck answers that question at the depth the current user can actually use, without becoming a bloated monolith.

## Output contract

Every response must start with one line naming the chosen lens and why:

    [donecheck: <plain|standard|expert> lens — <reason>]

Reasons are drawn from the routing rules below (e.g. `from .claude/donecheck-lens`, `plain phrasing detected`, `summarizing phrasing detected`, `expert phrasing detected`, `no preference file, no lens-specific phrasing`).

Then produce the report by following the chosen lens file in `references/` verbatim. Do not invent a verdict, evidence line, or safety claim that the lens rules do not permit.

## Routing rules (priority order)

1. **Explicit preference.** If `.claude/donecheck-lens` exists and contains `plain`, `standard`, or `expert`, use it. This is an optimization, never a prerequisite.
2. **Phrasing in the current turn.**
   - `is this good`, `did it work`, `am I done`, `should I trust this` → **plain**
   - `what did it do`, `show me`, `summary` → **standard**
   - `evidence`, `blast radius`, `what could break`, `call sites`, `traceability` → **expert**
3. **Fallback.** `standard`. Never default to plain for someone using expert vocabulary. Never dump expert detail on a plain-lens turn.

> `SKILL.md` is the authoritative router when the skill is invoked inside Claude Code. `donecheck.sh` is a debug/CLI helper that mirrors the same rules for local testing. If the two ever disagree, `SKILL.md` wins.

## Lens files

- `references/plain.md` — for users who cannot or will not read the diff
- `references/standard.md` — default for most users
- `references/expert.md` — for users who want dense, cited information

Only load the lens file chosen by the routing rules above.
