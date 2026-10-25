# DECISIONS.md

- **Why standard is the fallback**: It provides enough context to be useful without being overwhelming, acting as a safe middle ground for unknown intent.
- **Verification mechanism**: We reused `git diff` and standard CLI output primitives instead of writing a custom analysis engine to keep the suite lightweight and reliable.
- **Scope**: Focused on reporting; did not implement auto-fix because it is outside the scope of "verification report".
- **v0.1.0 install verified.** `/donecheck is this good` after cloning returned
  `[donecheck: plain lens — plain phrasing detected]` and the verdict
  "Done, but unverified", correctly refusing to claim "Looks done" without
  build/test evidence. Known drift: the plain lens still appends a trailing
  paragraph, violating the "ONE next action" rule. Fix pending in plain.md.
