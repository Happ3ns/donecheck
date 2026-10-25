# DECISIONS.md

- **Why standard is the fallback**: It provides enough context to be useful without being overwhelming, acting as a safe middle ground for unknown intent.
- **Verification mechanism**: We reused `git diff` and standard CLI output primitives instead of writing a custom analysis engine to keep the suite lightweight and reliable.
- **Scope**: Focused on reporting; did not implement auto-fix because it is outside the scope of "verification report".
