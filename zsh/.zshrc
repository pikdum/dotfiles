# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# install zgenom
if [[ ! -r "${HOME}/.zgenom" ]]; then
	git clone --depth 1 https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

export EDITOR='emacs -nw'
export PATH="/opt/rocm/bin:$HOME/.config/emacs/bin:$HOME/.local/bin:$HOME/bin:$PATH"

bindkey -v
setopt appendhistory autocd nomatch notify inc_append_history hist_expire_dups_first
unsetopt beep extendedglob
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
unsetopt BG_NICE
alias tmux="tmux -2"

source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate
if ! zgenom saved; then
	zgenom oh-my-zsh
	zgenom oh-my-zsh plugins/command-not-found
	zgenom oh-my-zsh plugins/docker
	zgenom oh-my-zsh plugins/fzf
	zgenom oh-my-zsh plugins/sudo
	zgenom oh-my-zsh plugins/virtualenvwrapper
	zgenom load romkatv/powerlevel10k powerlevel10k
	zgenom load zsh-users/zsh-autosuggestions
	zgenom load zsh-users/zsh-completions
	zgenom load zsh-users/zsh-syntax-highlighting
	zgenom save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^ ' autosuggest-accept

. "$HOME/.cargo/env"
