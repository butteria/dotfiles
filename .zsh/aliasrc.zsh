# use figlet to draw awesome ascii font on terminal.
# use boxen-cli to draw boxes on terminal.
alias figletmain='figlet -f "ANSI Shadow.flf"'
alias figletsub='figlet -f "Calvin S.flf"'
alias boxensub='boxen --border-style=single'
alias titlesub='figletsub | boxensub'

# use fzf and nmcli to connect network.
alias fzfnet="$HOME/.local/scripts/nmcli_choose"


# use git bare to manage linux dotfiles.
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree $HOME"

# use vim or neovim as default editor with EDITOR environment.
alias vi="$EDITOR"
alias vim="$EDITOR"

alias zat="zathura"


alias pacman="sudo pacman"
alias calendar="cal"
alias zshrc="$EDITOR ~/.zsh/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias kittyrc="$EDITOR ~/.config/kitty/kitty.conf"
alias aliasrc="$EDITOR ~/.zsh/aliasrc.zsh"
alias svim="sudo -E $EDITOR"
alias ..="cd .."
alias ~="cd ~"
alias cls="clear"

# replace rm with trash-cli
alias rm="trash-put"
alias rl="trash-list"

# use todo-txt cli to act as memo
alias todo='todo.sh'
