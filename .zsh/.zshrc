# pokemon theme
pokemon-colorscripts -r --no-title
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export NNN_PLUG='p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh/.zsh_history
setopt appendhistory


# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh


# Plugin
source $ZPLUGIN/powerlevel10k/powerlevel10k.zsh-theme
source $ZPLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZPLUGIN/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZPLUGIN/dotbare/dotbare.plugin.zsh

# enable the tab-completion menu
zstyle ':completion:*' menu select

fpath=($ZPLUGIN/zsh-completions/src $fpath)
autoload -Uz compinit && compinit

# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"
[ -f "$HOME/.zsh/pluginrc" ] && source "$HOME/.zsh/pluginrc"
