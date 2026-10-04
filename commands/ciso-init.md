---
description: One-time setup — create or connect your private CISO workspace, then run the structured interview
---

The user wants to initialize their private CISO Command workspace at this path: $ARGUMENTS

If no path was given, ask for one before doing anything else — do not guess a default, since this will hold sensitive organizational data and the user should choose deliberately where it lives (their own private git repo, an approved sync location, etc.).

Once you have a path, do the following using the bash tool:

1. Create the directory if it does not already exist (`mkdir -p <path>`), plus `<path>/library/`.
2. Check whether `<path>/CISO_CONTEXT.md` already exists.
   - If it exists: do not overwrite anything. Tell the user this workspace is already initialized. Still make sure the files added in newer plugin versions exist (see below) — create any that are missing, never touch existing ones. Then offer to resume the interview (step 5) instead of stopping.
   - If it does not exist: copy these from this plugin's directory (`${CLAUDE_PLUGIN_ROOT}/templates/`) into `<path>`: `CISO_CONTEXT.md`, `CAPTURE_LOG.md`, `PHILOSOPHY.md`, and `library/INDEX.md`.
3. Write the absolute path to `~/.ciso-command/workspace-path` (create the `~/.ciso-command` directory if needed), overwriting any previous value. This is how every other command locates the workspace — they all read this file first.
4. Confirm to the user, briefly: where the workspace was created, which files are in place, and that nothing leaves their machine because of this command.
5. **Offer the structured interview**, and start it immediately if the user says yes (default yes): follow the instructions in `${CLAUDE_PLUGIN_ROOT}/commands/interview.md` from the first unfilled phase. Tell the user up front that it takes roughly 20–30 minutes end to end, that they can say "stop" or "skip" at any time, and that `/interview` resumes where they left off. If they decline, point them to `/interview` for later and remind them that `/brief`, `/assess` and `/advise` are only as good as the context behind them.

Do not ask the user to set an environment variable manually — the config file in step 3 is the mechanism, and it should be transparent to them.
