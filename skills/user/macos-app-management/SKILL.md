---
name: macos-app-management
description: macOS 软件安装、卸载、残留清理的完整工作流。覆盖 Homebrew、手动安装、App Store 应用，含残留文件定位和清理。
trigger: 用户说"安装"、"卸载"、"删除软件"、"清理残留"、"看看装了什么"、"软件管理"时加载
---

# macOS App Management — 软件管理工作流

## 核心原则

- 能 Homebrew 就不手动
- 卸载先查状态，再执行，再验证
- 残留清理必须做，不留垃圾
- sudo 操作需要用户手动执行或提供密码

## 执行步骤

### 1. 接收指令

用户说"安装/卸载/清理"时，确认目标软件名称。

### 2. 检查当前状态

**任何重新提问或重复指令时，先检查当前状态，再回答。**

```bash
# 查 Applications 目录
find /Applications ~/Applications -maxdepth 2 -iname "*<name>*" 2>/dev/null

# 查 Homebrew 安装列表
brew list --cask | grep -i <name>
```

### 3. 安装

**Homebrew 优先：**
```bash
brew install --cask <name>
```

**Homebrew 找不到时：**
- 搜索类似名称：`brew search <name>`
- 或让用户提供下载链接/手动安装

### 4. 卸载

**Homebrew 安装的应用：**
```bash
brew uninstall --cask <name>
```

**手动安装的应用（需要 sudo）：**
```bash
sudo rm -rf /Applications/<Name>.app
```

**注意：** 终端无法交互输入 sudo 密码。如果用户没有配置 SUDO_PASSWORD，需要：
1. 让用户在 Terminal 手动执行 `sudo rm -rf ...`
2. 或用户把密码发给我用 `echo '密码' | sudo -S ...`（系统可能阻止）
3. 或 Finder 拖到废纸篓

### 5. 检查残留

```bash
# 常见残留路径
find ~/Library -maxdepth 3 -iname "*<name>*" 2>/dev/null
find ~/Library/Containers -iname "*<bundle-id>*" 2>/dev/null
find ~/Library/Application\ Support -iname "*<name>*" 2>/dev/null
find ~/Library/Caches -iname "*<name>*" 2>/dev/null
find ~/Library/Preferences -iname "*<name>*" 2>/dev/null
```

### 6. 清理残留

```bash
rm -rf ~/Library/Application\ Support/<Vendor>/<Name>
rm -rf ~/Library/Caches/<bundle-id>
rm -rf ~/Library/Containers/<bundle-id>
rm -rf ~/Library/Preferences/<bundle-id>.plist
```

## 汇报格式

```
[当前状态]
- 已安装：xxx
- 未安装：xxx

[执行结果]
- 安装/卸载：成功/失败

[残留清理]
- 发现残留：X 处
- 已清理：X 处
```

## 陷阱

- **权限不足**：/Applications 下的应用删除需要 sudo，终端无法交互输密码
- **误删**：清理残留前先用 `find` 确认路径，不要猜
- **Homebrew 找不到**：可能是名字不同，用 `brew search` 找类似名
- **重新提问时先检查**：用户问"卸载了吗""还在吗""清理了吗"时，先用 `ls`/`find` 查文件是否存在，再回答。不凭记忆、不假设、不直接给之前的结论
- **sudo 密码无法管道输入**：系统会阻止 `echo '密码' | sudo -S`，不要尝试。让用户手动执行或提供 SUDO_PASSWORD 环境变量
- **App Store 应用**：卸载后残留通常在 `~/Library/Containers`，bundle ID 格式为 `com.vendor.appname`
