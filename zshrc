# Lines configured by zsh-newuser-install
HISTFILE=~/.local/histfile
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history autocd nomatch notify extended_history

bindkey -v

bindkey '\e[1~' beginning-of-line
bindkey '\e[2~' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line
bindkey '\177' backward-delete-char

bindkey "\e[7~" beginning-of-line
bindkey "\e[H" beginning-of-line
#bindkey "\e[2~" transpose-words
bindkey "\e[8~" end-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

bindkey ';5C' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^R' history-incremental-search-backward

zstyle :compinstall filename '/home/guillaume/.zshrc'

autoload -U colors && colors

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=5
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -U +X bashcompinit && bashcompinit
type nomad > /dev/null && complete -o nospace -C /usr/bin/nomad nomad

. ~/.config/git-prompt.zsh
. ~/.config/aliases
. ~/.config/vars

PS1='%B%{$fg[green]%}%n%{$reset_color%}:%B%{$fg[blue]%}%~%{$reset_color%} $(git_prompt_string)%{$fg[green]%} 𝝿 %{$reset_color%}'
eval "$(starship init zsh)"

# source ~/.ssh-reagent
# ssh-reagent
# gnome-keyring-daemon -s > .ssh-agent
# source .ssh-agent
# export SSH_AUTH_SOCK
# export GPG_AGENT_INFO



# Stop the CTRL+S/CTRL+Q feature
stty -ixoff
stty stop undef
stty start undef

