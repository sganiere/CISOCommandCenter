---
description: One-time setup — create or connect your private CISO workspace
---

The user wants to initialize their private CISO Command workspace at this path: $ARGUMENTS

If no path was given, ask for one before doing anything else — do not guess a default, since this will hold sensitive organizational data and the user should choose deliberately where it lives (their own private git repo, an approved sync location, etc.).

Once you have a path, do the following using the bash tool:

1. Create the directory if it does not already exist (`mkdir -p <path>`).
2. Check whether `<path>/CISO_CONTEXT.md` already exists.
   - If it exists: stop and tell the user this workspace is already initialized. Do not overwrite it.
   - If it does not exist: copy `templates/CISO_CONTEXT.md` and `templates/CAPTURE_LOG.md` from this plugin's own directory (`${CLAUDE_PLUGIN_ROOT}/templates/`) into `<path>`.
3. Write the absolute path to `~/.ciso-command/workspace-path` (create the `~/.ciso-command` directory if needed), overwriting any previous value. This is how `/capture`, `/distill`, and `/brief` locate the workspace — they all read this file first.
4. Confirm to the user: where the workspace was created, that the two template files are in place, and that they should now open `CISO_CONTEXT.md` and fill in at least the Organization, Goals, and Doctrine sections by hand before relying on `/brief` — capture/distill make the file richer over time, but it shouldn't start completely empty.

Do not ask the user to set an environment variable manually — the config file in step 3 is the mechanism, and it should be transparent to them.
