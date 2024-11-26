# Caio's Z Shell
# Enable colors and change prompt:
autoload -U colors; colors # Load colors
PS1="%B%{$fg[magenta]%}%n@%M %{$fg[red]%}%~%{%}%{$reset_color%}   "

stty stop undef            # Disable ctrl-s to freeze terminal.

setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt correct             # auto correct mistakes
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# History in data directory:
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with spacea
setopt hist_verify            # show command with history expansion to user before running it

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/compdump"
_comp_options+=(globdots)               # Include hidden files.

# Load aliases if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# use vim as manpager
export MANPAGER='vim -M +MANPAGER "+set nonumber" -'

# configure keybindings
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# general keybinds
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# functions

# Remove orphan packages using pacman [Arch]
remove-orphans() {
    sudo pacman -Qdtq | sudo pacman -Rns -
}

# Use lf to switch directories and bind it to ctrl-o
lfcd() {
    tmp="$(mktemp -uq)"
    trap 'command rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    command lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(/sbin/cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' '^ulfcd\n'

# Bind opening bc to ctrl-a
bindkey -s '^a' '^ubc -lq\n'

# Time functions

# Stopwatch
swatch() {
    /usr/bin/time -p /sbin/cat
}

# Timer
timer() {
    [ -z $1 ] && echo "missing argument: timer (n) [s/m/h]" && return 1
    notify-send "⏱️ Starting timer (duration: $1)"
    timeout $1 cat
    notify-send "❗ Timer ended ❗"
}

# Countdown for New Years
cdown() {
    n=$1
    [ -z $n ] && n=60
    echo "$n" | figlet -c | lolcat; sleep 1
    while [[ $((--n)) > 0 ]]; do
        echo "$n" | figlet -c | lolcat; sleep 1
    done
}

# Change cursor shape for different vi modes.
zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() {
    echo -ne '\e[5 q' # Use beam shape cursor for each new prompt.
}
# set up pkgfile
. /usr/share/doc/pkgfile/command-not-found.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Load syntax highlighting; should be last.
. /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

/sbin/cat "$HOME/.cache/wal/sequences"

pfetch
