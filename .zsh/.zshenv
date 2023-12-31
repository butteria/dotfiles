# use printenv commmand to print all env variable
# use neovim in gui and vim in tty mode.
[[ -n $DISPLAY ]] && EDITOR="nvim" || EDITOR="vim"
export EDITOR
export QT_QPA_PLATFORM=wayland

export ARCHFLAGS="-arch x86_64"
# add environment path here.
export PATH="$PATH:$HOME/.local/scripts:$FORGIT_INSTALL_DIR/bin:$HOME/.local/bin"
export TERMINFO='/usr/share/terminfo/'
export TERM='screen-256color'

# use bat colored man page
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-P -c"

# gruvbox fzf theme.
export FZF_THEME='
--color=dark
--color=fg:#ebdbb2
--color=bg:#282828
--color=hl:#fabd2f
--color=fg+:#ebdbb2
--color=bg+:#665c54
--color=hl+:#fabd2f
--color=gutter:#282828
--color=info:#d65d0e
--color=separator:#282828
--color=border:#e7d7ad
--color=label:#eebd35
--color=prompt:#7fa2ac
--color=spinner:#fabd2f
--color=pointer:bold:#fabd2f
--color=marker:#cc241d
--color=header:#d65d0e
--color=preview-fg:#ebdbb2
--color=preview-bg:#282828
'
export FZF_DEFAULT_OPTS="${FZF_THEME}
--cycle
--no-hscroll
--reverse
"

# mpv encode
#export AES_KEY="6e17aa64249d64b9f17758d7a44ad659"
#export AES_IV="1c1d79dd08ea6f8f16475779ca045774"

export AES_KEY="01234567891011121314151617181920"
export AES_IV="20191817161514131211109876543210"
source $HOME/.zsh/aliasrc.zsh
