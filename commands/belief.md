---
description: Add or refine a belief in your CISO philosophy (PHILOSOPHY.md)
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Read `<workspace>/PHILOSOPHY.md` in full. If it doesn't exist, copy `${CLAUDE_PLUGIN_ROOT}/templates/PHILOSOPHY.md` into the workspace first.

The user's input is: $ARGUMENTS

If no input was given, ask: "What do you believe that you'd defend against pushback?" and wait.

Then:

1. **Check for overlap first.** Does an existing belief already cover this idea, even partly? If yes, propose a *refinement* of that belief (generalize its statement, add to its "Why", sharpen its "How it changes a decision") rather than a new entry. Only propose a new belief if the idea is genuinely distinct. The file should stay short — merging beats appending.
2. **Categorize** as Technical, Risk, or Leadership.
3. **Draft in the CISO's own voice** — a one-sentence statement, a "Why" (the experience or reasoning behind it), and a "How it changes a decision". If the user didn't give enough to write a real "How it changes a decision", ask for it. A belief that can't change a decision doesn't belong here — say so plainly rather than writing filler.
4. **Show the proposed change** (before → after for a refinement; the full entry for a new belief) and wait for explicit confirmation. Do not write anything until the user says yes or gives an edit.
5. After confirmation: apply it, assign the next free `B<n>` ID for a new belief (never reuse IDs), and append one dated line to the Change Log.
6. If the belief plausibly backs an existing Doctrine entry in `CISO_CONTEXT.md`, mention it and offer to reference the belief ID there — but do not edit CISO_CONTEXT.md without confirmation.

Reply briefly: what changed, the belief ID, and nothing else.
