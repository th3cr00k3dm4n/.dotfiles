# Enable colors and change prompt:
autoload -U colors && colors
# History in cache directory:

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
#Git branch
autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:git*' formats ' ↣ (%F{254}%b%F{245})' # format $vcs_info_msg_0_
#Auto cd
setopt auto_cd

#alias
alias dwn="cd Downloads"
alias ll="ls -al"
alias dots="cd .dotfiles"
alias autoclean="./.scripts/cleanup.sh"


#import pywal colors
(cat ~/.cache/wal/sequences &)

#plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


./.scripts/fet.sh
PS1="%F{153}%(5~|%-1~/⋯/%3~|%4~)%F{245}↣ %{$reset_color%}%b "

