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
## 6. Price-Conscious Product Comparison (Frugal Mode)

When the user asks "哪个便宜" or "想换个便宜点的" or sends multiple product screenshots for comparison:

**Frame:**
| 产品 | 容量 | 价格 | 单价 | 核心差异 |
|------|------|------|------|---------|
| [A] | | | | |
| [B] | | | | |

**Decision rule:**
- 成分/技术无差异（如氨基酸洁面）→ 选单价最低、包装最省事的
- 成分/技术有差异（如酸类浓度、原料纯度）→ 便宜可能=虚标/刺激，守住底线品牌
- 营销话术（"神经酰胺""双倍玻尿酸"）在洁面中不驻留，冲水带走 → 不为这些买单

**Frugal pitfalls:**
- 补充装省几毛钱但需自备容器 → 残留污染、折腾，不省
- 杂牌低价（如壬二酸20块）→ 浓度虚标、悬浮体系差、刺激不可控
- 为"升级""新版"多花钱 → 核心清洁力一样，买的是安慰剂

**Closing:** 定一个，今天下单。不囤，用完再买。

## 7. Multi-Platform Screenshot Comparison (Exhaustive Mode)

When the user sends multiple product screenshots from different platforms (拼多多/JD/淘宝) for the same SKU, or repeatedly asks "还有其他的么" / "这一款呢":

**Pattern:** The user is exhausting options before committing. They need a **decision gate**, not more options.

**Response structure:**
1. **Acknowledge the pattern:** "你在穷尽选项，这是决策拖延。"
2. **Consolidate all seen options into one table:** 容量/价格/单价/平台/物流
3. **Add the "invisible option":** 不买/继续用现有的/等促销
4. **Force binary choice:** "A 或 B，不找 C。"
5. **If user still asks "还有其他的么":** "没有更好的了。定一个，今天下单。"

**Pitfall:** Do not generate new options after the third comparison. The user's anxiety is not about information, it's about commitment. More options = more anxiety.

**Pitfall:** When user says "已购买" followed by "还需要买其他的么", do not推销. List what they already have, mark缺口, let them判断是否需要补。

## 7. Pitfalls

- **Do not assume the user's region.** Ask or infer from context (国补、运营商、Apple ID 区域).
- **Do not give feature lists without purchase feasibility.** A feature the user cannot access is a negative, not a positive.
- **Do not use "视情况而定" as a closing.** Give a conditional recommendation with explicit triggers.
- **Do not praise half-measures.** "基本合格"是噪音。Say what was wrong and what the next correction is.
- **Do not over-explain after the user has already decided.** When the user says "帮我卸载" or 明确放弃一个选项，执行动作，不追加长篇对比分析。他们已经做了选择，额外的"为什么不好"是噪音。
- **Do not ask redundant clarifying questions when the user has already given enough signal.** When the user says "都有吧" or gives a terse confirmation, treat it as sufficient input and move to recommendation. Asking "具体是什么" after they already indicated scope is friction, not precision.
- **Do not over-explain after the user has already decided.** When the user says "帮我卸载" or明确放弃一个选项，执行动作，不追加长篇对比分析。他们已经做了选择，额外的"为什么不好"是噪音。
