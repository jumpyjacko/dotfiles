#!/bin/sh
setxkbmap -layout us -variant colemak

xrandr --output eDP1 --brightness 0.3

exec dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus
export QT_AUTO_SCREEN_SCALE_FACTOR=0

export WINEPREFIX=~/.local/share/bottles/bottles/SpitfireAudioApp
export WINELOADER=~/.local/share/bottles/runners/soda-9.0-1/bin/wine
fcitx5 &

dwmbar &
dunst &
exec dwm
