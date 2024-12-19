# ~/.xinitrc
unclutter &
picom --daemon &
dunst &
daybg

# adjust display brightness & colors
display='LVDS1'
xrandr --output $display --brightness 1.15 --gamma 0.9:0.78:0.735 &
xgamma -gamma 1.0 &

# load Xresources
xrdb -merge ~/.Xresources &

# disable touchpad script
disable-touchpad &

# XDG autostart
dex --autostart &

xhost +local: &

exec bspwm
