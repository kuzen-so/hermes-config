---
name: research-assistant
description: |
  Research assistance workflows: digest articles (URL, PDF, local files) into structured notes,
  and compare consumer products using third-party testing reports and industry data.
triggers:
  - User shares an article link or asks to read/summarize/extract from a URL/PDF/file
  - User asks "A vs B" for consumer goods, or wants product comparisons on measurable attributes
---

# Research Assistant

Two research workflows under one umbrella: article digestion and product comparison.

---

## Workflow 1: Article Digest

### Input Type Detection

| Input | Recognition | Tool |
|-------|-------------|------|
| Web URL | http:// or https:// | `browser_navigate` + `browser_snapshot` (dynamic) or `web_extract` (static) |
| Local Markdown/TXT | `~` or `/` path | `read_file` |
| PDF | `.pdf` suffix | `pymupdf` or `ocr-and-documents` skill |
| Image text | `.png`/`.jpg`/`.webp` | `vision_analyze` OCR |

**URL priority:**
1. `browser_navigate` first, `browser_snapshot(full=true)` for rendered content
2. If blocked, fall back to `web_extract`
3. WeChat articles usually need browser mode

### Extraction Principle

**Do not transcribe the full text.** Extract only three things:
1. Views that fill a cognitive gap
2. Cases / data / stories usable as writing material
3. Expressions quotable as punchlines

Everything else is noise.

### Note Structure (Default Output)

```markdown
---
title: "Article Title"
source: "URL or file path"
date: "YYYY-MM-DD"
type: "article"
tags: []
---

# One-sentence summary
(Restate the core argument in your own voice, not copied)

# Core argument analysis
(Break down what the author is actually claiming — the underlying logic)

# Problem it solves
(What pain, status quo, or contradiction is this article addressing?)

# Key points
1. Point one: ...
2. Point two: ...
3. Point three: ...
(Each ≤3 lines, colloquial, de-AI-ed)

# Feasibility assessment
(Does it hold up? Is evidence sufficient? What are the limits, caveats, counterexamples?)

# Usable material
- Case: ...
- Data: ...
- Story: ...
- Punchline: ...

# My insight
(Leave blank for the user to fill)
```

### Save Location
- Default: `~/Documents/Obsidian/01-Inbox/Readings/`
- Filename: `YYYY-MM-DD-short-title.md`
- If user only wants summary, return directly without writing

### Style Constraints
1. **De-AI**: Ban "首先/其次/再次/最后/总之/不得不说"
2. **Colloquial**: Like telling a friend
3. **Structured**: Lists and short paragraphs, no dense blocks
4. **Second person**: Notes are written to "you"

### Special Cases
- **WeChat articles**: Filter out declarations, ads, intros. Find the author's real sentence.
- **English articles**: Summary in Chinese; keep English for punchlines / proper nouns with Chinese translation
- **Video articles**: Hand off to `youtube-content` skill

---

## Workflow 2: Consumer Product Comparison

### Search Strategy: Official Testing Reports First

For consumer goods comparisons, highest-quality sources are government-affiliated consumer protection agencies.

**In China, prioritize:**
- Provincial/Municipal Consumer Councils (消费者委员会 / 消委会 / 消保委)
  - Keywords: `消委会 比较试验`, `消保委 测评`, `市监局 抽检`
  - Reliable: Shenzhen, Shanghai, Fujian/Fuzhou, Zhejiang
- State Administration for Market Regulation (国家市场监督管理总局)

**Search templates:**
- `{品牌A} {品牌B} {指标} 对比 测评`
- `{产品类别} 比较试验 咖啡因/糖分/脂肪含量 结果`
- `{城市} 消委会 {产品} 测评`

### Data Retrieval
1. Start with `browser_navigate` to Bing/Baidu with Chinese queries
2. If target page empty/blocked: `browser_console` with `document.body.innerText`, or `curl` + `sed 's/<[^>]*>//g'`
3. Look for tables and charts in official reports

### Handling Missing Direct Comparisons

When direct A-vs-B data does not exist:
1. Find industry benchmarks: reports testing Brand A against market averages
2. Analyze brand positioning: specialist vs generalist
3. Use product logic (e.g., Americano vs Latte caffeine concentration)
4. State uncertainty honestly, then provide inferred conclusion with reasoning

### Citation and Output
- Cite source body and date (e.g., "深圳市消费者委员会2024年测评报告")
- Include measured ranges when available
- Translate technical findings into plain language

### Pitfalls
- Do not assume two brands in the same category are directly comparable on key metrics
- Do not fabricate specific mg/kg numbers if the report only mentions in passing
- Anti-bot pages: many Chinese news sites return empty to headless browsers. If `browser_snapshot` returns "Empty page", try `browser_console` or `curl + sed`
- Do not guess article URLs from search snippets. Prefer roundup/aggregation pages (e.g., macrumors.com/roundup/)
- Stop guessing URLs after two failures

---

## Shared Pitfalls

- **Full transcription**: User wants essence, not copy-paste
- **Confusing opinion with fact**: Distinguish "what the author said" from "what evidence supports"
- **Missing usable material**: Data, cases, stories are what writing lacks most
- **Re-engaging with looped research**: When a hungry/stuck user proposes alternatives after you've given the answer, the circling itself is the enemy. State the boundary and enforce execution.