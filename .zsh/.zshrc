
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




fpath=(~/.zsh/plugin/zsh-completions/src $fpath)
autoload -Uz compinit && compinit

source ~/.zsh/plugin/forgit/completions/git-forgit.zsh
source ~/.zsh/plugin/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/plugin/forgit/forgit.plugin.zsh
source ~/.zsh/plugin/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# show hidden files.
setopt globdots
source ~/.zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
# Plugin
source ~/.zsh/lscolors.zsh
# zsh-completions
#zstyle ':completion:*' menu select
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

# Uses LS_COLORS format
zstyle $pattern list-colors ${(s[:])LS_COLORS} '*.ext=1'



source "$HOME/.zsh/pluginrc.zsh"
# !! only interactive alias are included by .zshrc, others are loaded by .zshenv for all.
source "$HOME/.zsh/aliasrc_interactive.zsh"
