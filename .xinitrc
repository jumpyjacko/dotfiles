#!/bin/sh
setxkbmap -layout us -variant colemak

xrandr --output eDP1 --brightness 0.3

exec dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus
fcitx5 &

dwmbar &
dnoted &
exec dwm
