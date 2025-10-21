
# UbuntuToggleTouchPad

## 🔧 简介

这是一个为 Ubuntu（及基于 Debian 的发行版）设计的轻量脚本。脚本会自动检测触控板（Touchpad）设备并在启用/禁用之间切换，适合希望快速控制触控板状态的笔记本用户。

---

## ✅ 特性

- 自动检测名称中包含 “Touchpad” 的设备，无需手动查找设备 ID。
- 提供两个脚本：无通知版和带通知版（使用 `notify-send`）。
- 依赖极少：仅需要 `xinput`（大多数系统默认安装）。通知版还需 `notify-send`（通常由 `libnotify-bin` 提供）。
- 简洁、开箱即用、面向终端用户。

---

## 🛠 安装与使用

### 克隆仓库 / 下载脚本

```bash
git clone https://github.com/AlbertRX/UbuntuToggleTouchPad.git
cd UbuntuToggleTouchPad
```

### 授予执行权限

```bash
chmod +x TouchPad.sh
chmod +x TouchPadNotifyToggle.sh
```

### 运行脚本

- 基本版（无通知）：

```bash
./TouchPad.sh
```

- 带通知版（推荐）：

```bash
./TouchPadNotifyToggle.sh
```

可选：将脚本绑定到快捷键（系统设置 → 键盘 → 自定义快捷键），命令填写为脚本的绝对路径，例如 `~/UbuntuToggleTouchPad/TouchPadNotifyToggle.sh`。

---


## 🎯 系统兼容性 & 要求

- 操作系统：Ubuntu 或其他基于 Debian 的发行版。
- 要求：已安装 `xinput`。
- 通知脚本需要 `notify-send`（通常由 `libnotify-bin` 提供）。
- 触控板设备在 `xinput` 列表中需包含 “Touchpad” 字样，以便脚本自动检测。

---

## 🧑‍💻 贡献方式

欢迎提出 Issues 或 Pull Requests：

- 提出新功能建议（例如支持更多触控板品牌、更智能的检测逻辑、桌面环境自适应）。
- 报告脚本检测失败或通知异常的问题。
- 提交改善脚本可移植性和可读性的补丁。

---

## 📄 许可证

本项目采用 MIT 许可证。详见 `LICENSE` 文件。简而言之：你可以自由使用、修改和分发代码，但请保留原作者署名。

---

感谢你使用 UbuntuToggleTouchPad！如果有问题或建议，请打开 issue。我们一起把它做得更好 👍
