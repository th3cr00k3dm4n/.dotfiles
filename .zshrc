

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}%~%{$fg[blue]%} →%{$reset_color%}%b "
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#alias
alias  ls="ls -al"
alias dwn="cd Downloads"



source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.scripts/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
