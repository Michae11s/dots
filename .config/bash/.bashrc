#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export PATH=$PATH:$(echo ~/bin)


BLUE="\[$(tput setaf 12)\]"
GREEN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

export PS1="${GREEN} \w${RESET} \\$ "

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -a'

eval "$(thefuck --alias)"
echo ""
neofetch --config ~/.config/neofetch/rc.conf
