#!/bin/bash

# 获取 Touchpad 的 ID
Index=$(xinput | grep -i "Touchpad" | grep -Eo "id=[0-9]+" | cut -d= -f2)

# 检查是否成功获取 ID
if [ -z "$Index" ]; then
  echo "❌ 未找到 Touchpad 设备"
  exit 1
fi

# 获取当前启用状态（1=启用，0=禁用）
enabled=$(xinput list-props "$Index" | grep "Device Enabled" | awk '{print $4}')

# 切换状态
if [ "$enabled" -eq 0 ]; then
  xinput --enable "$Index"
  echo "✅ Touchpad 已启用"
else
  xinput --disable "$Index"
  echo "📴 Touchpad 已禁用"
fi
