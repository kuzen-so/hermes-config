---
name: lifestyle-collection
description: |
  生活 skill 集合。包含健身、护肤、记录、记账四个子 skill。
  一个入口，无需切换。
triggers:
  - 用户问减脂、增肌、饮食、训练、蛋白粉、体重
  - 用户问护肤、洗面奶、壬二酸、防晒、脸油、长痘、脸痒
  - 用户说"记一下""记下来""先存着"
  - 用户说"记账""花了""收入""预算"
---

# Lifestyle Collection

生活优化集合。覆盖健身、护肤、记录、记账四个场景。

## 包含子 Skill

| 场景 | 触发词 | 调用 |
|------|--------|------|
| 健身 | 减脂、增肌、饮食、训练、蛋白粉、体重、饿了 | `skill_view('fitness-protocol')` |
| 护肤 | 护肤、洗面奶、壬二酸、防晒、脸油、长痘、脸痒 | `skill_view('skincare-protocol')` |
| 记录 | 记一下、记下来、先存着 | `skill_view('daily-log')` |
| 记账 | 记账、花了、收入、预算 | `skill_view('budget-tracker')` |

## 使用方式

用户直接说需求，无需切换 skill。Agent 根据关键词自动加载对应子 skill。
