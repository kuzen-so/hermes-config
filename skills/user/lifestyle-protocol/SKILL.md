---
name: lifestyle-protocol
title: Lifestyle Protocols
description: |
  Personal lifestyle protocols for health, appearance, and physical maintenance.
  Zero-maintenance, minimal-decision frameworks. Subtraction over addition,
  measurement over estimation, repetition over variety.
category: user
tags: [fitness, skincare, health, diet, supplements, personal-protocol]
author: session-derived
version: 1.0.0
---

# Lifestyle Protocols

Personal lifestyle protocols for health, appearance, and physical maintenance.

## Shared Core Philosophy

All protocols under this umbrella follow the same decision framework:

- **Subtraction > Addition**: Remove the wrong thing before adding a new one
- **Measurement > Estimation**: Track numbers (weight, waist, oil timing, stimulus frequency) rather than guessing
- **Repetition > Variety**: Same meals, same routines, same products — minimize decision fatigue
- **Zero Maintenance**: Protocols must run without daily micro-decisions or tracking apps
- **One Change at a Time**: Modify exactly one variable, then verify for 3 days before the next change
- **Binary Commitment**: Every plan ends with "Tomorrow at [time]: [action]. Can you do it?" — no open-ended exits

## Shared Pitfalls

| Pitfall | Why It Happens | Fix |
|---------|---------------|-----|
| Giving multiple options (A/B/C) | User asks for choice | Give one recommendation; if rejected, replace with one alternative |
| Explaining premium marginal benefits | User asks "is it worth it?" | Answer yes or no directly; no feature matrices |
| User says "wait for X to arrive before starting" | Delay tactic | Accept the delay; do not repeatedly ask "can you start now?" |
| Skipping diagnostic questions | User is impatient | Pause: "Answer X or the plan stops." No assumptions |
| Writing the plan for the user | User is passive | Provide a template with blanks; force the user to fill the first line; validate before continuing |
| Option circling when hungry or stressed | Decision quality drops | Stop. Name the default. Enforce execution without further discussion |

---

## Protocol A — Fitness (身体成分管理)

### A.1 Body Composition Assessment

1. Height + weight → BMI (screening only)
2. Sit and count abdominal folds
   - 0 folds: <15% body fat
   - 1 fold: 16–20%
   - 2+ folds: 21%+
3. 7-day morning weight average
4. Waist at navel, end-expiration
5. Baseline photos: front + side, natural light, phone 1.5 m away

**Goal**: Facial contour improvement typically requires 12–15% body fat, 8–12 weeks, ~1 lb fat loss per week.

### A.2 Diet Plan

#### Mandatory Information (do not proceed without)

| Required Info | Why |
|---------------|-----|
| Wake-up time | Determines meal timing and count |
| Cooking ability (self-cook / delivery / convenience) | Determines ingredient list |
| Food rejections (allergy / aversion / religious) | Prevents plan collapse on day 2 |
| Budget | Filters protein sources |
| Weight and height | Calculates protein and calorie targets |
| Training history | Determines exercise starting point |
| Sleep regularity | Identifies whether root cause is sleep or diet |

**If user avoids answering → pause.** "Answer X or the plan pauses." No assumptions.

#### Goal Integration (merge, do not stack)

Example hierarchy:
1. Earn money (core)
2. Appearance (serves earning)
3. Health (foundation)
4. Body composition (result of health, not an independent goal)

**Rule**: If a new goal is a sub-item of an existing goal, fold it in. Do not add to the stack.

#### Minimal Menu

- Same meals every day; no rotation, no decisions
- Protein first; everything else is filler
- One cooking technique repeated (boil / pan-fry / shake)

**Protein Sources**

| Source | Protein/g | Cost per g protein | Prep Difficulty | Palatability |
|--------|-----------|-------------------|-----------------|--------------|
| Whole egg | 6g/egg | Extremely low | Boil | High |
| Liquid egg white | 3.5g/piece | Low | Pour or boil | Neutral |
| Chicken breast | 31g/100g | Low | Slice + pan-fry | Low (often rejected) |
| Protein powder | 20–25g/scoop | Medium | Shake | Medium |
| Skinless chicken thigh | 26g/100g | Low | Same as breast | High |
| Lean pork | 26g/100g | Low | Slice + pan-fry | High |
| Tofu | 8g/100g | Extremely low | Cube + boil | Medium |

**If user rejects one protein → immediately switch to the next.** Sustainability > optimality.

