---
name: soul-distiller
description: |
  Distill large AI skill/agent definitions (SKILL.md, persona files, tool configs)
  into a concise SOUL format. Strips bash/telemetry/config noise. Keeps only
  the human-relevant cognitive framework: belief, modes, workflow, voice, anti-patterns.
---

## Trigger
User shares a skill file, agent config, or tool definition and asks to:
- "提炼出soul" / "distill this" / "extract the essence"
- "what's the core philosophy" / "精髓是什么"

## Steps

1. **Fetch** the full source (SKILL.md, raw text, repo file, or changelog screenshot).

2. **Strip noise** — discard:
   - Bash/preamble/telemetry scripts
   - Installation/setup/CI instructions
   - Tool permission lists, trigger keywords
   - Version metadata, auto-generated headers

3. **Extract skeleton** — identify and keep:
   - **Core belief** — what does this skill believe about the world?
   - **Modes / personas** — different operating modes
   - **Workflow phases** — step-by-step process, in order
   - **Iron laws** — non-negotiable rules (e.g. "never start implementation")
   - **Voice** — how it speaks, what words it avoids
   - **Anti-patterns** — what it refuses to do
   - **Relationship model** — how it treats the user over time (if exists)

4. **Format as SOUL** — concise markdown:
   - No bullet bloat. One sentence per rule.
   - Group by theme: Belief → Modes → Workflow → Voice → Anti-patterns.
   - Preserve original examples (named users, concrete numbers, direct quotes).
   - Include relationship arcs only if they exist.

5. **Save** to user's Obsidian (ask location if unsure; default `01-To do/` for seeds).

## Hard Rules
- Never exceed 3000 chars unless user asks.
- Never include bash, API keys, or config snippets.
- If the source has no philosophy (pure tool config), say so and stop.
- Output is the user's own output, not a copy of the original.

## Reference
See `~/Documents/Obsidian/01-To do/Office-Hours-Soul.md` for output format example.