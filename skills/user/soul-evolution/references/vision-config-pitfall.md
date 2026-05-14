# Vision 配置陷阱

## 问题

用户通过消息平台（微信）发送图片，但 AI 无法解析内容。

## 根因

`~/.hermes/config.yaml` 中 vision 配置为空：

```yaml
vision:
    provider: auto
    model: ''
    base_url: ''
    api_key: ''
    timeout: 120
```

`provider: auto` 无法工作，因为 model/api_key 都未设置。

## 解决

配置 auxiliary vision provider（不是顶层 `vision` 段）：

```bash
hermes config set auxiliary.vision.provider openrouter
hermes config set auxiliary.vision.model anthropic/claude-sonnet-4
```

或：

```bash
hermes config set auxiliary.vision.provider google
hermes config set auxiliary.vision.model gemini-2.5-flash
```

**关键：API key 必须在 `.env` 文件或环境变量中可用。**

仅设置 provider/model 不够。若报错 "No LLM provider configured for task=vision provider=X"，说明 key 未找到。检查：

```bash
grep OPENROUTER_API_KEY ~/.hermes/.env
grep GOOGLE_API_KEY ~/.hermes/.env
```

若为空或被注释，填入 key 后重新测试。

## 影响

- 微信对话中的图片无法被碎片归纳提取
- 用户发送截图时 AI 无法读取
- 日报生成时可能遗漏图片中的关键信息

## 检测

```bash
hermes config | grep -A 5 "auxiliary:"
```

检查 `auxiliary.vision` 段，不是顶层 `vision`。

## 平台自动解析回退

当 `browser_vision` 或 `vision_analyze` 工具不可用时，消息平台（如微信）可能自带图片解析能力，自动提取图像内容注入对话上下文。这不是 AI vision 工作，而是平台预处理。若看到 "[The user sent an image~ Here's what I can see...]" 但自己没有调用 vision 工具，说明平台已解析，可直接使用其输出。

## 相关

- `hermes-agent` 技能的 Toolsets 表格：`vision` 是独立 toolset，但实际由 `auxiliary.vision` 配置驱动
- 配置文档：https://hermes-agent.nousresearch.com/docs/user-guide/configuration

## 相关

- `hermes-agent` 技能的 Toolsets 表格：`vision` 是独立 toolset
- 配置文档：https://hermes-agent.nousresearch.com/docs/user-guide/configuration
