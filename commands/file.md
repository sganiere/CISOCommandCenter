---
description: Add or update a markdown document in your CISO library and register it in the index
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Ensure `<workspace>/library/` exists (`mkdir -p`) and that `<workspace>/library/INDEX.md` exists; if not, copy `${CLAUDE_PLUGIN_ROOT}/templates/library/INDEX.md`.

The user's input is: $ARGUMENTS

Interpret it as one of:
- **A path to a markdown file** (`.md`) — read it.
- **A path to any other file type** — markdown only is supported for now. Say so, and offer to proceed if the user pastes the text or you can reasonably extract it into a new `.md` file together. Do not silently convert.
- **Pasted text, or a description of a document to create** — ask for a title if none is obvious, and treat the text as the document body.
- **Nothing** — ask what to add.

Then:

1. **Choose a filename** — a short lowercase slug (e.g. `security-strategy-2026.md`). If that file already exists in `library/`, ask whether this is an **update** (replace it) or a **separate document** (new slug). On an update, keep the old version as `library/archive/<slug>-<YYYY-MM-DD>.md` before replacing.
2. **Draft the index entry** from the document's actual content, in the format defined at the top of `INDEX.md`:
   - **Type** — strategy, project-list, team, policy, standard, reference, or other.
   - **Summary** — one line, factual.
   - **Read when** — this is the retrieval key. Write it as the situations or question types where this document should be consulted ("assessing a risk acceptance on a third party", "preparing a board risk committee update"), not as a topic label. Make it specific enough that Claude can decide from this line alone whether to open the file.
   - **Reviewed** — today's date.
3. **Show the user** the target filename and the drafted index entry. Wait for confirmation or edits before writing anything.
4. After confirmation: copy or write the document into `<workspace>/library/<slug>.md` unchanged (never rewrite the user's content), and add or replace its entry in `INDEX.md`. If the placeholder line "(No documents yet…)" is present, remove it.
5. Flag anything sensitive that stands out (e.g. individual compensation, credentials, personal data) and suggest the user check it belongs in the workspace — don't refuse, just flag.

Reply briefly: filename, the index entry as written, and whether it replaced an earlier version.
