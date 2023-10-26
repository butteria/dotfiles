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
# use openssl aes-128-cbc encrypt or decrypt files.
# NOTICE: aes128 encryption will generate a suffix .aes128 and thus
# aes128 will not decrypt file without .aes128 suffix
aes128() {
    if [ -z $2 ] ; then
        echo "Usage:  aes128 [enc|dec] FILE."
    elif [ ! -f $2 ] ; then
        echo "No such file: $2."
    elif [ $1 = 'enc' ] ; then
        openssl enc -aes-128-cbc -K $AES_KEY -iv $AES_IV \
            -in $2  | tqdm --bytes --total `du -sb $2 | cut -f1` > $2.aes128
    elif [ $1 = 'dec' ] ; then
        decrypt_file=${2%.aes128}
        if [ $2 = $decrypt_file ] ; then
            echo "$decrypt_file is not encrypted file."
        elif [ -f $decrypt_file ] ; then
            echo "$decrypt_file file already exsits."
        else
            openssl aes-128-cbc -d -K $AES_KEY -iv $AES_IV \
                -in $2  | tqdm --bytes --total `du -sb $2 | cut -f1` > $decrypt_file
        fi
    else
        echo "Usage:  aes128 [enc|dec] FILE."
    fi
}

#  ╔═╗╦  ╦  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗
#  ║  ║  ║  ║  ║ ║║║║╠╣ ║║ ╦
#  ╚═╝╩═╝╩  ╚═╝╚═╝╝╚╝╚  ╩╚═╝
# MPV
alias mpv='/usr/bin/mpv --no-input-default-bindings'
# mpv with encode feature.
alias MPV='/usr/bin/mpv --hwdec=no --script=~/.config/mpv/manuals/encode.lua --script=~/.config/mpv/manuals/crop.lua'
# use mpv decode aes-128 encrypted video.
mpev() {
    sub_file="${1%%.*}.srt"
    if [ -f $sub_file ] ; then
        echo "[mpev] $sub_file subtitle detected."
        /usr/bin/mpv lavf://crypto:$1 --stream-lavf-o=key=$AES_KEY,iv=$AES_IV --sub-file=$sub_file
    else
        echo "[mpev] no subtitle files detected."
        /usr/bin/mpv lavf://crypto:$1 --stream-lavf-o=key=$AES_KEY,iv=$AES_IV
    fi
}
# FFMPEG
alias ffmpeg='ffmpeg -hide_banner '


# Changing "ls" to "exa" with icons
alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -alF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa -F --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'
