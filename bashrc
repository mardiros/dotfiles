#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


type fnm > /dev/null && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell bash)"
