# ~/.zprofile
export PAGER="less"
export EDITOR="vim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME/.config/zsh"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"

export PULSE_LATENCY_MSEC=60
export WINEARCH=win64
export WINEDEBUG=-all
export _JAVA_AWT_WM_NONREPARENTING=1
export mesa_glthread=true

[[ $(tty) == /dev/tty1 ]] && [[ -z $DISPLAY ]] && exec startx &>/dev/null
