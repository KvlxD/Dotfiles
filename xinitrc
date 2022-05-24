#!/bin/sh


### MY ADDS ###
# bash $HOME/.config/.dwm/.fehbg
# nitrogen --restore &
# xset r rate 350 75 &
# setxkbmap -option caps:escape &
# xrandr --setprovideroutputsource modesetting NVIDIA-0 
# xrandr --auto 
# picom -b &
# xrandr --output HDMI-0 --mode 1920x1080 --rate 144 
# xrandr --output eDP-1-1 --off  
# kitty -e sudo intel-undervolt apply
# flameshot &
# pnmixer &
# nvidia-settings --load-config-only &
# brightnessctl -d "intel_backlight" set 0% &

export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=x11
exec awesome 
