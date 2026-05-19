---
name: creative-production-stack
title: Creative Production Tool Stack
description: User's settled creative production toolchain — video editing, motion graphics, color grading, image asset management, and media collection. Decisions are final; do not re-litigate.
category: user
tags: [video-editing, motion-graphics, color-grading, creative-tools, image-management, media-collection]
author: session-derived
version: 1.1.0
---

# Creative Production Tool Stack

User's settled creative production toolchain. **Decisions are final — do not re-litigate.**

## Video Editing

| Tool | Status | Use Case |
|------|--------|----------|
| **Premiere Pro (PR)** | ✅ Primary | All editing work |
| Final Cut Pro | ❌ Ruled out | Sold/abandoned — less capable than PR |
| 剪映 (CapCut) | ❌ Ruled out | Consumer/short-video only; user's professional stack makes it redundant |

**Why PR over FCP**: Dynamic link with AE, cross-platform (Win/Mac project interchange), industry standard for team collaboration, deeper plugin ecosystem.

## Motion Graphics / Compositing

| Tool | Status | Use Case |
|------|--------|----------|
| **After Effects (AE)** | ✅ Primary | Complex motion graphics, compositing, particle systems, 3D space, plugin ecosystem (Trapcode, Element 3D, etc.) |
| Apple Motion | ❌ Ruled out | Too limited — no real 3D, no serious plugin ecosystem, essentially FCP's "plugin generator" |

**Why AE over Motion**: Not even comparable. AE has 30 years of ecosystem depth. Motion is a lightweight companion to FCP, not a professional compositor.

## Color Grading

| Tool | Status | Use Case |
|------|--------|----------|
| **DaVinci Resolve** | ✅ Primary | Color grading; free version sufficient |
| FCP built-in | ❌ Ruled out | Too basic |

**Workflow**: PR edit → export to DaVinci for grade → render final. No round-trip dynamic link; manual XML or video export.

## Image Asset Management

