# Tool Evaluation Decisions

Session-derived decisions on creative production tools. Updated as user evaluates and settles choices.

## Image Asset Management — SETTLED

**Selected: Pixcall**
- Cloud sync, SQLite storage (lightweight)
- Free tier sufficient
- Active development

**Eliminated:**
- Eagle: JSON index too memory-heavy
- Billfish: Development stopped
- Picsee: Too niche, weak ecosystem

**Secondary:**
- Apple Photos: Life photos only (family, travel)

## Video / Movie Management — SETTLED

**Selected: Infuse**
- Apple-native, auto-scraping metadata/posters/actors
- Best playback experience on Apple ecosystem
- Supports local folders and NAS

**Eliminated:**
- Movist Pro: No library management, no metadata scraping
- HamHub / VidHub: Niche, immature, long-term risk

**Alternative if needed:**
- Plex: Media server for NAS/multi-device streaming (heavier setup)

## File Structure Convention

```
~/Media/     → Images, screenshots, design assets (Pixcall)
~/Videos/    → Movies, tutorials, downloaded video (Infuse)
```

Management in Finder. Browsing/playback in specialized apps.

## Cloud Storage for Media

**Selected: 阿里云盘**
- Fast upload in China
- Works with Infuse via WebDAV
- Cost-effective

**Eliminated:**
- Google Drive: Slow upload from China (international bandwidth + firewall), expensive
- 百度网盘: Intentional speed throttling

## Tool Selection Principles

User's criteria when evaluating tools:

1. **Memory/resource footprint first** — rejected Eagle for JSON bloat
2. **Active development required** — rejected Billfish for abandonment
3. **Apple ecosystem preferred** — Infuse over cross-platform alternatives
4. **买断制 > 订阅** — preferred where possible
5. **Management in Finder, browsing in app** — accepts specialized apps don't manage files
6. **Cloud for archive, local for active work** — large libraries go to cloud
