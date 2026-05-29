---
name: obsidian-tips
description: Tips for working with Obsidian vaults that may be in non-default locations, and for managing config files through Obsidian.
---

# Obsidian Vault Management Tips (Reference)

## Vault discovery

Obsidian vaults may live in alternate locations. If the default path has no markdown files, search under Documents for directories matching the vault name.

## Config file syncing

Users sometimes want to edit Hermes personality or configuration files inside Obsidian for convenience. The general pattern is:

1. Copy or move the config file into the Obsidian vault.
2. Leave a symlink at the original location so the application can still find it.
3. Verify the symlink resolves correctly afterward.

This applies to any plain-text config file, including personality definitions.

## Active vault safety

Obsidian maintains internal link indexes and file watchers. **Never use `mv`, `rm`, or Finder-mediated moves/renames on vault directories while Obsidian is running.** Doing so breaks graph links, backlinks, and recent file history.

**Correct approaches:**
1. Ask the user to close Obsidian first, then use `mv`/`rm`.
2. Or let the user rename/move within Obsidian's own UI.
3. If the user says "don't modify" mid-operation, stop immediately — they may have Obsidian open or pending sync.

**Safe directory migration (when user wants to rename/move a vault folder):**

If the folder contains externally-referenced symlinks (e.g., `~/.hermes/SOUL.md -> ~/Documents/Obsidian/13-Hermes/SOUL.md`), `mv` or Finder rename will break the symlink. The safe sequence is:

1. Create the new directory (`mkdir 12-Hermes`)
2. Copy files into it (`cp` SOUL.md, Index.md, etc.)
3. Recreate internal symlinks inside the new directory (`ln -s`)
4. **Update external symlinks** that pointed to the old location (e.g., `rm ~/.hermes/SOUL.md && ln -s .../12-Hermes/SOUL.md ~/.hermes/SOUL.md`)
5. Update any hardcoded paths inside copied files (e.g., Index.md referencing `13-Hermes/Skills/`)
6. Verify everything resolves correctly
7. Only then remove the old directory

Never delete the old directory before confirming all external references have been repointed.

## Chinese-character path handling

When working with Chinese-named directories inside Obsidian vaults, some tools mishandle Unicode path arguments:

- **write_file**: fails on paths containing Chinese characters. Workaround: use `terminal` with shell redirection or `execute_code` with Python file I/O.
- **terminal mkdir/rmdir**: creating or deleting Chinese-named directories via `terminal` may produce `uXXXX` garbled folder names (e.g., `u9009u9898u5e93` instead of `选题库`). **Always use `execute_code` with Python `os.makedirs()` / `shutil.rmtree()` for Chinese directory operations.**
- **terminal direct arguments**: Chinese characters in path arguments may get incorrectly escaped (e.g., `03-OpenClaw\u5199\u4f5c`). Workarounds:
  - Use wildcards: `ls 03-*`
  - `cd` into the parent directory first, then operate with relative names
  - Use `execute_code` with Python `pathlib`/`os` for reliable cross-platform path handling

## Common vault paths

- ~/Documents/Obsidian Vault (default)
- ~/Documents/Obsidian (common alternate)
