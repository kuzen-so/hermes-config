---
title: Content Curation — External Content Evaluation
name: content-curation
description: >
  Rapidly evaluate whether an external piece of content (article, video, thread, course)
  is worth the user's time. Used when the user drops a link and asks "is this for me?"
  or when scanning sources during research. Emphasizes one-shot verdict, minimal output,
  and alignment with the user's historical preferences and content strategy.
triggers:
  - User shares a link and asks if it's worth reading / watching / buying
  - User asks "what do you think of this" about external content
  - Research phase: evaluating sources before deep-dive
  - Detecting "preparation loop" traps — content that feels productive but produces no output
---

# Content Curation — External Content Evaluation

## 1. One-Shot Verdict Format

When the user asks "is this for me?", the answer must be a single-word or single-phrase verdict first:

- **适合** / **不适合** / **部分适合** / **无法判断**
- Then ONE sentence of reasoning.
- Then optional bullet points only if the user asks for elaboration.

The user explicitly rejects thinking-process output. Do not show your evaluation steps unless asked.

## 2. Evaluation Dimensions

Judge against these four dimensions. The content fails if it hits any red line.

| Dimension | Green Light | Red Line |
|-----------|-------------|----------|
| **Path Alignment** | Matches user's proven爆款路径 (实操教程、数字冲击、情绪释放) | "24小时速成"、"财富自由"、纯理论哲学 |
| **Actionability** | Reader can apply within one session | "收藏即学会" structure, no executable step |
| **Author Intent** | Sharing methodology, building trust | Selling a course/event, funnel to paid product |
| **User History** | Similar to past high-performing content | Similar to past low-performing content (deep tech = 200-400 views) |

### User-Specific Red Flags (from memory)

- **"Preparation loop" content**: Extensive research frames that produce no writing output. The user falls into these traps. If the content is "how to think about X" without "how to do X", it's a trap.
- **Identity-label interviews**: Content framed as "X person's story" — user rejects these in their own articles.
- **Technical jargon re-insertion**: Content that uses terms the user has explicitly stripped from their own workflow (e.g., 多轮对话压缩, 架构图代码表格, Self-Evolution Loop).
- **Addictive collection behavior**: High bookmark-to-like ratio (e.g., 1140 bookmarks vs 826 likes) signals "comfort content" — feels valuable, rarely acted upon.

## 3. Platform-Specific Extraction Notes

### X/Twitter Threads

**Critical limitation**: Third-party APIs (fxtwitter, vxtwitter, xcancel, nitter most instances) **do NOT return thread content beyond the first tweet** for unauthenticated requests. Only tweet `1/` is returned; `2/`, `3/`, etc. are omitted.

**Workarounds attempted (in order of reliability)**:

1. `api.fxtwitter.com/{user}/status/{id}` — returns tweet object, no thread array
2. `api.fxtwitter.com/{user}/status/{id}/thread` — same, no thread key
3. `api.vxtwitter.com/...` — same limitation
4. `xcancel.com` — redirects to X login wall after "click here" verification
5. `nitter.it` — occasional success (HTTP 200, HTML parseable), but structure varies; most nitter instances return 403/SSL error/empty

**Verdict if thread content is inaccessible**: State clearly "无法获取完整内容，仅基于首条判断". Do not hallucinate thread content.

### YouTube / 公众号 / 小红书

- YouTube: transcript extraction via `youtube-content` skill is reliable
- 公众号: often requires mobile view or third-party scraper; text content usually accessible
- 小红书: heavily gated; usually requires app or logged-in web session

## 4. Quick-Reference: User's Content Performance History

Use this to benchmark whether the external content's approach aligns with what actually worked.

| Content Type | Performance | Examples |
|--------------|-------------|----------|
| Deep technical | 200-400 views | — |
| 实操教程 (0-1带做) | 7,000-14,000 views | Mermaid tutorial 14,508, Notion guide 7,850 |
| 情绪释放 + 数字冲击 | 5,000-14,000 views | "突发/怎么办" 5,000+ |
| 个人故事 (小红书) | Low engagement | First post: 268 impressions, 0 engagement |

## 5. Pitfalls

- **Do not** spend more than 3-4 tool calls trying to extract content from a gated platform. If APIs fail and browser hits login wall, report the limitation and deliver verdict based on available metadata (title, author bio, engagement ratios).
- **Do not** give neutral "maybe" answers. The user wants a filter. "不适合" is a valid and useful answer.
- **Do not** recommend content that teaches "how to research" or "how to think" — the user's bottleneck is execution, not methodology.
- **Do not** praise the prompt or the link. Judge the content against the user's needs only.

## 6. References

- `references/x-thread-extraction.md` — Session log: X/Twitter thread API limitations and attempted workarounds (May 2026)
