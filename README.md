# Hermes Config

个人 Hermes Agent 配置备份。

## 包含内容

- `SOUL.md` — 人设定义
- `skills/user/` — 自定义技能

## 安装到新机器

```bash
# 1. 克隆仓库
git clone https://github.com/yourname/hermes-config.git

# 2. 复制 SOUL.md
cp hermes-config/SOUL.md ~/.hermes/SOUL.md

# 3. 复制自定义技能
mkdir -p ~/.hermes/skills/user
cp -r hermes-config/skills/user/* ~/.hermes/skills/user/

# 4. 验证
hermes skills_list --category user
```

## 注意事项

- **不要上传 `config.yaml`** — 包含 API key 等敏感信息
- **不要上传 `.env`** — 包含密码和 token
- 内置技能由 Hermes 自动管理，不需要备份
- `scripts/` 如有自定义脚本，需额外复制

## 更新流程

本地修改后：
```bash
cp ~/.hermes/SOUL.md /path/to/hermes-config/
cp -r ~/.hermes/skills/user/* /path/to/hermes-config/skills/user/
cd /path/to/hermes-config
git add .
git commit -m "update: YYYY-MM-DD"
git push
```
