# forgit
export FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--cycle
--reverse
--height '100%'
"
export DOTBARE_FZF_DEFAULT_OPTS=$FORGIT_FZF_DEFAULT_OPTS

export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"

export FORGIT_LOG_FORMAT='%C(auto)%h%d  %s %C(yellow)%cr%Creset'

#--color info:108,prompt:109,spinner:108,pointer:168,marker:168
export FZF_DEFAULT_OPTS='
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'
