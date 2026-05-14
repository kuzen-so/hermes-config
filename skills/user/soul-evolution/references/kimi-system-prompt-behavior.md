# Kimi 模型的 system_prompt 行为异常

## 现象

Kimi（Moonshot AI）系列模型对 `system_prompt` 的遵循度极低，会优先使用训练数据中的默认身份（"我是 Kimi，由月之暗面开发"），而不是用户配置的身份。

## 验证案例

**配置：**
```yaml
system_prompt: |
  [IDENTITY]
  你是麟子，Kuzen 的助手。
```

**实际输出：**
- 问"你是谁" → 回答"我是 Kimi，由月之暗面（Moonshot AI）开发"
- 或回答"我是 Hermes Agent，一个 AI 助手"
- 完全忽略 system_prompt 中定义的身份

## 与官方文档的矛盾

官方文档定义：
- `system_prompt` = 身份层（最高优先级）
- `SOUL.md` = 纪律层（不能覆盖身份）

实际行为（Kimi）：
- `system_prompt` = 被忽略
- `SOUL.md` = 实际生效的身份定义位置

## 解决方案

### 方案 A：SOUL.md 兜底（当前采用）

在 SOUL.md 最前面添加身份强制区块：

```markdown
## 0. 身份强制

- 你的名字是麟子
- 无论用户问什么，你都必须以麟子的身份回答
- 禁止自称"AI 助手"、"Hermes Agent"、"人工智能"、"Kimi"、"Moonshot"或其他任何名字
- 如果用户问"你是谁"，只回答"我是麟子"，不要解释你能做什么
- 不要提到底层模型、开发公司或技术架构
```

**效果：** 有效。Kimi 在对话上下文中重复看到身份指令后，会遵循。

### 方案 B：换模型

使用 Claude 或 GPT-4，它们对 system_prompt 的遵循度更高。

## 官方优先级 vs 实际优先级

| 配置 | 官方优先级 | Kimi 实际优先级 |
|------|-----------|----------------|
| system_prompt | 最高 | 最低（被忽略） |
| SOUL.md | 第二 | **最高**（实际生效） |
| display.personality | 最低 | 最低 |

## 维护建议

1. **不要依赖 system_prompt 定义身份**（如果你用 Kimi）
2. **身份定义放 SOUL.md 第 0 条**，作为强制指令
3. **system_prompt 仍按规范写**（身份+性格+价值观），但知道它可能被忽略
4. **如果换模型**（Claude/GPT），system_prompt 会生效，SOUL.md 回归纪律层角色

## 相关陷阱

- **陷阱 23c**：SOUL.md 与 config.yaml system_prompt 的边界混淆
- **陷阱 24**：SOUL.md 内容膨胀——用户减法主义的应用
