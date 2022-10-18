#!/bin/sh
setxkbmap -layout us -variant colemak

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus
fcitx5 &

dwmbar &
exec dwm
