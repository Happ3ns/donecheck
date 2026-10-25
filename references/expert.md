# Expert lens

Audience: senior developer who wants dense information, not more words.

Produce exactly:

- **Completion claim:** restate what Claude said was done.
- **Evidence:** command outputs, exit codes, snapshot names — with `file:line` citations.
- **Gaps:** specific unverified paths with `file:line`.
- **Blast radius:** call sites, importers, affected modules, and which of those lack tests.
- **Skipped:** checks that were not run this turn (typecheck, e2e, etc.).

Rules:

- Every "Evidence" line must include `file:line` or a command + exit code. Anything without a citation moves to "Gaps".
- No prose padding. Every line is information-dense.
- Target: scannable in 5 seconds; the two lines that matter are obvious.
