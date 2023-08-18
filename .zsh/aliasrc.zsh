# extr - archive extractor
# usage: extr <file>
extr ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# use tqdm to show progress bar on terminal.
# use openssl aes-128 encode video.
mpvenc() {
    openssl enc -aes-128-cbc -K $AES_KEY -iv $AES_IV \
        -in $1  | tqdm --bytes --total `du -sb $1 | cut -f1` > $1.enc
}

# use mpv decode aes-128 encrypted video.
mpvdec() {
    if [ $(file $1 | cut -d ' ' -f2) != "data" ] ;
    then
        echo -e "\033[0;31mno encrypted file, exit."
        return -1
    fi
    mpv lavf://crypto:$1 --stream-lavf-o=key=$AES_KEY,iv=$AES_IV
}

# use git bare to manage linux dotfiles.
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree $HOME"


# Changing "ls" to "exa" with icons
alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -alF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa -F --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

alias vi="vim"
alias pacman="sudo pacman"
alias calendar="cal"
alias zshrc="$EDITOR ~/.zsh/.zshrc"
alias vimrc="$EDITOR ~/.vim/vimrc"
alias kittyrc="$EDITOR ~/.config/kitty/kitty.conf"
alias aliasrc="$EDITOR ~/.zsh/aliasrc.zsh"
alias svim="sudo -E vim"
alias ..="cd .."
alias ~="cd ~"
alias cls="clear"

# replace rm with trash-cli
alias rm="trash-put"
alias rl="trash-list"

# use todo-txt cli to act as memo
alias todo='todo.sh'
