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

需要配置具体的 vision provider 和 API key：

```bash
hermes config set vision.provider openai
hermes config set vision.model gpt-4o
hermes config set vision.api_key $OPENAI_API_KEY
```

或：

```bash
hermes config set vision.provider google
hermes config set vision.model gemini-pro-vision
hermes config set vision.api_key $GOOGLE_API_KEY
```

## 影响

- 微信对话中的图片无法被碎片归纳提取
- 用户发送截图时 AI 无法读取
- 日报生成时可能遗漏图片中的关键信息

## 检测

```bash
hermes tools list | grep vision
```

若显示 `✓ enabled vision` 但无法解析图片，检查 config.yaml 的 vision 段。

## 相关

- `hermes-agent` 技能的 Toolsets 表格：`vision` 是独立 toolset
- 配置文档：https://hermes-agent.nousresearch.com/docs/user-guide/configuration
