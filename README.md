# Ubuntu TouchPad Control Script

一个用于 Ubuntu 系统的智能触控板控制脚本，能够自动检测触控板设备并实现快速开关控制。

## 功能特性

- 🔍 **自动检测**: 动态识别系统中的触控板设备ID，无需手动配置
- 🔄 **智能切换**: 支持开启、关闭和切换触控板状态
- 📊 **状态查询**: 实时显示触控板设备信息和当前状态
- 🎨 **友好界面**: 彩色输出，操作反馈清晰直观
- 🛡️ **错误处理**: 完善的错误检测和提示机制

## 系统要求

- Ubuntu 系统（或其他基于 Debian 的 Linux 发行版）
- `xinput` 工具（用于控制输入设备）

如果系统未安装 `xinput`，可以使用以下命令安装：

```bash
sudo apt-get install xinput
```

## 使用方法

### 快速开始

1. 克隆本仓库：
```bash
git clone https://github.com/AlbertRX/UbunttuTouchPad.git
cd UbunttuTouchPad
```

2. 赋予脚本执行权限：
```bash
chmod +x TouchPad.sh
```

3. 运行脚本：
```bash
./TouchPad.sh
```

### 命令选项

```bash
./TouchPad.sh [选项]
```

#### 可用选项：

- `on` 或 `enable` - 启用触控板
- `off` 或 `disable` - 禁用触控板
- `toggle` - 切换触控板状态（默认行为）
- `status` - 显示触控板详细信息和当前状态
- `-h` 或 `--help` - 显示帮助信息

### 使用示例

```bash
# 切换触控板状态（开启/关闭）
./TouchPad.sh

# 或者明确指定切换
./TouchPad.sh toggle

# 关闭触控板
./TouchPad.sh off

# 开启触控板
./TouchPad.sh on

# 查看触控板状态
./TouchPad.sh status
```

## 高级配置

### 创建快捷命令

可以将脚本移动到系统路径或创建软链接，实现全局调用：

```bash
# 方法1: 复制到 /usr/local/bin
sudo cp TouchPad.sh /usr/local/bin/touchpad
sudo chmod +x /usr/local/bin/touchpad

# 方法2: 创建软链接
sudo ln -s $(pwd)/TouchPad.sh /usr/local/bin/touchpad

# 之后可以直接使用
touchpad toggle
```

### 设置键盘快捷键

在 Ubuntu 系统设置中，可以将脚本绑定到快捷键：

1. 打开 **设置** → **键盘** → **自定义快捷键**
2. 添加新的快捷键
3. 命令设置为脚本的完整路径，例如：`/home/用户名/UbunttuTouchPad/TouchPad.sh toggle`
4. 设置您喜欢的快捷键组合，如 `Ctrl+F9`

## 工作原理

该脚本通过以下步骤实现触控板控制：

1. 使用 `xinput list` 命令列出所有输入设备
2. 通过设备名称关键词（如 "TouchPad"、"Synaptics"、"TrackPad" 等）智能匹配触控板设备
3. 提取设备 ID 用于后续操作
4. 使用 `xinput enable/disable` 命令控制设备状态
5. 通过 `xinput list-props` 查询设备当前状态

## 故障排除

### 问题：脚本提示找不到触控板

**解决方案**：
1. 运行 `xinput list` 查看所有输入设备
2. 确认触控板设备名称
3. 如果设备名称特殊，可以修改脚本中的 `find_touchpad_id()` 函数，添加相应的匹配规则

### 问题：没有权限执行脚本

**解决方案**：
```bash
chmod +x TouchPad.sh
```

### 问题：xinput 命令不存在

**解决方案**：
```bash
sudo apt-get update
sudo apt-get install xinput
```

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

## 许可证

本项目采用 MIT 许可证。详见 LICENSE 文件。

## 作者

AlbertRX

---

**注意**: 该脚本主要针对 Ubuntu 和基于 X11 的桌面环境。如果您使用 Wayland，可能需要不同的实现方式。
