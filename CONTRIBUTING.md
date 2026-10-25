# Contributing to donecheck

- **Fixtures**: To add a new fixture case, create a folder under `fixtures/` with:
  - `diff.txt`: The git diff.
  - `context.txt`: The fake "Claude said done" statement.
  - `plain.expected.txt`, `standard.expected.txt`, `expert.expected.txt`: The output you expect.
- **Lenses**: If you're adding a new lens type, create `references/yournewlens.md` and update `SKILL.md` routing.
