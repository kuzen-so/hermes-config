# 专业视频/音频软件卸载扫描清单

以 Final Cut Pro + Motion + 插件（ColorFinale、motionVFX 等）为例，展示完整扫描路径和命令。

## 扫描命令（一次性执行）

```bash
# 1. Applications
echo "=== 1. Applications ===" && ls -la /Applications/ | grep -iE "motion|final|color"

# 2. User Application Support
echo "=== 2. User App Support ===" && ls -la ~/Library/Application\ Support/ | grep -iE "motion|final|color"

# 3. System Application Support
echo "=== 3. System App Support ===" && ls -la /Library/Application\ Support/ | grep -iE "motion|final|color"

# 4. User Preferences
echo "=== 4. User Preferences ===" && ls -la ~/Library/Preferences/ | grep -iE "motion|final|color"

# 5. System Preferences
echo "=== 5. System Preferences ===" && ls -la /Library/Preferences/ | grep -iE "motion|final|color"

# 6. FxPlug / Audio Plugins
echo "=== 6. FxPlug ===" && find /Library/Plug-Ins -name "*.fxplug" -o -name "*Lut*" -o -name "*mlut*" 2>/dev/null && find ~/Library/Plug-Ins -name "*.fxplug" 2>/dev/null

# 7. Motion Templates
echo "=== 7. Motion Templates ===" && ls -la ~/Movies/Motion\ Templates.localized/ 2>/dev/null

# 8. Sandbox Containers
echo "=== 8. Containers ===" && ls -la ~/Library/Containers/ | grep -iE "final|motion|color"

# 9. Group Containers
echo "=== 9. Group Containers ===" && ls -la ~/Library/Group\ Containers/ | grep -iE "final|motion|color"

# 10. Caches
echo "=== 10. Caches ===" && find ~/Library/Caches -maxdepth 1 -iname "*final*" -o -iname "*motion*" -o -iname "*color*" 2>/dev/null

# 11. Size summary
echo "=== Size Summary ===" && du -sh /Applications/Final\ Cut\ Pro.app /Applications/Motion.app /Applications/ColorFinale.app 2>/dev/null && du -sh ~/Library/Application\ Support/Final\ Cut\ Pro ~/Library/Application\ Support/Motion ~/Library/Application\ Support/ColorFinale 2>/dev/null && du -sh /Library/Application\ Support/Final\ Cut\ Pro /Library/Application\ Support/ColorFinale 2>/dev/null && du -sh ~/Movies/Motion\ Templates.localized 2>/dev/null && du -sh ~/Library/Containers/com.apple.FinalCut ~/Library/Containers/com.apple.motionapp 2>/dev/null
```

## 典型发现（Final Cut Pro + Motion + ColorFinale + motionVFX）

| 路径 | 大小 | 权限 |
|------|------|------|
| /Applications/Final Cut Pro.app | ~6G | root |
| /Applications/Motion.app | ~3G | root |
| /Applications/ColorFinale.app | ~144M | root |
| /Applications/motionVFX | ~135M | root |
| /Library/Application Support/Final Cut Pro | ~1.3G | root |
| /Library/Application Support/ColorFinale | ~5M | root |
| /Library/Plug-Ins/FxPlug/mLut.fxplug | 0B | root |
| ~/Movies/Motion Templates.localized | ~436M | user |
| ~/Library/Containers/com.apple.FinalCut | ~68M | user |
| ~/Library/Application Support/Motion | ~856K | user |
| ~/Library/Application Support/ColorFinale | ~432K | user |

## 删除命令（给用户手动执行）

**需要 sudo（系统级）：**
```bash
sudo rm -rf /Applications/Final\ Cut\ Pro.app
sudo rm -rf /Applications/Motion.app
sudo rm -rf /Applications/ColorFinale.app
sudo rm -rf /Applications/motionVFX
sudo rm -rf /Library/Application\ Support/Final\ Cut\ Pro
sudo rm -rf /Library/Application\ Support/ColorFinale
sudo rm -rf /Library/Plug-Ins/FxPlug/mLut.fxplug
```

**用户级（可直接执行）：**
```bash
rm -rf ~/Library/Application\ Support/Final\ Cut\ Pro
rm -rf ~/Library/Application\ Support/Motion
rm -rf ~/Library/Application\ Support/ColorFinale
rm -rf ~/Library/Application\ Support/com.colorfinale.Utils
rm -rf ~/Library/Containers/com.apple.FinalCut
rm -rf ~/Library/Containers/com.apple.motionapp
rm -rf ~/Library/Containers/com.colorfinale.ColorFinaleFxPlug
rm -rf ~/Library/Containers/com.motionVFX.mOSC-XPC
rm -rf ~/Library/Group\ Containers/PTN9T2S29T.com.apple.VAWorkspaceMotion
rm -rf ~/Movies/Motion\ Templates.localized
rm -f ~/Library/Preferences/com.apple.FinalCut.plist
rm -f ~/Library/Preferences/com.colorfinale.*
rm -f ~/Library/Preferences/com.motionvfx.*
```

## 注意事项

- `~/Library/Containers/` 下的目录即使通过 `osascript` 提权也无法删除（SIP 保护），但用户级 `rm -rf` 通常可以
- Motion Templates 包含用户下载/安装的第三方模板，删除前确认不再需要
- 部分插件可能安装在 `~/Library/Plug-Ins/` 或 `/Library/Plug-Ins/`，注意大小写（Plug-Ins vs Plug-ins）