**Meal count decision**
- Wake before 8 AM + regular sleep → 3 meals
- Wake after 10 AM or irregular sleep → 2 meals, larger portions
- User wants fewer decisions → 2 meals (if tolerable)

#### Convergence Lock

After every modification, restate the complete plan and new total protein. Do not let the user gradually drift into an imbalanced plan.

#### Lock Execution Format

```
| Meal | Time | Content | Protein |
|------|------|---------|---------|
| ...  | ...  | ...     | ...     |

Total protein: Xg
Daily cost: ~Y yuan
Weekly prep: Z minutes

Tomorrow [time]: [first meal]. Can you do it?
```

**Must be binary confirmation; no open endings.**

### A.3 Hunger Emergency Protocol

**Detection signals**
- Repeatedly asking "X or Y" — carb escalation
- Asking "can I have [high-carb]?" — already rejected before
- Saying "I don't think it's enough" — ignoring the numbers
- Skipping meal times / location problems

**Response**

1. **Lock the meal's role**
   "This meal is: (a) delayed lunch (b) afternoon snack (c) dinner replacement (d) prep for tomorrow?"

2. **Hard boundary once**
   Fat-loss phase: "No noodles, fried rice, or set meals. These are not on the menu."

3. **Protein-first default**
   Use existing inventory or nearest available source. Convenience-store roasted chicken beats instant noodles.

4. **Terminate option circling**
   When user proposes a 3rd+ alternative: "Stop. You're hungry and decision quality is dropping. [Default] is the answer. Execute now."

5. **Enforce execution, no discussion**
   "Eat now. Report back what you actually ate."

**Carb emergency exception**
Real crash (shaking, unable to work, no protein available):
- Small carb: half a banana, one small bun, 100g rice
- Must pair with: "Replenish protein within 2 hours or crash again"
- This is damage control, not the plan

### A.4 Training

- 3×/week, 45 minutes
- Compound movements preferred (not upper-body-only)
- Verification: weekly weight + waist + photos, not daily

### A.5 Supplement Purchasing

#### Identify the Correct Product Category

| User Wants | Often Buys Wrong | Check |
|------------|------------------|-------|
| Whey protein (fat-loss / muscle gain) | Mass gainer / weight gainer | Title contains "Gainer" "增肌粉" "增重" "Mass" → wrong |
| Whey isolate (high purity) | Whey concentrate | Look for "Isolate" vs "Concentrate" |
| Pre-workout | Energy drink / BCAA | Check caffeine + beta-alanine content |

**Rule**: Title contains "Gainer" "增肌粉" "增重" "Mass" → immediately correct; this is the wrong product for fat-loss / muscle-gain goals.

#### Price and Authenticity

| Price | Interpretation | Action |
|-------|---------------|--------|
| ~¥120–150 / 2.2 lb | Too low | Possibly fake / expired / gray market |
| ~¥200–250 / 2.2 lb | Normal promotion | MyProtein, 康比特 acceptable |
| ~¥350–450 / 5 lb | Normal | ON Gold Standard, good per-lb value |
| >¥500 / 5 lb | Premium / retail | Wait for promotion unless urgent |

**Authenticity red flags**
- Title contains "熊猫" (not an official brand name)
- "USA" origin label + "UK original" claim contradictory
- 12-year-old store with only 100+ sales
- Price 50%+ lower than iHerb / official store

#### Flavor and Size
- First purchase: avoid unflavored
- Safety ranking: chocolate > strawberry > vanilla > matcha > unflavored
- Buy one bag first; confirm palatability before bulk
- Bag: cheaper, harder to scoop. Tub: easier to scoop, slightly more expensive

#### Lock the Purchase
1. Confirm product name, flavor, price, shipping date
2. Execution start date = arrival date + 1 day
3. List pre-arrival prep (buy eggs, prepare pot, etc.)

---

## Protocol B — Skincare (护肤)

### B.1 Diagnosis (ask all, skip none)

1. Morning routine: specific products and order
2. Evening routine: specific products and order
3. Skin type: oily / dry / combination / sensitive
4. Oil timing: how many hours after washing does oil appear?
5. Primary goal: oil control / acne / blackheads / pore reduction / even tone
6. Sun exposure: indoor by window? outdoor? current sunscreen status?
7. Existing product list and concentrations (e.g., "20% azelaic acid")

### B.2 Common Traps

