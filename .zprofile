# ~/.zprofile
PATH="/usr/lib/colorgcc/bin$(find "$HOME/.local/bin" -type d -printf ":%p"):$PATH"
export PATH
export PAGER="less"
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME/.config/zsh"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=qt5ct
export LIBVA_DRIVER_NAME=i965
export mesa_glthread=true

export WINEPREFIX="$HOME/.local/share/wine32"
export WINEARCH="win32"
export WINEDEBUG="-all"
export PULSE_LATENCY_MSEC=60

[[ $(tty) == /dev/tty1 ]] && [[ -z $DISPLAY ]] && exec startx &>/dev/null
