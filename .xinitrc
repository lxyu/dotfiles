#!/bin/sh

userresources=~/.Xresources
usermodmap=~/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

## middle button scroll
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
#xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
#xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.75
#
## disable trackpad
#xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Enabled' 0

# fix key repeat delay and rate
xset r rate 200 30

# restore wallpaper
# sh ~/.fehbg &

# sync clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# start some nice programs
urxvtd -q -o -f

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# firefox hw acceleration
export MOZ_USE_OMTC=1

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
exec i3
