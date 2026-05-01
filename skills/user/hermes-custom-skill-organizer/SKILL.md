---
name: hermes-custom-skill-organizer
description: How to create and organize custom Hermes skills so they are discoverable and not drowned out by 89+ pre-installed skills.
category: user
---

# Hermes Custom Skill Organizer

## The Pitfall

`skills_list` only scans **subdirectories** with `SKILL.md` inside `~/.hermes/skills/`. It does NOT pick up standalone `.md` files dropped in the root directory.

If you create:
```
~/.hermes/skills/My-Skill.md
```
It will be **invisible** to `skills_list`. You will think it disappeared.

## The Fix

Move custom skills into a dedicated category folder:

```
~/.hermes/skills/user/my-skill/SKILL.md
```

Now `skills_list --category user` shows only your skills, completely isolated from pre-installed ones.

## Recommended Structure

```
~/.hermes/skills/
  user/
    my-skill/
      SKILL.md
    another-skill/
      SKILL.md
  apple/
    ... (pre-installed)
  writing/
    ... (pre-installed)
```

## Why `user/` Category

Hermes ships with 89+ pre-installed skills across categories like `apple`, `writing`, `github`, `mlops`. If you put custom skills in an existing category, they get mixed in. A dedicated `user/` (or `custom/`) category lets you:

- Run `skills_list --category user` to see only yours
- Avoid accidentally overwriting pre-installed skills on update
- Keep a clean mental model: vendor skills vs. your skills

## Creating a Skill

1. Make directory: `mkdir -p ~/.hermes/skills/user/<skill-name>/`
2. Write `SKILL.md` inside that directory
3. Verify: `skills_list --category user`

## SOUL.md Note

`SOUL.md` lives directly in `~/.hermes/` (sibling to `skills/`), not inside `skills/`. It is a special file for persona definition, not a skill, and is read independently of the skill scanner.

## Cron Script Paths

Hermes cron jobs can reference Python or shell scripts as pre-run data collectors. These are typically stored in `~/.hermes/scripts/`.

### Common Problem

A cron job instruction says: *"执行 Python 脚本 fetch_app_free.py"* but `find .` in the current working directory returns nothing, and `find ~` times out because the home directory is very large.

### Solution

Search the Hermes scripts directory with a depth limit:

```bash
find ~/.hermes -maxdepth 4 -name "SCRIPT_NAME.py" 2>/dev/null
```

Or check these locations explicitly:
- `~/.hermes/scripts/`
- `~/.hermes/hermes-agent/scripts/`

Then run the script with its full path:

```bash
python3 ~/.hermes/scripts/fetch_app_free.py
```

### Key Paths

| Path | Purpose |
|------|---------|
| `~/.hermes/scripts/` | User scripts for cron jobs and automation |
| `~/.hermes/skills/` | Skill definitions (SKILL.md files) |
| `~/.hermes/SOUL.md` | Persona definition |