# X/Twitter Thread Extraction — Session Log (May 2026)

## Problem

X/Twitter threads (numbered tweets: 1/, 2/, 3/, etc.) cannot be retrieved via unauthenticated third-party APIs. Only the first tweet is returned.

## Attempted Workarounds (in order)

### 1. fxtwitter API
- `api.fxtwitter.com/{user}/status/{id}` → returns single tweet object, no `thread` key
- `api.fxtwitter.com/{user}/status/{id}/thread` → same response, no thread array
- `api.fxtwitter.com/{user}/status/{id}/replies` → same response
- **Verdict**: Does NOT support thread extraction for unauthenticated requests.

### 2. vxtwitter API
- `api.vxtwitter.com/{user}/status/{id}` → returns tweet object with `conversationID` but no thread content
- **Verdict**: Same limitation as fxtwitter.

### 3. xcancel.com (nitter fork)
- URL: `xcancel.com/{user}/status/{id}`
- Behavior: Returns "Verifying your request" page with "click here" link
- After clicking: Redirects to X login wall (`x.com/i/flow/login`)
- **Verdict**: Requires X authentication. Not viable for logged-out extraction.

### 4. nitter instances
- `nitter.net` → HTTP 200, empty body (0 bytes)
- `nitter.cz` → HTTP 403 Forbidden
- `nitter.poast.org` → HTTP 403 Forbidden
- `nitter.privacydev.net` → SSL error
- `nitter.moomoo.me` → SSL error
- `nitter.fdn.fr` → SSL error
- `nitter.it` → HTTP 200, HTML body (~57KB), contains target content in page
  - However, tweet content divs use varying class names; regex extraction unreliable without DOM parsing
  - **Verdict**: Occasional success but fragile. Best as last resort.

## Current Best Practice

1. Try `api.fxtwitter.com` for metadata (author, engagement, first tweet text)
2. If thread content is needed and APIs fail, try `nitter.it` with HTML parsing
3. If all fail: **Report limitation clearly** — "无法获取完整内容，仅基于首条判断"
4. **Do not spend more than 3-4 tool calls** on extraction attempts
5. Deliver verdict based on available metadata: title, author bio, engagement ratios, bookmark-to-like ratio

## Engagement Ratio Signal

High bookmarks vs likes indicates "comfort content" — users save but don't act:
- Example: 1140 bookmarks / 826 likes = 1.38x bookmark ratio → strong "准备循环" signal
