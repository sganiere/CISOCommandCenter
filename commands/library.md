---
description: List and audit the documents in your CISO library
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Read `<workspace>/library/INDEX.md` and list the files in `<workspace>/library/` (not `archive/`).

The user's input is: $ARGUMENTS

- **No input:** show a compact table of every indexed document — filename, type, one-line summary, last reviewed date, age in days.
- **Input names a document or topic:** show that entry in full, and offer to open the document.

Always audit, and report only what's wrong:
- **Stale** — reviewed more than 180 days ago.
- **Orphaned file** — present in `library/` but missing from `INDEX.md`. Offer to register it via the `/file` flow.
- **Dangling entry** — in `INDEX.md` but the file doesn't exist.
- **Weak "Read when"** — a line that is a topic label rather than a trigger (e.g. "security strategy" instead of "when deciding whether a proposal fits the strategy"). Suggest a rewrite.
- **Overlap** — two documents whose "Read when" lines would fire together; suggest whether they should merge.

Do not change any file in this command. Propose fixes and let the user choose.
