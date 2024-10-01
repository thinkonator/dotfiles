unclutter &
picom --daemon &
mpd &
dunst &
setbg &

# fix display colors + contrast
xrandr --output LVDS1 --brightness 1.4 --gamma 0.9:0.78:0.735 &

# turn off touchpad
xinput disable 'AlpsPS/2 ALPS GlidePoint' &

exec bspwm

