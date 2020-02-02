# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export PATH="$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/bin:$PATH"

bindkey -v
setopt appendhistory autocd nomatch notify inc_append_history hist_expire_dups_first
unsetopt beep extendedglob
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
unsetopt BG_NICE
alias tmux="tmux -2"

source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
	zgen oh-my-zsh
	zgen oh-my-zsh plugins/command-not-found
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/sudo
	zgen oh-my-zsh plugins/virtualenvwrapper
	zgen load romkatv/powerlevel10k powerlevel10k
	zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
