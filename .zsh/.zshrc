
# pokemon theme

#pokemon-colorscripts -r --no-title
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# apply dircolor theme
#eval "$(dircolors ~/.zsh/gruvbox.dircolors)"


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh/.zsh_history
setopt appendhistory


# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# Plugin
# zsh-completions
zstyle ':completion:*' menu select
fpath=($ZPLUG_DIR/zsh-completions/src $fpath)
autoload -Uz compinit && compinit

source $ZPLUG_DIR/dotbare/dotbare.plugin.zsh
# dotbare completion
_dotbare_completion_cmd
source $ZPLUG_DIR/forgit/completions/git-forgit.zsh
source $ZPLUG_DIR/forgit/forgit.plugin.zsh
export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"
source $ZPLUG_DIR/powerlevel10k/powerlevel10k.zsh-theme
source $ZPLUG_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZPLUG_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.zsh/pluginrc.zsh"
source "$HOME/.zsh/aliasrc"
# stash dotfiles on startup
dot add -u
