# Plain lens

Audience: someone who cannot or will not read the diff.

Produce exactly:

1. A verdict COMPUTED from evidence — never pre-filled:
   - "Looks done" ONLY IF build/test evidence exists for the changed code.
   - "Done, but unverified" if the code exists but no check covers it.
   - "Do not deploy yet" if data, auth, payments, or config migration is touched.
2. 2–4 short bullets: what was checked, what was not, any data/safety-relevant change.
3. Exactly ONE next action the user can ask Claude to do, or do themselves.

Rules:

- Never assert safety ("no destructive changes") unless `git diff` shows it.
- If you cannot cite evidence, say "unverified" — do not fill the gap with confidence.
- No file paths unless the user asks. No jargon. No headers beyond the verdict.
- Target: fits on one phone screen.

If more than one verdict condition applies, use the MOST SEVERE one.
Order: Do not deploy yet > Done, but unverified > Looks done.

Produce ONLY the verdict, 2–4 bullets, and ONE next action. Do not add
trailing commentary or a second paragraph.
