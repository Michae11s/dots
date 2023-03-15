#
# ~/.bashrc
#

source ~/.profile

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BLUE="\[$(tput setaf 12)\]"
GREEN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

export PS1="\h${GREEN} \w${RESET} \\$ "

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -a'
alias vim=nvim
alias clear='clear && source ~/.bashrc'
alias fg='feh --bg-max --randomize --recursive'

eval "$(thefuck --alias)"
echo ""
neofetch --config ~/.config/neofetch/rc.conf
