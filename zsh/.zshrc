HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

setopt appendhistory autocd nomatch notify inc_append_history hist_expire_dups_first
unsetopt beep extendedglob
bindkey -v

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

source $HOME/.antigen.zsh
unsetopt BG_NICE

antigen use oh-my-zsh

antigen bundle git
antigen bundle lein
antigen bundle vi-mode
antigen bundle docker
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme candy

antigen apply

alias tmux="tmux -2"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
eval $THEME
