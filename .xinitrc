# ~/.xinitrc
unclutter &
picom --daemon &
dunst &
setbg &

# fix display colors + contrast
xrandr --output LVDS1 --brightness 1.4 --gamma 0.9:0.78:0.735 &
xgamma -gamma 0.9 &

# disable touchpad
disable-touchpad &

# autostart
dex --autostart &

exec bspwm
