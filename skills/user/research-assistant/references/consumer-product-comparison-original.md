---
name: consumer-product-comparison
description: |
  Research and compare consumer products (e.g., food, drinks, electronics) using third-party testing reports and industry data. Use when the user asks "A vs B" performance, safety, or ingredient questions and direct brand comparisons are unlikely to exist.
triggers:
  - User asks to compare two commercial products/brands on measurable attributes
  - User asks "why is X better than Y" for consumer goods
  - Direct brand-to-brand test data is needed but probably unavailable
  - User is deciding "buy now vs wait" for an upcoming tech product refresh (e.g., Apple M-series chips)
---

# Consumer Product Comparison（Reference — 原始完整版）

## 1. Search Strategy: Find Official Testing Reports First

For consumer goods comparisons (food safety, caffeine content, material quality, etc.), the highest-quality sources are government-affiliated consumer protection agencies.

**In China, prioritize these sources:**
- Provincial/Municipal **Consumer Councils** (消费者委员会 / 消委会 / 消保委)
  - Keywords: `消委会 比较试验`, `消保委 测评`, `市监局 抽检`
  - Reliable bodies: 
    - 深圳市消费者委员会 (Shenzhen Consumer Council)
    - 上海市消费者权益保护委员会 (Shanghai Consumer Council)
    - 福建省/福州市消委会 (Fujian/Fuzhou)
    - 浙江省消保委 (Zhejiang)
- **State Administration for Market Regulation** (国家市场监督管理总局) and local branches

**Search query templates:**
- `{品牌A} {品牌B} {指标} 对比 测评`
- `{产品类别} 比较试验 咖啡因/糖分/脂肪含量 结果` (replace with relevant metric)
- `{城市} 消委会 {产品} 测评`

## 2. Data Retrieval Workflow

1. **Start with browser search**: Use `browser_navigate` to Bing/Baidu with Chinese queries. This usually yields structured results with titles and snippets.
2. **If target page is empty/blocked**: Use `browser_console` with `document.body.innerText` to extract text from a loaded page. If that fails, fall back to `curl` with a desktop User-Agent and pipe through `sed 's/<[^>]*>//g'` to strip HTML.
3. **Look for tables and charts**: Official testing reports often contain charts (e.g., `图1 24款现制咖啡饮品的咖啡因实测值`). If the page has images with data tables, try to access image URLs directly or describe what the table would contain based on surrounding text.

## 3. Handling Missing Direct Comparisons

Often, direct A-vs-B test data does **not** exist (e.g., a tea brand's coffee line isn't tested alongside a coffee specialist). In these cases:

1. **Find industry benchmarks**: Use reports that tested Brand A against the broader market. Extract the industry average and range.
2. **Analyze brand positioning**:
   - Is Brand A a specialist in this category? (e.g., Cotti = coffee specialist; Good Me = tea brand with coffee as a side line)
   - Specialists usually optimize for the core metric (caffeine concentration, material purity, etc.); generalists optimize for taste/accessibility.
3. **Use product logic**: Compare formulations. For example:
   - Americano vs. Latte: Americano has higher caffeine concentration because it lacks milk dilution.
   - "0 sugar 0 fat 0 energy" claims indicate undiluted coffee base.
4. **State uncertainty honestly**: If no direct comparison exists, say so explicitly, then provide the inferred conclusion with reasoning.

## 4. Citation and Output

- Always cite the source body (e.g., "深圳市消费者委员会2024年测评报告") and date.
- Include the actual measured range when available (e.g., "24款样品咖啡因含量在164mg/kg-563mg/kg之间").
- Translate technical findings into plain-language takeaways for the user.

## Pitfalls

- **Do not assume** that because two brands sell the same product category, they are directly comparable on key metrics. A tea shop's coffee and a coffee shop's coffee have different formulation priorities.
- **Do not fabricate** specific mg/kg or mg numbers for a brand if the report only mentions it in passing (e.g., "库迪咖啡达到0糖0脂0能量要求" does not give an exact caffeine number).
- **Anti-bot pages**: Many Chinese news sites (huanqiu.com, cqn.com.cn) return empty pages to headless browsers. If `browser_snapshot` returns "Empty page", immediately try `browser_console` with `document.body.innerText`, or fallback to `curl + sed`.
- **Do not guess article URLs from search snippets**: When tracking unreleased tech products, individual article URLs often 404 or are paywalled. Prefer **roundup/aggregation pages** (e.g., `macrumors.com/roundup/macbook-pro/`) which are living documents continuously updated by editors. See `references/apple-product-rumors-tracking.md` for proven sources and workflow.
- **Stop guessing URLs after two failures**: If two direct URL attempts fail (404, bot detection, timeout), switch strategy immediately — do not loop on permutations of the same failed approach.
