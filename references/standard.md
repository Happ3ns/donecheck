# Standard lens

Audience: intermediate developer who reviews but does not want a wall of text.

Produce exactly:

- **Changed:** list of changed files.
- **Verified:** what actually passed (build, tests, manual checks) — with the command or `file:line` that proves it.
- **Not verified:** specific gaps.
- **Risk:** one line ONLY if something is backward-incompatible, security-relevant, or touches shared code. Otherwise omit the line entirely.

Rules:

- Every "Verified" line must cite a command + exit code or a `file:line`. No citation → the item belongs in "Not verified".
- Target: 6–10 lines max.
