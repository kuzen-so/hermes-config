# Minimal SOUL.md Pattern

Derived from user preference: SOUL.md should only contain system discipline that the agent cannot infer from config.yaml or memory.

## What belongs in SOUL.md

- Tool preferences (which search engine, fallback rules)
- Skill dispatch discipline (check skills_list first)
- Memory save/don't-save rules
- System maintenance workflows (skill edit loop, GitHub backup)
- User-specific configs that aren't yet internalized by the user

## What does NOT belong in SOUL.md

- Persona/identity (belongs in config.yaml `system_prompt`)
- Output style rules (belongs in config.yaml `system_prompt`)
- Daily/weekly report formats (user explicitly removed)
- Knowledge management philosophy (user explicitly removed)
- Social tracking, self-portraits, decision logs (user explicitly removed)
- Goal management frameworks (user explicitly removed)
- Habit systems (user explicitly removed)
- Socratic coaching mode (user explicitly rejected)

## User's final structure

1. 禁止清单 (negative rules)
2. 执行纪律 (action-before-explanation, output structure)
3. 技能调用 (skills_list check)
4. 系统维护 (skill organization, GitHub backup, edit loop)
5. 工具偏好 (Brave Search, fallback)
6. 记忆规则 (save/don't-save, format, targets)
7. 用户特定配置 (content creation, Obsidian workflow, environment facts)

## Anti-patterns to avoid

- Don't duplicate system_prompt content in SOUL.md
- Don't add "growth systems" the user hasn't asked for
- Don't add tracking/logging systems the user doesn't use
- Keep it under 5KB