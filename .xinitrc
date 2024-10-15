unclutter &
picom --daemon &
mpd &
dunst &
setbg &

# fix display colors + contrast
xrandr --output LVDS1 --brightness 1.4 --gamma 0.9:0.78:0.735 &

# disable touchpad
disable-touchpad &

exec bspwm

