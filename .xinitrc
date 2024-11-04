# ~/.xinitrc
unclutter &
picom --daemon &
dunst &
setbg &

# fix display colors + contrast
display='LVDS1'
xrandr --output $display --brightness 1.4 --gamma 0.9:0.78:0.735 &
xgamma -gamma 0.9 &

# load Xresources
xrdb -merge ~/.Xresources &

# disable touchpad script
disable-touchpad &

# XDG autostart
dex --autostart &

exec bspwm
