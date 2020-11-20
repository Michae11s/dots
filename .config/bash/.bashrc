#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=$PATH:$(echo ~/bin)


BLUE="\[$(tput setaf 12)\]"
RESET="\[$(tput sgr0)\]"

export PS1="${BLUE} \w${RESET} \\$ "

alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -a'

eval "$(thefuck --alias)"
neofetch --config ~/.config/neofetch/rc.conf