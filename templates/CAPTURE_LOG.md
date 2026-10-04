# Capture Log

This file is the inbox. It is never read top-to-bottom by the CISO and never scrolled — only appended to by `/capture` and consumed by `/distill`, which archives processed entries out of here once applied to CISO_CONTEXT.md.

Format per entry: `- [TIMESTAMP] raw text, exactly as captured`

Nothing here is structured at capture time beyond a timestamp. Classification (which project, F/A/J, which register) happens at distill time, when there's enough context to do it well — not at capture time, when the only goal is zero friction.

---
