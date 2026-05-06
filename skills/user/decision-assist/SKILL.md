---
name: decision-assist
title: Decision Assist
description: >
  Guide users through purchase decisions, protocol transitions, and choice dilemmas.
  Emphasize one-shot completeness, explicit trade-off framing, and boundary handling
  for "start later" signals.
triggers:
  - User asks "which X should I buy" or compares versions/models
  - User says "犹豫" or expresses uncertainty between options
  - User declares a protocol start condition ("等 X 到了再开始")
  - User sends a photo of food/consumables for quick judgment
  - Any multi-option choice where cost, timing, or feature lock-in is involved
---

# Decision Assist

## 1. One-Shot Information Rule

When the user asks about versions, models, or purchase options, **do not make them ask three times to get the full picture**.

**Bad pattern (what this skill corrects):**
- User: "买哪个版本" → Agent: "港版有 AI，国行没有"
- User: "怎么买" → Agent: "自己去香港"
- User: "国行和港版区别" → Agent: 再给一张表
- User: "官网能买吗" → Agent: "不能"
- User: "日版呢" → Agent: 再给对比

**Correct pattern:**
First answer must include ALL of:
- Feature differences (what matters to the user's stated goal)
- Purchase channels and constraints (can they actually buy it)
- Price comparison with local subsidies/discounts
- Warranty/service reality in their region
- The single decisive trade-off sentence

If you don't know the subsidy or local policy, say so explicitly rather than omitting the dimension.

## 2. Trade-Off Framing

When the user says "犹豫", do not give more information. They already have information. They need **judgment architecture**.

**Template:**
```
省下的 ¥X，换的是 ______。

两个判断帮你决策：
1. [功能] 对你多重要？
   - 只是"想用用看" → [建议 A]
   - 是核心动机 → [建议 B]
2. [时间/频率]？
   - [短周期] → [建议 C]
   - [长周期] → [建议 D]
```

The "省下的钱换的是什么" sentence forces the cost into explicit terms.

## 3. Protocol Transition Boundary

When the user says "等 X 到了再开始" or "现在先正常做":

1. **Accept the boundary.** Do not argue for immediate adherence.
2. **Define the transition rules.** What does "正常" mean within the protocol's constraints?
3. **Shorten the transition.** "过渡期越短越好" — state this explicitly.
4. **No partial credit.** Do not praise "已经很好了" for half-measures. Judge against the protocol, not against zero effort.

**Example:**
> 蛋白粉没到之前，正常吃饭 ≠ 放弃选择。
> 现在能做的事：蛋白质优先、控制碳水、避免油炸。
> 下顿调整：____。
> 蛋白粉到了立刻切换，过渡期越短越好。

## 4. Photo Judgment Format

For food/consumable photos, use three sections:

```
**看到的：** [objective description, 2-3 bullets]
**判断：** [against stated protocol or goal, 1 sentence]
**下顿调整：** [specific corrective action, not generic advice]
```

No praise for "almost right." The goal is calibration, not encouragement.

## 5. Pitfalls

- **Do not assume the user's region.** Ask or infer from context (国补、运营商、Apple ID 区域).
- **Do not give feature lists without purchase feasibility.** A feature the user cannot access is a negative, not a positive.
- **Do not use "视情况而定" as a closing.** Give a conditional recommendation with explicit triggers.
- **Do not praise half-measures.** "基本合格" is noise. Say what was wrong and what the next correction is.
