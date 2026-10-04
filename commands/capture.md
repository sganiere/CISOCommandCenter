---
description: Log a quick note to your CISO capture inbox — zero friction, no classification
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Otherwise, append exactly one line to `<workspace>/CAPTURE_LOG.md`, in this format:

`- [YYYY-MM-DD HH:MM] <text, verbatim>`

using the current date and time, and the text below exactly as given — do not summarize, reword, classify, tag, or editorialize it in any way. This command's only job is to get the thought out of the user's head and onto disk as fast as possible.

After appending, reply with only: `Captured.` Nothing else. Do not open, read, or discuss CISO_CONTEXT.md in this command — that happens at `/distill` time, not now.

Text to capture: $ARGUMENTS