| Trap | Manifestation | Fix |
|------|--------------|-----|
| Oily skin + occlusive moisturizer | Squalane, heavy cream → afternoon oil crash | Switch to hyaluronic acid / light lotion |
| Over-cleansing | Soap / strong foam → barrier damage → compensatory oil | Switch to amino-acid cleanser |
| Acid without moisturizing | Stimulus → worse barrier → worse appearance | Thick B5 after acid |
| Acid without sunscreen | Hyperpigmentation | Sunscreen when going out |
| Refill packs without pump | Residue contamination, hassle | Buy full-size with pump |
| Cleanser marketing ingredients | Ceramide / hyaluronic acid / beauty serum → stays 30 seconds then rinsed, zero value | Don't pay extra for these |
| Limited-time new-customer price | Verify whether it's the regular price when comparing | Check regular price |

### B.3 Adjustment Rules

- **One change at a time**, verify for 3 days
- Oily skin: occlusives → hyaluronic acid / light lotion
- Acid at night: acid → wait 10 minutes → thick B5 → 15 minutes → blot excess → sleep
- **B5 thick application**: apply until visibly white, not thin and transparent; wait 15 minutes; wipe with damp tissue; leave thin layer; do not rinse
- **Azelaic acid + B5 order**: azelaic acid → wait 5–10 minutes until fully dry → then B5. **Do not apply B5 while acid is wet**; wet occlusion increases penetration depth and irritation risk
- **Azelaic acid tolerance build**:
  - Week 1: every other day, spot application (T-zone / acne areas)
  - Week 2: if no irritation → daily
  - Any stage with itch / sting → step back to previous frequency
- **Itch emergency**: tonight stop azelaic acid, cleanse + thin B5; if still itchy tomorrow → stop B5, cleanse only for 1–2 days until barrier recovers; then restart azelaic acid at lower frequency / spot application
- Cleanser: oily skin uses amino-acid, not soap / strong foam
- **Idle products**: occlusive creams (squalane) → store for peeling / winter / body use, not for oily-skin daily routine
- **Hand hygiene**: dirty hands touching face → bacteria / oil transfer → more acne, more oil

### B.4 Product Selection (Frugal Mode)

| Category | Baseline Choice | Price | Upgrade |
|----------|----------------|-------|---------|
| Amino-acid cleanser | 旁氏米粹 / 芙丽芳丝 / 多芬泡泡 / John Jeff 油橄榄慕斯 | ¥25–40 | Big-brand stability is enough |
| Azelaic acid | John Jeff 20% | ¥40–50 | 希川科颜 20% (lighter lotion texture, less irritation) |
| Sunscreen | Shake-well texture | ¥30–60 | Must use when going out |
| B5 | Any brand panthenol serum / cream | ¥30–80 | For repair |

**Don't pay for cleanser marketing ingredients**: ceramide / hyaluronic acid / olive leaf in cleanser doesn't stay on skin; rinsed away in 30 seconds.
**Don't stockpile**: buy when empty, no advance囤货, don't chase the perfect plan before starting.

#### Concentration Selection
- Oily skin, tolerant, goal "look clean" → 20% azelaic acid
- 10% / 15% only for: sensitive skin entry, or cannot tolerate 20%
- Already using 20% with no irritation → do not downgrade

### B.5 Facial Appearance (Non-Fat Factors)

| Source of "Looking Tired" | Check | Fix |
|---------------------------|-------|-----|
| Self-perception bias | Selfie (distortion) vs others' photos | Use rear camera at 1.5 m |
| Eye area | Sleep + warm compress | Not a product issue |
| Jawline | Shave every 2–3 days, no in-between | Not skincare |
| Expression habits | Relax brows and eyes | Practice: raise eyebrows, tongue on palate, tuck chin |
| Camera angle | Lens below eye level | Shoot from above eye level |

---

## Protocol C — Extending the Framework

New lifestyle domains (sleep, posture, dental, hair, etc.) should follow the same protocol structure:

1. **Diagnosis** — mandatory information checklist; pause if incomplete
2. **Common traps** — table of mistakes, manifestations, and fixes
3. **Adjustment rules** — one change at a time, 3-day verification
4. **Product / action selection** — frugal baseline + upgrade path
5. **Emergency protocols** — hunger, itch, pain, crash responses
6. **Lock execution** — binary confirmation, no open endings

When adding a new domain, create a labeled subsection (Protocol C, D, etc.) following the same format. Do not create a separate skill.
