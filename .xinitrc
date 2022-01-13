setxkbmap -layout us -variant colemak

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx5 &

dwmbar &
exec dwm
