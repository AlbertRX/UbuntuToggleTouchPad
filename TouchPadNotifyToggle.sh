#!/bin/bash

# 检测当前是否为 Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # GNOME Wayland 环境下使用 gsettings
    SCHEMA="org.gnome.desktop.peripherals.touchpad"
    KEY="send-events"
    
    # 获取当前状态 (enabled 为允许使用, disabled 为禁用)
    current=$(gsettings get $SCHEMA $KEY)

    if [ "$current" = "'enabled'" ]; then
        gsettings set $SCHEMA $KEY "disabled"
        notify-send -i input-touchpad "📴 Touchpad 已关闭" "Wayland 模式：触摸板已禁用"
    else
        gsettings set $SCHEMA $KEY "enabled"
        notify-send -i input-touchpad "🔧 Touchpad 已启用" "Wayland 模式：触摸板已启用"
    fi
else
    # 原有的 X11 逻辑
    Index=$(xinput | grep -i "Touchpad" | grep -Eo "id=[0-9]+" | cut -d= -f2)
    
    if [ -z "$Index" ]; then
        notify-send -i dialog-error "❌ Touchpad 未找到" "未检测到任何设备"
        exit 1
    fi

    enabled=$(xinput list-props "$Index" | grep "Device Enabled" | awk '{print $4}')

    if [ "$enabled" -eq 1 ]; then
        xinput --disable "$Index"
        notify-send -i input-touchpad "📴 Touchpad 已关闭" "X11 模式：触摸板已禁用"
    else
        xinput --enable "$Index"
        notify-send -i input-touchpad "🔧 Touchpad 已启用" "X11 模式：触摸板已启用"
    fi
fi