| Tool | Status | Use Case |
|------|--------|----------|
| **Pixcall** | ✅ Primary | Image/asset management with cloud sync. SQLite storage (more efficient than Eagle's JSON). Free tier sufficient. |
| Eagle | ❌ Ruled out | File index consumes too much memory; overkill for user's needs |
| Billfish | ❌ Ruled out | Development stopped; dead product risk |
| Apple Photos | ⚠️ Secondary | Life photos only (family, travel). Not for design assets. |

**Why Pixcall**: Cloud sync, lightweight SQLite backend, free tier enough, actively developed. Trade-off: shallower feature depth than Eagle, weaker browser plugin.

**Decision criteria used**: Memory footprint > feature depth. User explicitly rejected Eagle for resource usage and Billfish for being abandoned.

### Pixcall Boundaries (Hard Rules)

User explicitly defined: **"图库就是图库，不能放视频，只能是静态的"**

| In Pixcall | NOT in Pixcall |
|------------|----------------|
| JPG / PNG / HEIC | MP4 / MOV (any video with audio/progress bar) |
| GIF (looping, no audio) | Course videos / tutorials |
| SVG / vector files | Screen recordings / live streams |
| 3D models (glb / gltf / obj) | |
| Design source files (PSD / AI / Figma) | |

**Rationale**: Pixcall is a **visual-first asset manager**, not a media manager. Videos break the "one-glance scan" workflow. GIFs count as static because they loop without audio controls. Videos belong in `Reel` (video library), managed separately.

### Local Folder Structure

```
Ref/           # 图库 — static visual assets (managed by Pixcall)
  素材/         # Reusable: textures, icons, illustrations
  参考/         # Inspiration: color, composition, style
  作品/         # Own output: design drafts, renders
  模型/         # 3D assets: glb, obj, fbx

Reel/          # 视频库 — dynamic media (NOT in Pixcall)
  课程/         # Learning content
  素材/         # Editable clips
  存档/         # Raw footage, cold storage
```

**Naming**: `Ref` + `Reel` — 3-letter parity, professional, clear boundary. Chinese alternatives rejected for being too generic (素材/资源 mix up image and video).

**macOS reality**: System folders (Downloads, Pictures, 影片, 桌面) are in Chinese and protected. Custom folders use English. Accept the mix — don't fight it.

## Video / Movie Management

| Tool | Status | Use Case |
|------|--------|----------|
| **Infuse** | ✅ Primary | Local video library (Movies + tutorials). Auto-scraping, Apple ecosystem, playback + browsing. Pro subscription for full features. |
| **Plex** | ⚠️ Alternative | Media server if NAS/cloud streaming needed. Heavier, requires server setup. |
| **Movist Pro** | ❌ Ruled out | Replaced by Infuse — no library management, no metadata scraping |
| **HamHub / VidHub** | ❌ Ruled out | Niche alternatives, immature, long-term risk |

**Why Infuse**: Best Apple-native playback experience, automatic poster/actor/metadata scraping, supports NAS/local folders. Trade-off: management (move/delete/rename) still done in Finder.

**File structure**: `Media/` (images, managed by Pixcall) + `Videos/` (movies/tutorials, played by Infuse)

## Cloud Storage for Media

| Service | Status | Use Case |
|---------|--------|----------|
| **阿里云盘** | ✅ Primary | Fast upload in China, works with Infuse via WebDAV, cost-effective |
| **Google Drive** | ⚠️ Secondary | Slow upload from China (international bandwidth + firewall), 2TB $9.99/mo, not ideal for video streaming |
| **百度网盘** | ❌ Ruled out | Intentional speed throttling on free tier, poor experience |

**Principle**: Local SSD storage is expensive. Large movie libraries → cloud + stream on demand. Tutorials → cloud, download when needed.

## Complete Workflow

```
Premiere Pro (edit)
    ↓ dynamic link
After Effects (motion graphics / VFX)
    ↓ export
DaVinci Resolve (color grade)
    ↓ render
Final output → Videos/ (Infuse library)

Pixcall (image asset management)
    ↓ cloud sync
All devices ← Media/
```

## Tool Selection Principles

User's decision criteria when evaluating creative tools:

1. **Memory/resource footprint first** — rejected Eagle for JSON index bloat
2. **Active development required** — rejected Billfish for being abandoned
3. **Apple ecosystem preferred** — Infuse over Plex for native experience
4. **买断制 > 订阅** — preferred where possible (Pixcall free tier, Infuse Pro if needed)
5. **Management in Finder, browsing in specialized app** — accepts that Infuse doesn't manage files
6. **Cloud for archive, local for active work** — large media libraries go to cloud storage

## Ruled-Out Tools Summary

| Tool | Why Ruled Out |
|------|--------------|
| Final Cut Pro + Motion suite | Less capable than PR+AE; Mac-only; no dynamic link; Motion is not a real AE competitor |
| 剪映 / CapCut | Consumer-grade; user's professional needs exceed its ceiling |
| Eagle | File index too memory-heavy; user prioritizes lightweight operation |
| Billfish | Development stopped; abandoned product |
| Movist Pro | No library management, no metadata scraping; Infuse covers playback + browsing |
| HamHub / VidHub | Niche immature alternatives; ecosystem and long-term support risk |
| Google Drive (primary media storage) | Slow upload from China, expensive, not optimized for video streaming |

## macOS System Folder Notes

- System folders (Downloads, Pictures, 影片, 桌面, 文稿, 公共, 应用程序) are in Chinese and **cannot be renamed**.
- Custom user folders use English — accept the mix.
- **Downloads is system-protected**: the "Locked" checkbox in Get Info is greyed out and cannot be toggled. Cannot delete, move, or rename via Finder.
  - To change default download location: Safari Settings → General → File download location.
  - To bypass for file operations: use Terminal (`mv`, `rm`, etc.) or change app-specific download paths.
- **Pictures vs Ref**: Pictures = system default for camera/phone imports. Ref = user-curated design assets managed by Pixcall. Keep both, know the boundary.

User evaluated all options hands-on and made final choices. **Do not suggest alternatives** ("have you tried X?"). The stack is settled.

**Exception**: If a new tool genuinely surpasses the current stack in the user's specific workflow, present evidence — but expect high skepticism.

## References

- `references/image-management-comparison.md` — Image/movie management software comparison data (session-derived)
- `references/tool-evaluation-decisions.md` — User's settled decisions and selection criteria (session-derived)