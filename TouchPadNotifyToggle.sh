#!/bin/bash

# 自动获取 Touchpad 的设备 ID
Index=$(xinput | grep -i "Touchpad" | grep -Eo "id=[0-9]+" | cut -d= -f2)

# 检查是否找到触摸板
if [ -z "$Index" ]; then
  notify-send -i dialog-error "❌ Touchpad 未找到" "未检测到任何 Touchpad 设备"
  exit 1
fi

# 获取当前状态（1=启用，0=禁用）
enabled=$(xinput list-props "$Index" | grep "Device Enabled" | awk '{print $4}')

# 判断状态并切换
if [ "$enabled" -eq 1 ]; then
  xinput --disable "$Index"
  notify-send -i input-touchpad "📴 Touchpad 已关闭" "触摸板已禁用"
else
  xinput --enable "$Index"
  notify-send -i input-touchpad "🔧 Touchpad 已启用" "触摸板已重新启用"
fi
